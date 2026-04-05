#include "snx_common.h"


static DECLARE_MUTEX(ser_port_sem);

#define SNX_HIGH_BITS_OFFSET	((sizeof(long)-sizeof(int))*8)
#define sunix_ser_users(state)	((state)->count + ((state)->info ? (state)->info->blocked_open : 0))


static const struct serial_uart_config snx_uart_config[PORT_SER_MAX_UART + 1] = 
{
    { "unknown",    1,      0 },
    { "8250",       1,      0 },
    { "16450",      1,      0 },
    { "16550",      1,      0 },
    { "16550A",     16,     UART_CLEAR_FIFO | UART_USE_FIFO },
    { "Cirrus",     1,    	0 },   
    { "ST16650",    1,    	0 },
    { "ST16650V2",  32,    	UART_CLEAR_FIFO | UART_USE_FIFO },   
    { "TI16750",    64,    	UART_CLEAR_FIFO | UART_USE_FIFO },   
};


#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)) 
static int							sunix_ser_refcount;
static struct tty_struct			*sunix_ser_tty[SNX_SER_TOTAL_MAX + 1];
static struct termios				*sunix_ser_termios[SNX_SER_TOTAL_MAX + 1];
static struct termios				*sunix_ser_termios_locked[SNX_SER_TOTAL_MAX + 1];
#endif


static _INLINE_ void snx_ser_handle_cts_change(struct snx_ser_port *, unsigned int);
static _INLINE_ void snx_ser_update_mctrl(struct snx_ser_port *, unsigned int, unsigned int);
static void     snx_ser_write_wakeup(struct snx_ser_port *);
static void     snx_ser_stop(struct tty_struct *);
static void     __snx_ser_start(struct tty_struct *);
static void     snx_ser_start(struct tty_struct *);
static void     snx_ser_tasklet_action(unsigned long);
static int      snx_ser_startup(struct snx_ser_state *, int);
static void     snx_ser_shutdown(struct snx_ser_state *);
static _INLINE_ void __snx_ser_put_char(struct snx_ser_port *, struct circ_buf *, unsigned char);
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))
static int      snx_ser_put_char(struct tty_struct *, unsigned char);
#else
static void     snx_ser_put_char(struct tty_struct *, unsigned char);
#endif
static void     snx_ser_flush_chars(struct tty_struct *);
static int      snx_ser_chars_in_buffer(struct tty_struct *);
static void     snx_ser_flush_buffer(struct tty_struct *);
static void     snx_ser_send_xchar(struct tty_struct *, char);
static void     snx_ser_throttle(struct tty_struct *);
static void     snx_ser_unthrottle(struct tty_struct *);
static int      snx_ser_get_info(struct snx_ser_state *, struct serial_struct *);
static int      snx_ser_set_info(struct snx_ser_state *, struct serial_struct *);
static int      snx_ser_write_room(struct tty_struct *);
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10))
static int      snx_ser_write(struct tty_struct *, const unsigned char *, int);
#else
static int      snx_ser_write(struct tty_struct *, int, const unsigned char *, int);
#endif
static int      snx_ser_get_lsr_info(struct snx_ser_state *, unsigned int *);
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
static int      snx_ser_tiocmget(struct tty_struct *, struct file *);
static int      snx_ser_tiocmset(struct tty_struct *, struct file *, unsigned int, unsigned int);
#else
static int      snx_ser_get_modem_info(struct snx_ser_state *, unsigned int *);
static int      snx_ser_set_modem_info(struct snx_ser_state *, unsigned int, unsigned int *);
#endif

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27))
static int      snx_ser_break_ctl(struct tty_struct *, int);
#else
static void     snx_ser_break_ctl(struct tty_struct *, int);
#endif
static int      snx_ser_wait_modem_status(struct snx_ser_state *, unsigned long);
static int      snx_ser_get_count(struct snx_ser_state *, struct serial_icounter_struct *);
static int      snx_ser_ioctl(struct tty_struct *, struct file *, unsigned int, unsigned long);
static void     snx_ser_hangup(struct tty_struct *);
unsigned int    snx_ser_get_divisor(struct snx_ser_port *, unsigned int);
unsigned int    snx_ser_get_baud_rate(struct snx_ser_port *, struct SNXTERMIOS *, struct SNXTERMIOS *, unsigned int, unsigned int);
static void     snx_ser_change_speed(struct snx_ser_state *, struct SNXTERMIOS *);
static void     snx_ser_set_termios(struct tty_struct *, struct SNXTERMIOS *);
static void     snx_ser_update_termios(struct snx_ser_state *);
static void     snx_ser_update_timeout(struct snx_ser_port *, unsigned int, unsigned int);
static struct   snx_ser_state *snx_ser_get(struct snx_ser_driver *, int);
static int      snx_ser_block_til_ready(struct file *, struct snx_ser_state *);
static void     snx_ser_wait_until_sent(struct tty_struct *, int);
static int      snx_ser_open(struct tty_struct *, struct file *);
static void     snx_ser_close(struct tty_struct *, struct file *);


static void         sunix_ser_set_mctrl(struct snx_ser_port *, unsigned int);
static unsigned int sunix_ser_tx_empty(struct snx_ser_port *);
static unsigned int sunix_ser_get_mctrl(struct snx_ser_port *);
static void         sunix_ser_stop_tx(struct snx_ser_port *, unsigned int);
static void         sunix_ser_start_tx(struct snx_ser_port *, unsigned int);
static void         sunix_ser_stop_rx(struct snx_ser_port *);
static void         sunix_ser_enable_ms(struct snx_ser_port *);
static void         sunix_ser_break_ctl(struct snx_ser_port *, int);
static int          sunix_ser_startup(struct snx_ser_port *);
static void         sunix_ser_shutdown(struct snx_ser_port *);
static unsigned int sunix_ser_get_divisor(struct snx_ser_port *, unsigned int);
static void         sunix_ser_set_termios(struct snx_ser_port *, struct SNXTERMIOS *, struct SNXTERMIOS *);
static void         sunix_ser_timeout(unsigned long);


static _INLINE_ void sunix_ser_receive_chars(struct sunix_ser_port *, unsigned char *);
static _INLINE_ void sunix_ser_transmit_chars(struct sunix_ser_port *);
static _INLINE_ void sunix_ser_check_modem_status(struct sunix_ser_port *, unsigned char);
static _INLINE_ void sunix_ser_handle_port(struct sunix_ser_port *, unsigned char);


extern int 		sunix_ser_interrupt(struct sunix_board *, struct sunix_ser_port *);
static void     sunix_ser_release_io(struct snx_ser_port *);
static void     sunix_ser_request_io(struct snx_ser_port *);
static void     sunix_ser_configure_port(struct snx_ser_driver *, struct snx_ser_state *, struct snx_ser_port *);
static void     sunix_ser_unconfigure_port(struct snx_ser_driver *, struct snx_ser_state *);
static int      sunix_ser_add_one_port(struct snx_ser_driver *, struct snx_ser_port *);
static int      sunix_ser_remove_one_port(struct snx_ser_driver *, struct snx_ser_port *);
extern int      sunix_ser_register_ports(struct snx_ser_driver *);
extern void     sunix_ser_unregister_ports(struct snx_ser_driver *);
extern int      sunix_ser_register_driver(struct snx_ser_driver *);
extern void     sunix_ser_unregister_driver(struct snx_ser_driver *);


static unsigned char READ_INTERRUPT_VECTOR_BYTE(struct sunix_ser_port *);
static unsigned int  READ_INTERRUPT_VECTOR_WORD(struct sunix_ser_port *);
static unsigned int  READ_1999_INTERRUPT_VECTOR_WORD(struct sunix_board *,struct sunix_ser_port *);
static unsigned char READ_UART_RX(struct sunix_ser_port *);
static unsigned char READ_UART_IIR(struct sunix_ser_port *);
static unsigned char READ_UART_LCR(struct sunix_ser_port *);
static unsigned char READ_UART_LSR(struct sunix_ser_port *);
static unsigned char READ_UART_MSR(struct sunix_ser_port *);
static void WRITE_UART_TX(struct sunix_ser_port *, unsigned char);
static void WRITE_UART_IER(struct sunix_ser_port *, unsigned char);
static void WRITE_UART_FCR(struct sunix_ser_port *, unsigned char);
static void WRITE_UART_LCR(struct sunix_ser_port *, unsigned char);
static void WRITE_UART_MCR(struct sunix_ser_port *, unsigned char);
static void WRITE_UART_DLL(struct sunix_ser_port *, int);
static void WRITE_UART_DLM(struct sunix_ser_port *, int);


static unsigned char READ_INTERRUPT_VECTOR_BYTE(struct sunix_ser_port *sp)
{
    unsigned char data;
    if (sp->port.vector)
    {
        data = inb(sp->port.vector);
        return data;
    }
    return 0;
}


static unsigned int READ_INTERRUPT_VECTOR_WORD(struct sunix_ser_port *sp)
{
  unsigned int data;
	unsigned int vet1;
	unsigned int vet2;
    if (sp->port.vector)
    {
			vet1 = inb(sp->port.vector);
			vet2 = inb(sp->port.vector + 1);
		
			vet2 <<= 8;		
      data = (vet1 | vet2);
      return data;
    }
    return 0;
}

static unsigned int READ_1999_INTERRUPT_VECTOR_WORD(struct sunix_board *sb,struct sunix_ser_port *sp)
{
  unsigned int data;
	unsigned int vet1;
	unsigned int vet2;
	unsigned int local_vector;
	
    if (sp->port.vector)
    {
			vet1 = inb(sp->port.vector);
			vet2 = inb(sp->port.vector + 1);					
		
			if (vet2 == 0x01)
			{
				local_vector = sb->bar_addr[1];				
				vet2 = inb(local_vector + 0x30); 
				vet2 <<= 4;				
			}	
			
			if (vet2 == 0x02)
			{
				local_vector = sb->bar_addr[1];				
				vet2 = inb(local_vector + 0x70);
				vet2 <<= 8;				
			}	
			if (vet2 == 0x04)
			{
				local_vector = sb->bar_addr[1];
				vet2 = inb(local_vector+0xb0); 	
				vet2 <<= 12;
			}	
											
      data = (vet1 | vet2);        
      
      return data;
    }
    return 0;
}



static unsigned char READ_UART_RX(struct sunix_ser_port *sp)
{
    unsigned char data;
    if (sp->port.iobase)
    {
        data = inb(sp->port.iobase + UART_RX);
        return data;
    }
    return 0;
}


static void WRITE_UART_TX(struct sunix_ser_port *sp, unsigned char data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_TX);
    }
}


static void WRITE_UART_IER(struct sunix_ser_port *sp, unsigned char data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_IER);
    }
}


static unsigned char READ_UART_IIR(struct sunix_ser_port *sp)
{
    unsigned char data;
    if (sp->port.iobase)
    {
        data = inb(sp->port.iobase + UART_IIR);
        return data;        
    }
    return 0;
}


static void WRITE_UART_FCR(struct sunix_ser_port *sp, unsigned char data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_FCR);
    }
}


static unsigned char READ_UART_LCR(struct sunix_ser_port *sp)
{
    unsigned char data;
    if (sp->port.iobase)
    {
        data = inb(sp->port.iobase + UART_LCR);
        return data;    
    }
    return 0;
}


static void WRITE_UART_LCR(struct sunix_ser_port *sp, unsigned char data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_LCR);
    }
}


static void WRITE_UART_MCR(struct sunix_ser_port *sp, unsigned char data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_MCR);
    }
}


static unsigned char READ_UART_LSR(struct sunix_ser_port *sp)
{
    unsigned char data;
    if (sp->port.iobase)
    {
        data = inb(sp->port.iobase + UART_LSR);
        return data;    
    }
    return 0;
}


static unsigned char READ_UART_MSR(struct sunix_ser_port *sp)
{
    unsigned char data;
    if (sp->port.iobase)
    {
        data = inb(sp->port.iobase + UART_MSR);
        return data;    
    }
    return 0;
}


static void WRITE_UART_DLL(struct sunix_ser_port *sp, int data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_DLL);
    }
}


static void WRITE_UART_DLM(struct sunix_ser_port *sp, int data)
{
    if (sp->port.iobase)
    {
        outb(data, sp->port.iobase + UART_DLM);
    }
}


static _INLINE_ void snx_ser_handle_cts_change(struct snx_ser_port *port, unsigned int status)
{
    struct snx_ser_info *info = port->info;
    struct tty_struct *tty = info->tty;
	
    port->icount.cts++;
    
    if (info->flags & SNX_UIF_CTS_FLOW) 
    {
        if (tty->hw_stopped) 
        {
			if (status) 
            {
                tty->hw_stopped = 0;
                sunix_ser_start_tx(port, 0);
                snx_ser_write_wakeup(port);
            }
        } 
        else 
        {
           	if (!status) 
           	{
               	tty->hw_stopped = 1;
               	sunix_ser_stop_tx(port, 0);
           	}
        }
    }
}


static _INLINE_ void snx_ser_update_mctrl(struct snx_ser_port *port, unsigned int set, unsigned int clear)
{
    unsigned long flags;
    unsigned int old;
    
    spin_lock_irqsave(&port->lock, flags);
    
    old = port->mctrl;
    port->mctrl = (old & ~clear) | set;

    if (old != port->mctrl)
    {
        sunix_ser_set_mctrl(port, port->mctrl);
    }
    spin_unlock_irqrestore(&port->lock, flags);
}


#define snx_set_mctrl(port, set)        snx_ser_update_mctrl(port, set, 0)
#define snx_clear_mctrl(port, clear)    snx_ser_update_mctrl(port, 0, clear)


static void snx_ser_write_wakeup(struct snx_ser_port *port)
{
    struct snx_ser_info *info = port->info;
    tasklet_schedule(&info->tlet);
}


static void snx_ser_stop(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;   
    unsigned long flags;
    int line = SNX_SER_DEVNUM(tty);
    
    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }

    state = tty->driver_data;
    port = state->port;
        
    spin_lock_irqsave(&port->lock, flags);
    sunix_ser_stop_tx(port, 1);
    spin_unlock_irqrestore(&port->lock, flags);
}


static void __snx_ser_start(struct tty_struct *tty)
{
    struct snx_ser_state *state = tty->driver_data;
    struct snx_ser_port *port = state->port;

    if (!snx_ser_circ_empty(&state->info->xmit) && state->info->xmit.buf && !tty->stopped && !tty->hw_stopped)
    {
        sunix_ser_start_tx(port, 1);
    }
}


static void snx_ser_start(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    //unsigned long flags;
    int line = SNX_SER_DEVNUM(tty);
    
    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }
   
    state = tty->driver_data;
    port = state->port; 
        
    //spin_lock_irqsave(&port->lock, flags);
    __snx_ser_start(tty);
    //spin_unlock_irqrestore(&port->lock, flags);
}


static void snx_ser_tasklet_action(unsigned long data)
{
    struct snx_ser_state *state = (struct snx_ser_state *)data;
    struct tty_struct *tty = NULL;

    tty = state->info->tty;
    if (tty) 
    {
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31)) 		
        if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) && tty->ldisc->ops->write_wakeup)
        {            
					tty->ldisc->ops->write_wakeup(tty);
				}    	
    	
#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27) && LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,30)) 		
{	
        if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) && tty->ldisc.ops->write_wakeup)
        {            
					tty->ldisc.ops->write_wakeup(tty);
				}
}
#else
        if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) && tty->ldisc.write_wakeup)
        {
					tty->ldisc.write_wakeup(tty);
				}
#endif					       
        wake_up_interruptible(&tty->write_wait);
    }
}


static int snx_ser_startup(struct snx_ser_state *state, int init_hw)
{
    struct snx_ser_info *info = state->info;
    struct snx_ser_port *port = state->port;
    unsigned long page;
    int retval = 0;

    if (info->flags & SNX_UIF_INITIALIZED)
    {
        return 0;
    }


    if (info->tty)
    {
        set_bit(TTY_IO_ERROR, &info->tty->flags);
    }
    
    
    if (port->type == PORT_UNKNOWN)
    {
        return 0;
    }
    

    if (!info->xmit.buf) 
    {
        page = get_zeroed_page(GFP_KERNEL);
        if (!page)
        {
            return -ENOMEM;
        }

        info->xmit.buf = (unsigned char *) page;
        info->tmpbuf = info->xmit.buf + SNX_UART_XMIT_SIZE;

        init_MUTEX(&info->tmpbuf_sem);
        snx_ser_circ_clear(&info->xmit);
    }
    
    retval = sunix_ser_startup(port);
    
    if (retval == 0) 
    {
        if (init_hw) 
        {
            snx_ser_change_speed(state, NULL);

            if (info->tty->termios->c_cflag & CBAUD)
            {
                snx_set_mctrl(port, TIOCM_RTS | TIOCM_DTR);
            }
        }

        info->flags |= SNX_UIF_INITIALIZED;

        clear_bit(TTY_IO_ERROR, &info->tty->flags);
    }


    if (retval && capable(CAP_SYS_ADMIN))
    {
        retval = 0;
    }

    return retval;
}


static void snx_ser_shutdown(struct snx_ser_state *state)
{
    struct snx_ser_info *info = state->info;
    struct snx_ser_port *port = state->port;

    if (!(info->flags & SNX_UIF_INITIALIZED))
    {
        return;
    }
    
    if (!info->tty || (info->tty->termios->c_cflag & HUPCL))
    {

        snx_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
    }

    wake_up_interruptible(&info->delta_msr_wait);

    sunix_ser_shutdown(port);

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))    
    synchronize_irq(port->irq);
#endif
    if (info->xmit.buf) 
    {
        free_page((unsigned long)info->xmit.buf);
        info->xmit.buf = NULL;
        info->tmpbuf = NULL;
    }

    tasklet_kill(&info->tlet);
    
    if (info->tty)
    {
        set_bit(TTY_IO_ERROR, &info->tty->flags);
    }
    
    info->flags &= ~SNX_UIF_INITIALIZED;
}


static _INLINE_ void __snx_ser_put_char(struct snx_ser_port *port, struct circ_buf *circ, unsigned char c)
{
    unsigned long flags;

    if (!circ->buf)
    {
        return;
    }

    spin_lock_irqsave(&port->lock, flags);
    
    if (snx_ser_circ_chars_free(circ) != 0) 
    {
        circ->buf[circ->head] = c;
        circ->head = (circ->head + 1) & (SNX_UART_XMIT_SIZE - 1);
    }
    spin_unlock_irqrestore(&port->lock, flags);
}


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))
static int  snx_ser_put_char(struct tty_struct *tty, unsigned char ch)
#else
static void snx_ser_put_char(struct tty_struct *tty, unsigned char ch)
#endif
{
    struct snx_ser_state *state = NULL;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))	
        return 0;
#else
		return;
#endif				
    }

    state = tty->driver_data;
    __snx_ser_put_char(state->port, &state->info->xmit, ch);
	
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,26))	
	return 0;
#endif	
}


static void snx_ser_flush_chars(struct tty_struct *tty)
{
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {   
        return;
    }
    
    snx_ser_start(tty);
}


static int snx_ser_chars_in_buffer(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return 0;
    }

    state = tty->driver_data;
    return snx_ser_circ_chars_pending(&state->info->xmit);
}


static void snx_ser_flush_buffer(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL; 
    struct snx_ser_port *port = NULL;
    unsigned long flags;
    int line = SNX_SER_DEVNUM(tty);
    
    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }

    state = tty->driver_data;
    port = state->port;

    if (!state || !state->info) 
    {
        return;
    }
        
    spin_lock_irqsave(&port->lock, flags);
    snx_ser_circ_clear(&state->info->xmit);
    spin_unlock_irqrestore(&port->lock, flags);
    
    wake_up_interruptible(&tty->write_wait);
    
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31))	
    if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) && tty->ldisc->ops->write_wakeup)
    {
        (tty->ldisc->ops->write_wakeup)(tty);
    }		

#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27) && LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,30))	
	
    if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) && tty->ldisc.ops->write_wakeup)
    {
        (tty->ldisc.ops->write_wakeup)(tty);
    }		

#else 
		if ((tty->flags & (1 << TTY_DO_WRITE_WAKEUP)) && tty->ldisc.write_wakeup)
    {
			(tty->ldisc.write_wakeup)(tty);
	  }		
#endif		
}


static void snx_ser_send_xchar(struct tty_struct *tty, char ch)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    unsigned long flags;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }

    state = tty->driver_data;
    port = state->port;
    port->x_char = ch;
        
    if (ch) 
    {
        spin_lock_irqsave(&port->lock, flags);
        sunix_ser_start_tx(port, 0);
        spin_unlock_irqrestore(&port->lock, flags);
    }
}


static void snx_ser_throttle(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    int line = SNX_SER_DEVNUM(tty);
    
    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }

    state = tty->driver_data;
    port = state->port;
        
    port->ldisc_stop_rx = 1;
    
    if (I_IXOFF(tty))
    {
        snx_ser_send_xchar(tty, STOP_CHAR(tty));
    }
    
    if (tty->termios->c_cflag & CRTSCTS)
    {
        snx_clear_mctrl(state->port, TIOCM_RTS);
    }
}


static void snx_ser_unthrottle(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {   
        return;
    }
    
    state = tty->driver_data;
    port = state->port; 
        
    port->ldisc_stop_rx = 0;
    
    if (I_IXOFF(tty)) 
    {
        if (port->x_char)
        {
            port->x_char = 0;
        }
        else
        {
            snx_ser_send_xchar(tty, START_CHAR(tty));
        }
    }

    if (tty->termios->c_cflag & CRTSCTS)
    {
        snx_set_mctrl(port, TIOCM_RTS);
    }  
}


static int snx_ser_get_info(struct snx_ser_state *state, struct serial_struct *retinfo)
{
    struct snx_ser_port *port = state->port;
    struct serial_struct tmp;

    memset(&tmp, 0, sizeof(tmp));
    tmp.type            = port->type;
    tmp.line            = port->line;
    tmp.port            = port->iobase;
    
    if (SNX_HIGH_BITS_OFFSET)
    {
        tmp.port_high = (long) port->iobase >> SNX_HIGH_BITS_OFFSET;
    }
    
    tmp.irq             = port->irq;
    tmp.flags           = port->flags;
    tmp.xmit_fifo_size  = port->fifosize;
    tmp.baud_base       = port->uartclk / 16;
    tmp.close_delay     = state->close_delay;
    tmp.closing_wait    = state->closing_wait;
    tmp.custom_divisor  = port->custom_divisor;
    tmp.io_type         = port->iotype;

    if (copy_to_user(retinfo, &tmp, sizeof(*retinfo)))
    {
        return -EFAULT;
    }
    
    return 0;
}


static int snx_ser_set_info(struct snx_ser_state *state, struct serial_struct *newinfo)
{
    struct serial_struct new_serial;
    struct snx_ser_port *port = state->port;
    unsigned long new_port;
    unsigned int change_irq;
    unsigned int change_port;
    unsigned int old_custom_divisor;
    unsigned int closing_wait;
    unsigned int close_delay;
    unsigned int old_flags;
    unsigned int new_flags;
    int retval = 0;
    
    if (copy_from_user(&new_serial, newinfo, sizeof(new_serial)))
    {
        return -EFAULT;
    }

    new_port = new_serial.port;
    
    if (SNX_HIGH_BITS_OFFSET)
    {
        new_port += (unsigned long) new_serial.port_high << SNX_HIGH_BITS_OFFSET;
    }
    
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))     
    new_serial.irq = irq_canonicalize(new_serial.irq);
#endif

	close_delay = new_serial.close_delay;
	closing_wait = new_serial.closing_wait == ASYNC_CLOSING_WAIT_NONE ?	SNX_USF_CLOSING_WAIT_NONE : new_serial.closing_wait;

	down(&state->sem);		

    change_irq  = new_serial.irq != port->irq;

    change_port =   new_port != port->iobase ||
                    new_serial.io_type != port->iotype ||
                    new_serial.type != port->type;

    old_flags = port->flags;
    new_flags = new_serial.flags;
    old_custom_divisor = port->custom_divisor;

    if (!capable(CAP_SYS_ADMIN)) 
    {
        retval = -EPERM;
        if (change_irq || 
            change_port ||
            (new_serial.baud_base != port->uartclk / 16) ||
            (close_delay != state->close_delay) ||
            (closing_wait != state->closing_wait) ||
            (new_serial.xmit_fifo_size != port->fifosize) ||
            (((new_flags ^ old_flags) & ~SNX_UPF_USR_MASK) != 0))
        {
            goto exit;
        }   
            
        port->flags = ((port->flags & ~SNX_UPF_USR_MASK) | (new_flags & SNX_UPF_USR_MASK));
        port->custom_divisor = new_serial.custom_divisor;
        goto check_and_exit;
    }

    if (change_port || change_irq) 
    {
        retval = -EBUSY;


        if (sunix_ser_users(state) > 1)
        {
            goto exit;
        }

        snx_ser_shutdown(state);
    }

    if (change_port) 
    {
        unsigned long old_iobase;
        unsigned int old_type;
        unsigned int old_iotype;

        old_iobase = port->iobase;
        old_type = port->type;
        old_iotype = port->iotype;

        
        if (old_type != PORT_UNKNOWN)
        {
            sunix_ser_release_io(port);
        }
        
        port->iobase = new_port;
        port->type = new_serial.type;
        port->iotype = new_serial.io_type;

        retval = 0;
    }

    port->irq              = new_serial.irq;
    port->uartclk          = new_serial.baud_base * 16;
    port->flags            = ((port->flags & ~SNX_UPF_CHANGE_MASK) | (new_flags & SNX_UPF_CHANGE_MASK));
    port->custom_divisor   = new_serial.custom_divisor;
    state->close_delay     = close_delay;
    state->closing_wait    = closing_wait;
    port->fifosize         = new_serial.xmit_fifo_size;
    
    if (state->info->tty)
    {
        state->info->tty->low_latency = (port->flags & SNX_UPF_LOW_LATENCY) ? 1 : 0;
    }
    
check_and_exit:
    retval = 0;
    if (port->type == PORT_UNKNOWN)
    {
        goto exit;
    }
        
    if (state->info->flags & SNX_UIF_INITIALIZED) 
    {
        if (((old_flags ^ port->flags) & SNX_UPF_SPD_MASK) || old_custom_divisor != port->custom_divisor) 
        {

            if (port->flags & SNX_UPF_SPD_MASK) 
            {
                printk("SNX Info : %s sets custom speed on ttySNX%d. This is deprecated.\n", current->comm, port->line);
            }
            snx_ser_change_speed(state, NULL);
        }
    } 
    else
    {
        retval = snx_ser_startup(state, 1);
    }
exit:
	up(&state->sem);

    return retval;
}


static int snx_ser_write_room(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    int line = SNX_SER_DEVNUM(tty);
    int status = 0;

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return 0;
    }
        
    state = tty->driver_data;
    
    status = snx_ser_circ_chars_free(&state->info->xmit);
    return status;
}


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,10))
static int snx_ser_write(struct tty_struct *tty, const unsigned char *buf, int count)
#else
static int snx_ser_write(struct tty_struct *tty, int from_user, const unsigned char *buf, int count)
#endif
{
    struct snx_ser_state *state = tty->driver_data;
    struct snx_ser_port *port = NULL;
    struct circ_buf *circ = NULL;
    //unsigned long flags;
    int c;
    int ret = 0;
        
    if (!state || !state->info) 
    {
        return -EL3HLT;
    }

    port = state->port;
    circ = &state->info->xmit;

    if (!circ->buf)
    {
        return 0;
    }

    //spin_lock_irqsave(&port->lock, flags);

    while (1) 
    {
        c = CIRC_SPACE_TO_END(circ->head, circ->tail, SNX_UART_XMIT_SIZE);
        if (count < c)
        {
            c = count;
        }

        if (c <= 0)
        {
            break;
        }
#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,6,9))		
        memcpy(circ->buf + circ->head, buf, c);
#else
		if (from_user)
		{
			if (copy_from_user((circ->buf + circ->head), buf, c) == c)
			{
				ret = -EFAULT;	
		    	break;
			}		
		}
		else
		{
			memcpy(circ->buf + circ->head, buf, c);
		}
#endif				
		
		
        circ->head = (circ->head + c) & (SNX_UART_XMIT_SIZE - 1);
        buf += c;
        count -= c;
        ret += c;
    }

    //spin_unlock_irqrestore(&port->lock, flags);

    snx_ser_start(tty);
    return ret;
}


static int snx_ser_get_lsr_info(struct snx_ser_state *state, unsigned int *value)
{
    struct snx_ser_port *port = state->port;
    unsigned int result = 0;

    result = sunix_ser_tx_empty(port);


    if ((port->x_char) || 
        ((snx_ser_circ_chars_pending(&state->info->xmit) > 0) && 
        !state->info->tty->stopped && !state->info->tty->hw_stopped))
    {
        result &= ~TIOCSER_TEMT;
    }
    

#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,4,18))
    if (copy_to_user(value, &result, sizeof(int)))
    {
        return -EFAULT;
    }

    return 0;
#else
    return put_user(result, value);
#endif
}


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
static int snx_ser_tiocmget(struct tty_struct *tty, struct file *file)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    int result = -EIO;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return 0;
    }

    state = tty->driver_data;
    port = state->port;
        
    down(&state->sem);			
    
    if ((!file || !tty_hung_up_p(file)) && !(tty->flags & (1 << TTY_IO_ERROR))) 
    {
        result = port->mctrl;
        result |= sunix_ser_get_mctrl(port);
    }
    
	up(&state->sem);
    
    return result;
}


static int snx_ser_tiocmset(struct tty_struct *tty, struct file *file, unsigned int set, unsigned int clear)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    int ret = -EIO;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {   
        return 0;
    }

    state = tty->driver_data;
    port = state->port; 
        
	down(&state->sem);
    
    if ((!file || !tty_hung_up_p(file)) && !(tty->flags & (1 << TTY_IO_ERROR))) 
    {
        snx_ser_update_mctrl(port, set, clear);
        ret = 0;
    }
    
	up(&state->sem);

    return ret;
}


#else
static int snx_ser_get_modem_info(struct snx_ser_state *state, unsigned int *value)
{
    struct snx_ser_port *port = NULL;
    int line;
    unsigned int result;

    if (!state)
    {
        return -EIO;
    }

    port = state->port;

    if (!port)
    {
        return -EIO;
    }

    line = port->line;
    
    if (line >= SNX_SER_TOTAL_MAX)
    {
        return -EIO;
    }
    
    result = port->mctrl;
    result |= sunix_ser_get_mctrl(port);

	put_user(result, (unsigned long *)value);
	return 0;
}


static int snx_ser_set_modem_info(struct snx_ser_state *state, unsigned int cmd, unsigned int *value)
{
    struct snx_ser_port *port = NULL;
    int line;
    unsigned int set = 0;
    unsigned int clr = 0;
	unsigned int arg;

    if (!state)
    {
        return -EIO;
    }

    port = state->port;

    if (!port)
    {
        return -EIO;
    }

    line = port->line;

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return -EIO;
    }

	get_user(arg,(unsigned long *)value);

	switch (cmd)
	{
		case TIOCMBIS:
        {
            if (arg & TIOCM_RTS)
            {
			    set |= TIOCM_RTS;
            }

	        if (arg & TIOCM_DTR)
            {
		        set |= TIOCM_DTR;
            }

            if (arg & TIOCM_LOOP)
            {
                set |= TIOCM_LOOP;
            }
	        break;
        }

		case TIOCMBIC:
        {
	        if (arg & TIOCM_RTS)
            {
		        clr |= TIOCM_RTS;
            }

	        if (arg & TIOCM_DTR)
            {
			    clr |= TIOCM_DTR;
            }

            if (arg & TIOCM_LOOP)
            {
                clr |= TIOCM_LOOP;
            }            
	        break;
        }

		case TIOCMSET:
        {
	        if (arg & TIOCM_RTS)
            {
		        set |= TIOCM_RTS;
            }
            else
            {
                clr |= TIOCM_RTS;
            }

	        if (arg & TIOCM_DTR)
            {
			    set |= TIOCM_DTR;
            }
            else
            {
                clr |= TIOCM_DTR;
            }

            if (arg & TIOCM_LOOP)
            {
                set |= TIOCM_LOOP;
            }
            else
            {
                clr |= TIOCM_LOOP;
            }            
	        break;
        }

		default:
        {
            return -EINVAL;
        }
	}

    snx_ser_update_mctrl(port, set, clr);
	return 0;
}
#endif


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27))
static int  snx_ser_break_ctl(struct tty_struct *tty, int break_state)
#else
static void snx_ser_break_ctl(struct tty_struct *tty, int break_state)
#endif
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27))	
        return 0;
#else
		return;
#endif				
    }

    state = tty->driver_data;
    port = state->port;
        
    down(&state->sem);

    if (port->type != PORT_UNKNOWN)
    {
        sunix_ser_break_ctl(port, break_state);
    }
    
	up(&state->sem);
	
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27))
	return 0;
#endif		
}


static int snx_ser_wait_modem_status(struct snx_ser_state *state, unsigned long arg)
{
    struct snx_ser_port *port = state->port;
    DECLARE_WAITQUEUE(wait, current);
    struct snx_ser_icount cprev;
    struct snx_ser_icount cnow;
    int ret = 0;

    spin_lock_irq(&port->lock);
    memcpy(&cprev, &port->icount, sizeof(struct snx_ser_icount));

    sunix_ser_enable_ms(port);

    spin_unlock_irq(&port->lock);

    add_wait_queue(&state->info->delta_msr_wait, &wait);
    
    for (;;) 
    {
        spin_lock_irq(&port->lock);
        memcpy(&cnow, &port->icount, sizeof(struct snx_ser_icount));
        spin_unlock_irq(&port->lock);

        set_current_state(TASK_INTERRUPTIBLE);

        if (((arg & TIOCM_RNG) && (cnow.rng != cprev.rng)) ||
            ((arg & TIOCM_DSR) && (cnow.dsr != cprev.dsr)) ||
            ((arg & TIOCM_CD)  && (cnow.dcd != cprev.dcd)) ||
            ((arg & TIOCM_CTS) && (cnow.cts != cprev.cts))) 
        {
            ret = 0;
            break;
        }

        schedule();


        if (signal_pending(current)) 
        {
            ret = -ERESTARTSYS;
            break;
        }

        cprev = cnow;
    }

    current->state = TASK_RUNNING;
    remove_wait_queue(&state->info->delta_msr_wait, &wait);
    return ret;
}


static int snx_ser_get_count(struct snx_ser_state *state, struct serial_icounter_struct *icnt)
{
    struct serial_icounter_struct icount;
    struct snx_ser_icount cnow;
    struct snx_ser_port *port = state->port;

    spin_lock_irq(&port->lock);
    memcpy(&cnow, &port->icount, sizeof(struct snx_ser_icount));
    spin_unlock_irq(&port->lock);

    icount.cts         = cnow.cts;
    icount.dsr         = cnow.dsr;
    icount.rng         = cnow.rng;
    icount.dcd         = cnow.dcd;
    icount.rx          = cnow.rx;
    icount.tx          = cnow.tx;
    icount.frame       = cnow.frame;
    icount.overrun     = cnow.overrun;
    icount.parity      = cnow.parity;
    icount.brk         = cnow.brk;
    icount.buf_overrun = cnow.buf_overrun;

    return copy_to_user(icnt, &icount, sizeof(icount)) ? -EFAULT : 0;
}


static int snx_ser_ioctl(struct tty_struct *tty, struct file *filp, unsigned int cmd, unsigned long arg)
{
    struct snx_ser_state *state = NULL;
    int ret = -ENOIOCTLCMD;
    int line = SNX_SER_DEVNUM(tty);
#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0))    
    int status = 0;
#endif

    if (line < SNX_SER_TOTAL_MAX)
    {
        state = tty->driver_data;
    }
    
    
    switch (cmd) 
    {
        case TIOCGSERIAL:
        {
        	if (line < SNX_SER_TOTAL_MAX)
    		{
            	ret = snx_ser_get_info(state, (struct serial_struct *)arg);
            }
            break;
		}


        case TIOCSSERIAL:
        {
        	if (line < SNX_SER_TOTAL_MAX)
    		{        
        		state->port->setserial_flag = SNX_SER_BAUD_SETSERIAL;
            	ret = snx_ser_set_info(state, (struct serial_struct *)arg);
            }
            break;
		}


		case TCSETS:
		{
        	if (line < SNX_SER_TOTAL_MAX)
    		{		
				state->port->flags &= ~(SNX_UPF_SPD_HI | SNX_UPF_SPD_VHI | SNX_UPF_SPD_SHI | SNX_UPF_SPD_WARP);
				state->port->setserial_flag = SNX_SER_BAUD_NOTSETSER;
				snx_ser_update_termios(state);
			}
			break;
		}


#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0))
		case TIOCMGET:
		{
			if (line < SNX_SER_TOTAL_MAX)
    		{
	    		ret = verify_area(VERIFY_WRITE, (void *)arg,	sizeof(unsigned int));

	    		if (ret)
				{
			    	return ret;
            	}

				status = snx_ser_get_modem_info(state, (unsigned int *)arg);
	    		return status;
			}
			break;
		}


		case TIOCMBIS:
		case TIOCMBIC:
		case TIOCMSET:
		{
        	if (line < SNX_SER_TOTAL_MAX)
    		{		
				status = snx_ser_set_modem_info(state, cmd, (unsigned int *)arg);
    			return status;
			}
			break;    			
		}
#endif                  


        case TIOCSERGWILD: 
        case TIOCSERSWILD:
        {
        	if (line < SNX_SER_TOTAL_MAX)
    		{        
            	ret = 0;
			}            	
            break;
        }    
            
		
        case SNX_SER_DUMP_PORT_INFO:
        {
            int i;
            struct snx_ser_port_info snx_port_info[SNX_SER_TOTAL_MAX];      
            struct snx_ser_port *sdn = NULL;
            
            memset(snx_port_info, 0, (sizeof(struct snx_ser_port_info) * SNX_SER_TOTAL_MAX));
            
            if (line == 32)
            {
                for (i = 0; i < SNX_SER_TOTAL_MAX; i++)
                {
                    sdn = (struct snx_ser_port *) &sunix_ser_table[i];
                
                    memcpy(&snx_port_info[i].board_name_info[0], &sdn->pb_info.board_name[0], SNX_BOARDNAME_LENGTH);

                    snx_port_info[i].bus_number_info = sdn->bus_number;
                    snx_port_info[i].dev_number_info = sdn->dev_number;
                    snx_port_info[i].port_info       = sdn->line;
                    snx_port_info[i].base_info       = sdn->iobase;
                    snx_port_info[i].irq_info        = sdn->irq;
                }
                
                if (copy_to_user((void *)arg, snx_port_info, SNX_SER_TOTAL_MAX * sizeof(struct snx_ser_port_info)))
                {
                    ret = -EFAULT;
                }
                else
                {
                    ret = 0;
                }
            }
            else
            {
                ret = 0;
            }           
        	
        	ret = 0;
            break;
        }

		
        case SNX_SER_DUMP_DRIVER_VER:
        {
            char driver_ver[SNX_DRIVERVERSION_LENGTH];
            memset(driver_ver, 0, (sizeof(char) * SNX_DRIVERVERSION_LENGTH));
            
            if (line == 32)
            {
            
                memcpy(&driver_ver[0], SNX_DRIVER_VERSION, SNX_DRIVERVERSION_LENGTH);

                if (copy_to_user((void *)arg, &driver_ver, (sizeof(char) * SNX_DRIVERVERSION_LENGTH)))
                {
                    ret = -EFAULT;
                }
                else
                {
                    ret = 0;
                }
            }
            else
            {
                ret = 0;
            }
            
            break;
        }
    }

    if (ret != -ENOIOCTLCMD)
    {
        goto out;
    }
    
    
    if (tty->flags & (1 << TTY_IO_ERROR)) 
    {
        ret = -EIO;
        goto out;
    }


    switch (cmd) 
    {
        case TIOCMIWAIT:
        	if (line < SNX_SER_TOTAL_MAX)
    		{        
            	ret = snx_ser_wait_modem_status(state, arg);
            }
            break;


        case TIOCGICOUNT:
        	if (line < SNX_SER_TOTAL_MAX)
    		{		        
            	ret = snx_ser_get_count(state, (struct serial_icounter_struct *)arg);
            }
            break;
    }

    if (ret != -ENOIOCTLCMD)
    {
        goto out;
    }
    
    
    if (line < SNX_SER_TOTAL_MAX)
    {
		down(&state->sem);
    
        if (tty_hung_up_p(filp)) 
        {
            ret = -EIO;
            goto out_up;
        }


        switch (cmd) 
        {
            case TIOCSERGETLSR:
                ret = snx_ser_get_lsr_info(state, (unsigned int *)arg);
                break;


            default: 
            {
                break;
            }
        }
    
out_up:
		up(&state->sem);
    }

out:
    return ret;
}


static void snx_ser_hangup(struct tty_struct *tty)
{
    struct snx_ser_state *state = NULL;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }
        
    state = tty->driver_data;

	down(&state->sem);
    
    if (state->info && state->info->flags & SNX_UIF_NORMAL_ACTIVE) 
    {
        snx_ser_flush_buffer(tty);
        snx_ser_shutdown(state);
        state->count = 0;
        state->info->flags &= ~SNX_UIF_NORMAL_ACTIVE;
        state->info->tty = NULL;
        wake_up_interruptible(&state->info->open_wait);
        wake_up_interruptible(&state->info->delta_msr_wait);
    }
    
	up(&state->sem);
}


unsigned int snx_ser_get_divisor(struct snx_ser_port *port, unsigned int baud)
{
    unsigned int quot;
    
    if (baud == 38400 && (port->flags & SNX_UPF_SPD_MASK) == SNX_UPF_SPD_CUST)
    {
        quot = port->custom_divisor;
    }
    else
    {
        quot = port->uartclk / (16 * baud);
    }   
    
    
    return quot;
}


unsigned int snx_ser_get_baud_rate(struct snx_ser_port *port, struct SNXTERMIOS *termios, struct SNXTERMIOS *old, unsigned int min, unsigned int max)
{
    unsigned int try;
    unsigned int baud;
    unsigned int altbaud = 0;
    unsigned int flags = port->flags & SNX_UPF_SPD_MASK;
   	
    for (try = 0; try < 2; try++) 
    {   	
   		if ((port->setserial_flag == SNX_SER_BAUD_SETSERIAL) || (port->flags & SNX_UPF_SPD_MASK))
   		{
   			altbaud = 38400;
   	
   			if (flags == SNX_UPF_SPD_HI)
    		{
        		altbaud = 57600;
    		}
    
			if (flags == SNX_UPF_SPD_VHI)
    		{
        		altbaud = 115200;
   	 		}
    
    		if (flags == SNX_UPF_SPD_SHI)
    		{
       			altbaud = 230400;
    		}
    
    		if (flags == SNX_UPF_SPD_WARP)
    		{
        		altbaud = 460800;
    		}
    		
    		baud = altbaud;
    	}
    	else
    	{
    		switch (termios->c_cflag & (CBAUD | CBAUDEX))
        	{
            	case B921600    : baud = 921600;    break;
            	case B460800    : baud = 460800;    break;
            	case B230400    : baud = 230400;    break;
            	case B115200    : baud = 115200;    break;
            	case B57600     : baud = 57600;     break;
            	case B38400     : baud = 38400;     break;
            	case B19200     : baud = 19200;     break;
            	case B9600      : baud = 9600;      break;
            	case B4800      : baud = 4800;      break;
            	case B2400      : baud = 2400;      break;
            	case B1800      : baud = 1800;      break;
            	case B1200      : baud = 1200;      break;
            	case B600       : baud = 600;       break;
            	case B300       : baud = 300;       break;
           	 	case B200       : baud = 200;       break;
            	case B150       : baud = 150;       break;
            	case B134       : baud = 134;       break;
            	case B110       : baud = 110;       break;
            	case B75        : baud = 75;        break;
            	case B50        : baud = 50;        break;
            	default         : baud = 9600;      break;
        	}
        }
        
        if (baud == 0)
        {
            baud = 9600;
        }
        
        if (baud >= min && baud <= max)
        {
            return baud;
        }

        termios->c_cflag &= ~CBAUD;
        
        if (old) 
        {
            termios->c_cflag |= old->c_cflag & CBAUD;
            old = NULL;
            continue;
        }

        termios->c_cflag |= B9600;        
    }

    return 0;   
}


static void snx_ser_change_speed(struct snx_ser_state *state, struct SNXTERMIOS *old_termios)
{
    struct tty_struct *tty = state->info->tty;
    struct snx_ser_port *port = state->port;
    struct SNXTERMIOS *termios;

    if (!tty || !tty->termios || port->type == PORT_UNKNOWN)
    {
        return;
    }
    
    termios = tty->termios;

    if (termios->c_cflag & CRTSCTS)
    {
        state->info->flags |= SNX_UIF_CTS_FLOW;
    }
    else
    {
        state->info->flags &= ~SNX_UIF_CTS_FLOW;
    }  

    if (termios->c_cflag & CLOCAL)
    {
        state->info->flags &= ~SNX_UIF_CHECK_CD;
    }
    else
    {
        state->info->flags |= SNX_UIF_CHECK_CD;
    }
    
    sunix_ser_set_termios(port, termios, old_termios);
}


static void snx_ser_set_termios(struct tty_struct *tty, struct SNXTERMIOS *old_termios)
{
    struct snx_ser_state *state = NULL;
    unsigned long flags;
    unsigned int cflag = tty->termios->c_cflag;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }

    state = tty->driver_data;
        
#define RELEVANT_IFLAG(iflag)   ((iflag) & (IGNBRK|BRKINT|IGNPAR|PARMRK|INPCK))

    if ((cflag ^ old_termios->c_cflag) == 0 && RELEVANT_IFLAG(tty->termios->c_iflag ^ old_termios->c_iflag) == 0)
    {
        return;
    }

    snx_ser_change_speed(state, old_termios);

    if ((old_termios->c_cflag & CBAUD) && !(cflag & CBAUD))
    {
        snx_clear_mctrl(state->port, TIOCM_RTS | TIOCM_DTR);
    }

    if (!(old_termios->c_cflag & CBAUD) && (cflag & CBAUD)) 
    {
        unsigned int mask = TIOCM_DTR;
        if (!(cflag & CRTSCTS) || !test_bit(TTY_THROTTLED, &tty->flags))
        {
            mask |= TIOCM_RTS;
        }
            
        snx_set_mctrl(state->port, mask);
    }
    
    if ((old_termios->c_cflag & CRTSCTS) && !(cflag & CRTSCTS)) 
    {
        spin_lock_irqsave(&state->port->lock, flags);
        tty->hw_stopped = 0;
        __snx_ser_start(tty);
        spin_unlock_irqrestore(&state->port->lock, flags);
    }
}


static void snx_ser_update_termios(struct snx_ser_state *state)
{
    struct tty_struct *tty = state->info->tty;
    struct snx_ser_port *port = state->port;

    if (!(tty->flags & (1 << TTY_IO_ERROR))) 
    {
        snx_ser_change_speed(state, NULL);

        if (tty->termios->c_cflag & CBAUD)
        {
            snx_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
        }
    }
}


static void snx_ser_update_timeout(struct snx_ser_port *port, unsigned int cflag, unsigned int baud)
{
    unsigned int bits;
    
    switch (cflag & CSIZE) 
    {
        case CS5:
            bits = 7;
            break;
            
        case CS6:
            bits = 8;
            break;
        
        case CS7:
            bits = 9;
            break;
        
        default:
            bits = 10;
            break; 
    }

    if (cflag & CSTOPB)
    {
        bits++;
    }

    if (cflag & PARENB)
    {
        bits++;
    }

    bits = bits * port->fifosize;

    port->timeout = (HZ * bits) / baud + HZ/50;
}


static struct snx_ser_state *snx_ser_get(struct snx_ser_driver *drv, int line)
{
    struct snx_ser_state *state = NULL;
        
	down(&ser_port_sem);
    
    state = drv->state + line;
    
	if (down_interruptible(&state->sem)) 
    {
        state = ERR_PTR(-ERESTARTSYS);
        goto out;
    }
	
    state->count++;
    
    if (!state->port) 
    {
        state->count--;
		up(&state->sem);
        state = ERR_PTR(-ENXIO);
        goto out;
    }

    if (!state->port->iobase) 
    {
        state->count--;
		up(&state->sem);			
        state = ERR_PTR(-ENXIO);
        goto out;
    }   

    if (!state->info)
    {
        state->info = kmalloc(sizeof(struct snx_ser_info), GFP_KERNEL);
        
        if (state->info) 
        {
            memset(state->info, 0, sizeof(struct snx_ser_info));
            init_waitqueue_head(&state->info->open_wait);
            init_waitqueue_head(&state->info->delta_msr_wait);

            state->port->info = state->info;

            tasklet_init(&state->info->tlet, snx_ser_tasklet_action, (unsigned long)state);
        } 
        else 
        {
            state->count--;
			up(&state->sem);
            state = ERR_PTR(-ENOMEM);
        }
    }

out:
	up(&ser_port_sem);
    return state;
}


static int snx_ser_block_til_ready(struct file *filp, struct snx_ser_state *state)
{
    DECLARE_WAITQUEUE(wait, current);
    struct snx_ser_info *info = state->info;
    struct snx_ser_port *port = state->port;

    info->blocked_open++;
    state->count--;

    add_wait_queue(&info->open_wait, &wait);
    
    while (1) 
    {
        set_current_state(TASK_INTERRUPTIBLE);

        if (tty_hung_up_p(filp) || info->tty == NULL)
        {
            break;
        }
    
        if (!(info->flags & SNX_UIF_INITIALIZED))
        {
            break;
        }

        if ((filp->f_flags & O_NONBLOCK) || 
            (info->tty->termios->c_cflag & CLOCAL) ||
            (info->tty->flags & (1 << TTY_IO_ERROR))) 
        {
            break;
        }

        if (info->tty->termios->c_cflag & CBAUD)
        {
            snx_set_mctrl(port, TIOCM_DTR);
        }

        if (sunix_ser_get_mctrl(port) & TIOCM_CAR)
        {
            break;
        }

		up(&state->sem);
        schedule();
		down(&state->sem);			

        if (signal_pending(current))
        {
            break;
        }
    }
    
    set_current_state(TASK_RUNNING);
    remove_wait_queue(&info->open_wait, &wait);

    state->count++;
    info->blocked_open--;

    if (signal_pending(current))
    {
        return -ERESTARTSYS;
    }

    if (!info->tty || tty_hung_up_p(filp))
    {
        return -EAGAIN;
    }

    return 0;
}


static void snx_ser_wait_until_sent(struct tty_struct *tty, int timeout)
{
    struct snx_ser_state *state = NULL;
    struct snx_ser_port *port = NULL;   
    unsigned long char_time;
    unsigned long expire;
    int line = SNX_SER_DEVNUM(tty);

    if (line >= SNX_SER_TOTAL_MAX)
    {
        return;
    }

    state = tty->driver_data;
    port = state->port;
        
    if (port->type == PORT_UNKNOWN || port->fifosize == 0)
    {
        return;
    }
    
    char_time = (port->timeout - HZ/50) / port->fifosize;
    
    char_time = char_time / 5;
    
    if (char_time == 0)
    {
        char_time = 1;
    }   
        
    if (timeout && timeout < char_time)
    {
        char_time = timeout;
    }
    
    if (timeout == 0 || timeout > 2 * port->timeout)
    {
        timeout = 2 * port->timeout;
    }
    
    expire = jiffies + timeout;

    while (!sunix_ser_tx_empty(port))
    {
        set_current_state(TASK_INTERRUPTIBLE);
        schedule_timeout(char_time);
        
        if (signal_pending(current))
        {
            break;
        }
            
        if (time_after(jiffies, expire))
        {
            break;
        }
    }
    set_current_state(TASK_RUNNING); 
}


static int snx_ser_open(struct tty_struct *tty, struct file *filp)
{
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
    struct snx_ser_driver *drv = (struct snx_ser_driver *)tty->driver->driver_state;
#else
    struct snx_ser_driver *drv = (struct snx_ser_driver *)tty->driver.driver_state;
#endif    
    struct snx_ser_state *state = NULL;
    int retval = 0;
    int line = SNX_SER_DEVNUM(tty);


    if (line < SNX_SER_TOTAL_MAX)
    {
        retval = -ENODEV;

        if (line >= SNX_SER_TOTAL_MAX)
        {
            goto fail;
        }

        state = snx_ser_get(drv, line);

        if (IS_ERR(state)) 
        {
            retval = PTR_ERR(state);
            goto fail;
        }

        if (!state)
        {
            goto fail;
        }

        tty->driver_data = state;
        tty->low_latency = (state->port->flags & SNX_UPF_LOW_LATENCY) ? 1 : 0;
        tty->alt_speed = 0;
        state->info->tty = tty;

        if (tty_hung_up_p(filp)) 
        {
            retval = -EAGAIN;
            state->count--;
			up(&state->sem);
            goto fail;
        }

        retval = snx_ser_startup(state, 0);

        if (retval == 0)
        {
            retval = snx_ser_block_til_ready(filp, state);
        }
        
		up(&state->sem);

        if (retval == 0 && !(state->info->flags & SNX_UIF_NORMAL_ACTIVE)) 
        {
            state->info->flags |= SNX_UIF_NORMAL_ACTIVE;

            snx_ser_update_termios(state);
        }

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))           
        try_module_get(THIS_MODULE);
#else
        MOD_INC_USE_COUNT;
#endif        
        
    }
    else
    {
    }

fail:
    return retval;
}


static void snx_ser_close(struct tty_struct *tty, struct file *filp)
{
    struct snx_ser_state *state = tty->driver_data;
    struct snx_ser_port *port = NULL;
    int line = SNX_SER_DEVNUM(tty);

    if (line < SNX_SER_TOTAL_MAX) 
    {
        if (!state || !state->port)
        {
            return;
        }
    
        port = state->port;

		down(&state->sem);			

        if (tty_hung_up_p(filp))
        {
            goto done;
        }
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))    
        if ((tty->count == 1) && (state->count != 1))
        {

            printk("SNX Info : bad serial port count; tty->count is 1, state->count is %d\n", state->count);
            state->count = 1;
        }
#endif    
    
        if (--state->count < 0) 
        {
            printk("SNX Info : bad serial port count for ttySNX%d: %d\n",port->line, state->count);
            state->count = 0;
        }
    
        if (state->count)
        {
            goto done;
        }
    
        tty->closing = 1;

        if (state->closing_wait != SNX_USF_CLOSING_WAIT_NONE)
        {
            tty_wait_until_sent(tty, state->closing_wait);
        }
    
        if (state->info->flags & SNX_UIF_INITIALIZED) 
        {
            unsigned long flags;
            spin_lock_irqsave(&port->lock, flags);
            sunix_ser_stop_rx(port);
            spin_unlock_irqrestore(&port->lock, flags);

            snx_ser_wait_until_sent(tty, port->timeout);
        }

        snx_ser_shutdown(state);
        snx_ser_flush_buffer(tty);
        
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31))  
			
        if (tty->ldisc->ops->flush_buffer)
        {
            tty->ldisc->ops->flush_buffer(tty);
        }           
                   

#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,27)&& LINUX_VERSION_CODE <= KERNEL_VERSION(2,6,30) )  
{			
        if (tty->ldisc.ops->flush_buffer)
        {
            tty->ldisc.ops->flush_buffer(tty);
        }   
}
#else

        if (tty->ldisc.flush_buffer)
        {
            tty->ldisc.flush_buffer(tty);
        }  

#endif        
        tty->closing = 0;
        state->info->tty = NULL;

        if (state->info->blocked_open) 
        {
            if (state->close_delay) 
            {
                set_current_state(TASK_INTERRUPTIBLE);
                schedule_timeout(state->close_delay);
            }
        }
    
        state->info->flags &= ~SNX_UIF_NORMAL_ACTIVE;
        wake_up_interruptible(&state->info->open_wait);
        
done:
		up(&state->sem);
			
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
        module_put(THIS_MODULE);
#else
        MOD_DEC_USE_COUNT;
#endif           
    }
    else
    {
    }
}


static void sunix_ser_set_mctrl(struct snx_ser_port *port, unsigned int mctrl)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;
    unsigned char mcr = 0;

    if (mctrl & TIOCM_RTS)
    {
        mcr |= UART_MCR_RTS;
    }
    
    if (mctrl & TIOCM_DTR)
    {
        mcr |= UART_MCR_DTR;
    }
    
    if (mctrl & TIOCM_OUT1)
    {
        mcr |= UART_MCR_OUT1;
    }
    
    if (mctrl & TIOCM_OUT2)
    {
        mcr |= UART_MCR_OUT2;
    }
    
    if (mctrl & TIOCM_LOOP)
    {
        mcr |= UART_MCR_LOOP;
    }
    
    mcr = (mcr & sp->mcr_mask) | sp->mcr_force | sp->mcr;

    WRITE_UART_MCR(sp, mcr);
}


static unsigned int sunix_ser_tx_empty(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;
    unsigned long flags;
    unsigned int ret;

    spin_lock_irqsave(&sp->port.lock, flags);
    ret = READ_UART_LSR(sp) & UART_LSR_TEMT ? TIOCSER_TEMT : 0;
    spin_unlock_irqrestore(&sp->port.lock, flags);

    return ret;
}


static unsigned int sunix_ser_get_mctrl(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;
    unsigned long flags;
    unsigned char status;
    unsigned int ret;

    spin_lock_irqsave(&sp->port.lock, flags);
    status = READ_UART_MSR(sp);
    spin_unlock_irqrestore(&sp->port.lock, flags);

    ret = 0;
    if (status & UART_MSR_DCD)
    {
        ret |= TIOCM_CAR;
    }
    
    if (status & UART_MSR_RI)
    {
        ret |= TIOCM_RNG;
    }
    
    if (status & UART_MSR_DSR)
    {
        ret |= TIOCM_DSR;
    }
    
    if (status & UART_MSR_CTS)
    {
        ret |= TIOCM_CTS;
    }
	
    return ret;
}


static void sunix_ser_stop_tx(struct snx_ser_port *port, unsigned int tty_stop)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    if (sp->ier & UART_IER_THRI) 
    {
        sp->ier &= ~UART_IER_THRI;
        WRITE_UART_IER(sp, sp->ier);
    }
}


static void sunix_ser_start_tx(struct snx_ser_port *port, unsigned int tty_start)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;
    
    if (!(sp->ier & UART_IER_THRI)) 
    {
        sp->ier |= UART_IER_THRI;
        WRITE_UART_IER(sp, sp->ier);
    }
}


static void sunix_ser_stop_rx(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    sp->ier &= ~UART_IER_RLSI;
    sp->port.read_status_mask &= ~UART_LSR_DR;
    WRITE_UART_IER(sp, sp->ier);
}


static void sunix_ser_enable_ms(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    sp->ier |= UART_IER_MSI;
    WRITE_UART_IER(sp, sp->ier);
}


static void sunix_ser_break_ctl(struct snx_ser_port *port, int break_state)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;
    unsigned long flags;

    spin_lock_irqsave(&sp->port.lock, flags);
    
    if (break_state == -1)
    {
        sp->lcr |= UART_LCR_SBC;
    }
    else
    {
        sp->lcr &= ~UART_LCR_SBC;
    }   
        
    WRITE_UART_LCR(sp, sp->lcr);
    spin_unlock_irqrestore(&sp->port.lock, flags);
}


static int sunix_ser_startup(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    sp->capabilities = snx_uart_config[sp->port.type].flags;
    sp->mcr = 0;

    if (sp->capabilities & UART_CLEAR_FIFO) 
    {
        WRITE_UART_FCR(sp, UART_FCR_ENABLE_FIFO);
        WRITE_UART_FCR(sp, UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT);
        WRITE_UART_FCR(sp, 0);
    }

    (void) READ_UART_LSR(sp);
    (void) READ_UART_RX(sp);
    (void) READ_UART_IIR(sp);
    (void) READ_UART_MSR(sp);

    if (!(sp->port.flags & SNX_UPF_BUGGY_UART) && (READ_UART_LSR(sp) == 0xff)) 
    {
        printk("SNX Info : ttySNX%d: LSR safety check engaged!\n", sp->port.line);
        return -ENODEV;
    }

    WRITE_UART_LCR(sp, UART_LCR_WLEN8);

    if (sp->port.snx_type == SNX_SER_PORT_SUN1699)
    {
        sp->ier = UART_IER_RLSI | UART_IER_RDI | SUN1699_CLK_DIVIDER_DISABLE;
    }
    else
    {
        sp->ier = UART_IER_RLSI | UART_IER_RDI;
    }   
    
    WRITE_UART_IER(sp, sp->ier);

    (void) READ_UART_LSR(sp);
    (void) READ_UART_RX(sp);
    (void) READ_UART_IIR(sp);
    (void) READ_UART_MSR(sp);
    return 0;
}


static void sunix_ser_shutdown(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    sp->ier = 0;
    WRITE_UART_IER(sp, 0);

    WRITE_UART_LCR(sp, READ_UART_LCR(sp) & ~UART_LCR_SBC);
    
    WRITE_UART_FCR(sp, UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT);
    WRITE_UART_FCR(sp, 0);

    (void) READ_UART_RX(sp);
}


static unsigned int sunix_ser_get_divisor(struct snx_ser_port *port, unsigned int baud)
{
    unsigned int quot;
	
    if ((port->flags & SNX_UPF_MAGIC_MULTIPLIER) && baud == (port->uartclk/4))
    {
        quot = 0x8001;
    }
    else if ((port->flags & SNX_UPF_MAGIC_MULTIPLIER) && baud == (port->uartclk/8))
    {
        quot = 0x8002;
    }
    else
    {
        quot = snx_ser_get_divisor(port, baud);
    }
    return quot;
}


static void sunix_ser_set_termios(struct snx_ser_port *port, struct SNXTERMIOS *termios, struct SNXTERMIOS *old)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;
    unsigned char cval;
    unsigned char fcr = 0;
    unsigned long flags;
    unsigned int baud;
    unsigned int quot;

    switch (termios->c_cflag & CSIZE) 
    {
        case CS5:
            cval = 0x00;
            break;
            
        case CS6:
            cval = 0x01;
            break;
            
        case CS7:
            cval = 0x02;
            break;
            
        default:
        case CS8:
            cval = 0x03;
            break;
    }

    if (termios->c_cflag & CSTOPB)
    {   
        cval |= 0x04;
    }
    
    if (termios->c_cflag & PARENB)
    {
        cval |= UART_LCR_PARITY;
    }
    
    if (!(termios->c_cflag & PARODD))
    {
        cval |= UART_LCR_EPAR;
    }
    
#ifdef CMSPAR
    if (termios->c_cflag & CMSPAR)
    {
        cval |= UART_LCR_SPAR;
    }
#endif

    baud = snx_ser_get_baud_rate(port, termios, old, 0, port->uartclk / 16); 
    quot = sunix_ser_get_divisor(port, baud);

    if (sp->capabilities & UART_USE_FIFO) 
    {
        if (baud < 2400)
        {
            fcr = UART_FCR_ENABLE_FIFO | UART_FCR_TRIGGER_1;
        }
        else
        {
            fcr = UART_FCR_ENABLE_FIFO | UART_FCR_TRIGGER_8;
        }
    }

	
    if (sp->port.snx_type == SNX_SER_PORT_SUN1889) 
    {
        sp->mcr &= ~UART_MCR_AFE;
        
        if (termios->c_cflag & CRTSCTS)
        {
            sp->mcr |= UART_MCR_AFE;
        }
        
        fcr |= UART_SUN1889_FCR_32BYTE;
    }
    else if (sp->port.snx_type == SNX_SER_PORT_SUN1699) 
    {
        sp->mcr &= ~UART_MCR_AFE;
        
        if (termios->c_cflag & CRTSCTS)
        {
            sp->mcr |= UART_MCR_AFE;
        }
        
        fcr |= UART_SUN1699_FCR_32BYTE;
    }   
    else if (sp->port.snx_type == SNX_SER_PORT_SUNMATX) 
    {
        sp->mcr &= ~UART_MCR_AFE;
        
        if (termios->c_cflag & CRTSCTS)
        {
            sp->mcr |= UART_MCR_AFE;
        }
        
        fcr |= UART_SUNMATX_FCR_64BYTE;
    }   	
    else if (sp->port.snx_type == SNX_SER_PORT_SUN1999) 
    {
        sp->mcr &= ~UART_MCR_AFE;
        
        if (termios->c_cflag & CRTSCTS)
        {
            sp->mcr |= UART_MCR_AFE;
        }
        
        fcr |= UART_SUN1999_FCR_128BYTE;
    } 
	else
	{
        sp->mcr &= ~UART_MCR_AFE;
        
        if (termios->c_cflag & CRTSCTS)
        {
            sp->mcr |= UART_MCR_AFE;
        }
        
        fcr |= UART_DEFAULT_FCR;	
	}  	
    
    spin_lock_irqsave(&sp->port.lock, flags);


    snx_ser_update_timeout(port, termios->c_cflag, baud);

    
    sp->port.read_status_mask = UART_LSR_OE | UART_LSR_THRE | UART_LSR_DR;
    
    if (termios->c_iflag & INPCK)
    {
        sp->port.read_status_mask |= UART_LSR_FE | UART_LSR_PE;
    }
    
    if (termios->c_iflag & (BRKINT | PARMRK))
    {
        sp->port.read_status_mask |= UART_LSR_BI;
    }

    sp->port.ignore_status_mask = 0;
    
    if (termios->c_iflag & IGNPAR)
    {
        sp->port.ignore_status_mask |= UART_LSR_PE | UART_LSR_FE;
    }
    
        
    if (termios->c_iflag & IGNBRK) 
    {
        sp->port.ignore_status_mask |= UART_LSR_BI;

        if (termios->c_iflag & IGNPAR)
        {
            sp->port.ignore_status_mask |= UART_LSR_OE;
        }
    }

    if ((termios->c_cflag & CREAD) == 0)
    {
        sp->port.ignore_status_mask |= UART_LSR_DR;
    }

    sp->ier &= ~UART_IER_MSI;
    if (SNX_ENABLE_MS(&sp->port, termios->c_cflag))
    {
        sp->ier |= UART_IER_MSI;
    }
    
    WRITE_UART_LCR(sp, cval | UART_LCR_DLAB);
    
    WRITE_UART_DLL(sp, quot & 0xff);     
    WRITE_UART_DLM(sp, quot >> 8);       

    WRITE_UART_FCR(sp, fcr);
    
    WRITE_UART_LCR(sp, cval);        
    
    sp->lcr = cval;             
    
    sunix_ser_set_mctrl(&sp->port, sp->port.mctrl);
    
    WRITE_UART_IER(sp, sp->ier);

    spin_unlock_irqrestore(&sp->port.lock, flags);
}


static void sunix_ser_timeout(unsigned long data)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)data;
    unsigned int timeout;
    unsigned int iir;

    iir = READ_UART_IIR(sp);
    
    if (!(iir & UART_IIR_NO_INT)) 
    {
        spin_lock(&sp->port.lock);
        sunix_ser_handle_port(sp, iir);
        spin_unlock(&sp->port.lock);
    }

    timeout = sp->port.timeout;
    timeout = timeout > 6 ? (timeout / 2 - 2) : 1;
    
    mod_timer(&sp->timer, jiffies + timeout);
}


static _INLINE_ void sunix_ser_receive_chars(struct sunix_ser_port *sp, unsigned char *status)
{
    struct tty_struct *tty = sp->port.info->tty;
    unsigned char ch;
    int max_count = 256;
    unsigned char lsr = *status;
    char flag;

    do 
    {
        ch = READ_UART_RX(sp);
        flag = TTY_NORMAL;
        sp->port.icount.rx++;

#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,4,18))  
        if (unlikely(lsr & (UART_LSR_BI | UART_LSR_PE | UART_LSR_FE | UART_LSR_OE))) 
#else
        if (lsr & (UART_LSR_BI | UART_LSR_PE | UART_LSR_FE | UART_LSR_OE))
#endif
        {

            if (lsr & UART_LSR_BI) 
            {
                lsr &= ~(UART_LSR_FE | UART_LSR_PE);
                sp->port.icount.brk++;

                if (snx_ser_handle_break(&sp->port))
                {
                    goto ignore_char;
                }
            } 
            else if (lsr & UART_LSR_PE)
            {
                sp->port.icount.parity++;
            }
            else if (lsr & UART_LSR_FE)
            {
                sp->port.icount.frame++;
            }
            
            if (lsr & UART_LSR_OE)
            {
                sp->port.icount.overrun++;
            }
            
            lsr &= sp->port.read_status_mask;


            if (lsr & UART_LSR_BI) 
            {
                flag = TTY_BREAK;
            } 
            else if (lsr & UART_LSR_PE)
            {
                flag = TTY_PARITY;
            }
            else if (lsr & UART_LSR_FE)
            {
                flag = TTY_FRAME;
            }
        }
        

        if ((I_IXOFF(tty)) || I_IXON(tty))
        {
            if (ch == START_CHAR(tty))
            {
                tty->stopped = 0; 
                sunix_ser_start_tx(&sp->port, 1);
                goto ignore_char;
            }
            else if (ch == STOP_CHAR(tty))
            {
                tty->stopped = 1; 
                sunix_ser_stop_tx(&sp->port, 1);
                goto ignore_char;
            }
        }

        snx_ser_insert_char(&sp->port, lsr, UART_LSR_OE, ch, flag);

ignore_char:
        lsr = READ_UART_LSR(sp);
        
        if (lsr == 0xff)
        {
            lsr = 0x01;
        }
        
    } while ((lsr & UART_LSR_DR) && (max_count-- > 0));
    
    spin_unlock(&sp->port.lock);
    tty_flip_buffer_push(tty);
    spin_lock(&sp->port.lock);
    *status = lsr;
}


static _INLINE_ void sunix_ser_transmit_chars(struct sunix_ser_port *sp)
{
    struct circ_buf *xmit = &sp->port.info->xmit;
    int count;
    
    if ((!sp) || (!sp->port.iobase)) 
    {
        return;
    }

    if (!sp->port.info)
    {
        return;
    }

    if (!xmit)
    {
        return;
    }

    if (sp->port.x_char) 
    {
        WRITE_UART_TX(sp, sp->port.x_char);
        sp->port.icount.tx++;
        sp->port.x_char = 0;
        return;
    }
    
    if (snx_ser_circ_empty(xmit) || snx_ser_tx_stopped(&sp->port)) 
    {
        sunix_ser_stop_tx(&sp->port, 0);
        return;
    }

    count = sp->port.fifosize;
    
    do 
    {
        WRITE_UART_TX(sp, xmit->buf[xmit->tail]);
    
        xmit->tail = (xmit->tail + 1) & (SNX_UART_XMIT_SIZE - 1);
        sp->port.icount.tx++;
        
        if (snx_ser_circ_empty(xmit))
        {
            break;
        }
        
    } while (--count > 0);

    if (snx_ser_circ_chars_pending(xmit) < WAKEUP_CHARS)
    {
        snx_ser_write_wakeup(&sp->port);
    }
    
    if (snx_ser_circ_empty(xmit))
    {
        sunix_ser_stop_tx(&sp->port, 0);
    }
}


static _INLINE_ void sunix_ser_check_modem_status(struct sunix_ser_port *sp, unsigned char status)
{
    if ((status & UART_MSR_ANY_DELTA) == 0)
    {
        return;
    }
    
    if (!sp->port.info)
    {	
        return;
    }

    if (status & UART_MSR_TERI)
    {
        sp->port.icount.rng++;
    }
    
    if (status & UART_MSR_DDSR)
    {
        sp->port.icount.dsr++;
    }
        
    if (status & UART_MSR_DDCD)
    {
        snx_ser_handle_dcd_change(&sp->port, status & UART_MSR_DCD);
    }
        
    if (status & UART_MSR_DCTS)
    {
        snx_ser_handle_cts_change(&sp->port, status & UART_MSR_CTS);
    }
    
    wake_up_interruptible(&sp->port.info->delta_msr_wait);
}


static _INLINE_ void sunix_ser_handle_port(struct sunix_ser_port *sp, unsigned char iir)
{
    unsigned char lsr = READ_UART_LSR(sp);
    unsigned char msr = 0;

    if (lsr == 0xff)
    {
        lsr = 0x01;
    }
    
    if ((iir == UART_IIR_RLSI) || (iir == UART_IIR_CTO) || (iir == UART_IIR_RDI))
    {
        sunix_ser_receive_chars(sp, &lsr);                 
    }

    if ((iir == UART_IIR_THRI) && (lsr & UART_LSR_THRE))  
    {
        sunix_ser_transmit_chars(sp);
    }
    
    msr = READ_UART_MSR(sp);

    if (msr & UART_MSR_ANY_DELTA)  
    {
        sunix_ser_check_modem_status(sp, msr);  
    }
    else 
    {
        if ((iir == 0x00) && (sp->port.chip_flag == SUN1699_HWID))
        {
            if (!(sp->ier & UART_IER_THRI)) 
            {
                sp->ier |= UART_IER_THRI;
                WRITE_UART_IER(sp, sp->ier);
            }
        }
    }
}


#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))  
static struct tty_operations sunix_tty_ops = 
{
    .open               = snx_ser_open,
    .close              = snx_ser_close,
    .write              = snx_ser_write,
    .put_char           = snx_ser_put_char,
    .flush_chars        = snx_ser_flush_chars,
    .write_room         = snx_ser_write_room,
    .chars_in_buffer    = snx_ser_chars_in_buffer,
    .flush_buffer       = snx_ser_flush_buffer,
    .ioctl              = snx_ser_ioctl,
    .throttle           = snx_ser_throttle,
    .unthrottle         = snx_ser_unthrottle,
    .send_xchar         = snx_ser_send_xchar,
    .set_termios        = snx_ser_set_termios,
    .stop               = snx_ser_stop,
    .start              = snx_ser_start,
    .hangup             = snx_ser_hangup,
    .break_ctl          = snx_ser_break_ctl,
    .wait_until_sent    = snx_ser_wait_until_sent,  
    .tiocmget           = snx_ser_tiocmget,
    .tiocmset           = snx_ser_tiocmset,
};
#endif 


extern int sunix_ser_register_driver(struct snx_ser_driver *drv)
{
    struct tty_driver *normal = NULL;
    int i;
    int ret = 0;

    drv->state = kmalloc(sizeof(struct snx_ser_state) * drv->nr, GFP_KERNEL);
    
    ret = -ENOMEM;

    if (!drv->state)
    {
        printk("SNX Error: Allocate memory fail !\n\n");
        goto out;
    }
    
    memset(drv->state, 0, sizeof(struct snx_ser_state) * drv->nr);

    for (i = 0; i < drv->nr; i++) 
    {
        struct snx_ser_state *state = drv->state + i;

        if (!state)
        {
            ret = -1;
            printk("SNX Error: Memory error !\n\n");
            goto out;
        }            

        state->close_delay     = 5 * HZ / 100;
        state->closing_wait    = 3 * HZ;

        init_MUTEX(&state->sem);
    }

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)) 
    normal = alloc_tty_driver(drv->nr);
#else
    normal = &drv->tty_driver;
#endif
    
    if (!normal)
    {
        printk("SNX Error: Allocate tty driver fail !\n\n");
        goto out;
    }
    
    memset(normal, 0, sizeof(struct tty_driver));

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)) 
    drv->tty_driver = normal;
#endif

    normal->magic                   = TTY_DRIVER_MAGIC;
    normal->name                    = drv->dev_name;
    normal->major                   = drv->major;
    normal->minor_start             = drv->minor;
    normal->num                     = (SNX_SER_TOTAL_MAX + 1);
    normal->type                    = TTY_DRIVER_TYPE_SERIAL;
    normal->subtype                 = SERIAL_TYPE_NORMAL;
    normal->flags                   = TTY_DRIVER_REAL_RAW;
    normal->init_termios            = tty_std_termios;
    normal->init_termios.c_cflag    = B9600 | CS8 | CREAD | HUPCL | CLOCAL;
    normal->init_termios.c_iflag    = 0;

    normal->driver_state            = drv;

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)) 
    tty_set_operations(normal, &sunix_tty_ops);
#else
    normal->refcount                = &sunix_ser_refcount;
	normal->table				    = sunix_ser_tty;

	normal->termios				    = sunix_ser_termios;
	normal->termios_locked		    = sunix_ser_termios_locked;

    normal->open                    = snx_ser_open;
    normal->close                   = snx_ser_close;
    normal->write                   = snx_ser_write;
    normal->put_char                = snx_ser_put_char;
    normal->flush_chars             = snx_ser_flush_chars;
    normal->write_room              = snx_ser_write_room;
    normal->chars_in_buffer         = snx_ser_chars_in_buffer;
    normal->flush_buffer            = snx_ser_flush_buffer;
    normal->ioctl                   = snx_ser_ioctl;
    normal->throttle                = snx_ser_throttle;
    normal->unthrottle              = snx_ser_unthrottle;
    normal->send_xchar              = snx_ser_send_xchar;    
    normal->set_termios             = snx_ser_set_termios;
    normal->stop                    = snx_ser_stop;
    normal->start                   = snx_ser_start;
    normal->hangup                  = snx_ser_hangup;
    normal->break_ctl               = snx_ser_break_ctl;
    normal->wait_until_sent         = snx_ser_wait_until_sent; 
#endif

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,28)) 
        kref_init(&normal->kref);
#endif

    ret = tty_register_driver(normal);

    if (ret < 0)
    {
        printk("SNX Error: Register tty driver fail !\n\n");
        goto out;
    }

out:
    if (ret < 0)
    {
#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)) 
        put_tty_driver(normal);
#endif
        kfree(drv->state);
    }
    
    return (ret);
}


extern void sunix_ser_unregister_driver(struct snx_ser_driver *drv)
{
    struct tty_driver *normal = NULL;

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0))
    normal = drv->tty_driver;

    if (!normal)
    {
        return;
    }
    
    tty_unregister_driver(normal);
    put_tty_driver(normal);
    drv->tty_driver = NULL;

#else
    normal = &drv->tty_driver;
    if (!normal)
    {
        return;
    }

    tty_unregister_driver(normal);
#endif

    if (drv->state)
    {
        kfree(drv->state);
    }
}


static void sunix_ser_request_io(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    switch (sp->port.iotype) 
    {
        case SNX_UPIO_PORT:
            request_region(sp->port.iobase, SNX_SER_ADDRESS_LENGTH, "snx_ser");
            break;

        default:
            break;
    }
}


static void sunix_ser_configure_port(struct snx_ser_driver *drv, struct snx_ser_state *state, struct snx_ser_port *port)
{
    unsigned long flags;

    if (!port->iobase)
    {
        return;
    }

    flags = SNX_UART_CONFIG_TYPE;
    
    if (port->type != PORT_UNKNOWN) 
    {
        sunix_ser_request_io(port);

        spin_lock_irqsave(&port->lock, flags);

        sunix_ser_set_mctrl(port, 0);
        spin_unlock_irqrestore(&port->lock, flags);
    }
}


static int sunix_ser_add_one_port(struct snx_ser_driver *drv, struct snx_ser_port *port)
{
    struct snx_ser_state *state = NULL;
    int ret = 0;

    if (port->line >= drv->nr)
    {
        return -EINVAL;
    }
    
    state = drv->state + port->line;

	down(&ser_port_sem);
    
    if (state->port) 
    {
        ret = -EINVAL;
        goto out;
    }

    state->port = port;

    port->info = state->info;

    sunix_ser_configure_port(drv, state, port);

out:
	up(&ser_port_sem);
    return ret;
}


extern int sunix_ser_register_ports(struct snx_ser_driver *drv)
{
    int i;
    int ret;

    for (i = 0; i < SNX_SER_TOTAL_MAX + 1; i++) 
    {
        struct sunix_ser_port *sp = &sunix_ser_table[i];

        if (!sp)
        {
            return -1;
        }     

        sp->port.line = i;

        if (sp->port.iobase)
        {
            init_timer(&sp->timer);

            sp->timer.function = sunix_ser_timeout;

            sp->mcr_mask = ~0;
            sp->mcr_force = 0;
            
            ret = sunix_ser_add_one_port(drv, &sp->port);
            
            if (ret != 0)
            {
                return ret;
            }
        }
    }

    return 0;
}


static void sunix_ser_release_io(struct snx_ser_port *port)
{
    struct sunix_ser_port *sp = (struct sunix_ser_port *)port;

    switch (sp->port.iotype) 
    {
        case SNX_UPIO_PORT:
            release_region(sp->port.iobase, SNX_SER_ADDRESS_LENGTH);
            break;

        default:
            break;
    }
}


static void sunix_ser_unconfigure_port(struct snx_ser_driver *drv, struct snx_ser_state *state)
{
    struct snx_ser_port *port = state->port;
    struct snx_ser_info *info = state->info;

    if (info && info->tty)
    {
        tty_hangup(info->tty);
    }
    
	down(&state->sem);

    state->info = NULL;
    
    if (port->type != PORT_UNKNOWN)
    {
        sunix_ser_release_io(port);
    }
    
    port->type = PORT_UNKNOWN;

    if (info) 
    {
        tasklet_kill(&info->tlet);
        kfree(info);
    }

	up(&state->sem);
}


static int sunix_ser_remove_one_port(struct snx_ser_driver *drv, struct snx_ser_port *port)
{
    struct snx_ser_state *state = drv->state + port->line;

    if (state->port != port)
    {
        printk("SNX Info : Removing wrong port: %p != %p\n\n",state->port, port);
    }
    
	down(&ser_port_sem);

    sunix_ser_unconfigure_port(drv, state);
    
    state->port = NULL;
    
	up(&ser_port_sem);
    return 0;
}


extern void sunix_ser_unregister_ports(struct snx_ser_driver *drv)
{
    int i;

    for (i = 0; i < SNX_SER_TOTAL_MAX + 1; i++) 
    {
        struct sunix_ser_port *sp = &sunix_ser_table[i];

        if (sp->port.iobase)
        {
            sunix_ser_remove_one_port(drv, &sp->port);
        }
    }
}


extern int sunix_ser_interrupt(struct sunix_board *sb, struct sunix_ser_port *first_sp)
{
    struct sunix_ser_port *sp = NULL;
    int i;
    int max;
    int irqbits;
    int bits;
    int pass_counter = 0;   
    unsigned char iir;

    max = sb->ser_port;

    if ((first_sp->port.port_flag & PORTFLAG_REMAP) == PORTFLAG_REMAP)
    {
        while (1) 
        {                     
            for (i = 0; i < max; i++)
            {
                sp = first_sp + i;
                
                if (!sp->port.iobase)
                {
                    continue;
                }
                            
                iir = READ_UART_IIR(sp) & 0x0f;
                
                if (iir & UART_IIR_NO_INT)
                {
                    continue;
                }
                else
                {
                    spin_lock(&sp->port.lock);
                    sunix_ser_handle_port(sp, iir);
                    spin_unlock(&sp->port.lock);
                } 
            }                                   

            if (pass_counter++ > INTERRUPT_COUNT) 
            {
                break;  
            }
        }
    }
    else if (first_sp->port.snx_type == SNX_SER_PORT_SUN1999)
    {
    	while (1) 
    	{   
    		irqbits = READ_1999_INTERRUPT_VECTOR_WORD(sb,first_sp) & first_sp->port.vector_mask;

    	  if (irqbits == 0x0000)
    	  {
    	   	break;  
    	  }
                  
    	  for (i = 0, bits = 1; i < max; i++, bits <<= 1) 
    	  {
    	  	if (!(bits & irqbits))
    	    {
      	  	continue;
      	  }

     	    sp = first_sp + i; 
                
     	    iir = READ_UART_IIR(sp) & 0x0f;

     	    if (iir & UART_IIR_NO_INT)
     	    {
     	    	continue;
     	    }
     	    else
     	    {
      	  	spin_lock(&sp->port.lock);
          	sunix_ser_handle_port(sp, iir);
        	  spin_unlock(&sp->port.lock);
         	} 
        }
            
        if (pass_counter++ > INTERRUPT_COUNT) 
        {
        	break;  
        }
      }	
		}	
  	else	
		{
			if (first_sp->port.snx_type == SNX_SER_PORT_SUNMATX)
			{
      	while (1) 
        {   
        	irqbits = READ_INTERRUPT_VECTOR_WORD(first_sp) & first_sp->port.vector_mask;

          if (irqbits == 0x0000)
          {
          	break;  
          }
                  
          for (i = 0, bits = 1; i < max; i++, bits <<= 1) 
          {
          	if (!(bits & irqbits))
            {
            	continue;
            }

            sp = first_sp + i; 
                
            iir = READ_UART_IIR(sp) & 0x0f;

            if (iir & UART_IIR_NO_INT)
            {
            	continue;
            }
            else
            {
            	spin_lock(&sp->port.lock);
              sunix_ser_handle_port(sp, iir);
              spin_unlock(&sp->port.lock);
            } 
           }
            
           if (pass_counter++ > INTERRUPT_COUNT) 
           {
           		break;  
           }
        }	
			}
			else
    	{
      	while (1) 
        {   
        	irqbits = READ_INTERRUPT_VECTOR_BYTE(first_sp) & first_sp->port.vector_mask;
        
          if (irqbits == 0x0000)
          {
          	break;  
          }
                  
          for (i = 0, bits = 1; i < max; i++, bits <<= 1) 
          {
           	if (!(bits & irqbits))
            {
            	continue;
						}

            sp = first_sp + i; 
                
            iir = READ_UART_IIR(sp) & 0x0f;

            if (iir & UART_IIR_NO_INT)
            {
             	continue;
            }
            else
            {
             	spin_lock(&sp->port.lock);
             	sunix_ser_handle_port(sp, iir);
             	spin_unlock(&sp->port.lock);
            } 
          }
            
          if (pass_counter++ > INTERRUPT_COUNT) 
          {
          	 	break;  
          }
        }
    	}	
		}

    return 0;
}


