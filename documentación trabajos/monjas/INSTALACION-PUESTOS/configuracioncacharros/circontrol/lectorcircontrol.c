#include <glib.h>
#include <time.h>
#include <dlfcn.h>
#include <locale.h>
#include <stdio.h>
#include <glib.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

#ifndef __FUNCIONESESPECIALESPUERTO__
#define __FUNCIONESESPECIALESPUERTO__
gint funcionesespeciales_fdpuerto[17]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,NULL};
#endif

////////////////////////////////////////////
// ./orden2 circontrol2 lectorcircontrol2.c
//////////////funciones puerto////////////////////////////////////////////
/*INI*/
/*SOY{FEF{FEF_logespeciales_funcionesespeciales_libgsksoa{*/
gint FEF_logespeciales_funcionesespeciales_libgsksoa (gint rb, gint comando, gint borna, gchar *driver, gchar *nemotecnico, gint codigoerror, gint puerto, gchar *mensaje)
{
	#define NUMERROR 34
	static gboolean initlog_logespeciales_funcionesespeciales_libgsksoa = FALSE;
	gint respuesta=-1;
	static gchar *descripcionerrores[NUMERROR]={
	"Error0e al sincronizar el puerto serie, no se pudo crear el semaforo",
	"Error1e al iniciar el envio por el puerto serie, no se puede poner en rojo",
	"Error2e al terminar envio por el puerto serie, no se puede poner en verde",
	"Error3e al abrir puerto serie, no tiene permisos suficientes",
	"Error4e al configurar el puerto serie, no tiene permisos suficientes",
	"Error5e al escribir el puerto serie, no tiene permisos suficientes",
	"Error6e al leer del puerto serie, no se recibe respuesta",
	"Error7e en la trama vuelta con eco, no recibe el eco",
	"Error8e en la trama vuelta con eco, solo recibe el eco",
	"Error9e en la trama vuelta CRC, no corresponde",		
	"Error10e al programar el rb, VP's incompletos",
	"Error11e al enviar confirmacion, lector",
	"Error12e al recibir confirmacion, lector",		
	"Error13e al sincronizar el comando, no se pudo crear el semaforo, comando",
	"Error14e al iniciar la sincronizacion comando, no se puede poner en rojo",
	"Error15e al terminar, la sincronizacion comando, no se puede poner en verde",
	"Error16e al exitar los RB's del comando, por lectura de senal",
	"Error17e al iniciar driver, iniciando condiciones nivel comando",
	"Error18e al iniciar driver, iniciando mutex nivel comando",
	"Error19e al exitar los RB's del comando,cambio estado en comunicante",
	"Error20e al dormir el RB",
	"Error21e al exitar al RB, por cambio de senal",
	"Error22e identidad de tarjeta desconocida",
	"Error23e al esperar senal mientras dormia",
	"Error24e al exitar RB, por cambio de estado de comunicante",
	"Error25e al iniciar driver, iniciando condicion para el RB",
	"Error26e al iniciar driver, iniciando mutex para el RB",	
	"AVISO27e",
	"Error28e al acceder al clip, acceso erroneo o imposible",
	"Error29e al escribir-leer trama clip, en alguna obtencion trama, checksum",
	"Error30e no existe el puerto de comunicacion",
	"Error31e respuesta no coincide con el protocolo",
	"Errore no codificado",
	NULL};
	gchar fichero[100]={0};
	gchar puerto_l[10]={0};
	FILE *fdlog;	
	struct tm *fecha;
  	time_t reloj;
	gchar dia[12]={0};
	gchar hora[10]={0};
		
	if(codigoerror>=NUMERROR)
		codigoerror=NUMERROR;

	time(&reloj);
	fecha=localtime(&reloj);
	strftime(hora,10,"%X",fecha);		
	strftime(dia,12,"%d/%m/%Y",fecha);			
	
	if (initlog_logespeciales_funcionesespeciales_libgsksoa== FALSE)
	{
		respuesta=system ("mkdir -p ./log");
		if (respuesta != -1 && respuesta != 127)
		{
			initlog_logespeciales_funcionesespeciales_libgsksoa=TRUE;
		}
	}
	strcpy(fichero,"./log/logespeciales");	
	sprintf(puerto_l,"%d",puerto);
	
	strcat(fichero,puerto_l);		
	fdlog = fopen(fichero,"a+");	
	

	if (mensaje != NULL)
		fprintf(fdlog,"[RB%d][%s][%s][PUERTO=%d][DRIVER=%s][COMANDO=%d][BORNA=%d][NEMOTECNICO=%s][%s][%s]\n",rb,dia,hora,puerto,driver,comando,borna,nemotecnico,descripcionerrores[codigoerror],mensaje);	
	else
		fprintf(fdlog,"[RB%d][%s][%s][PUERTO=%d][DRIVER=%s][COMANDO=%d][BORNA=%d][NEMOTECNICO=%s][%s]\n",rb,dia,hora,puerto,driver,comando,borna,nemotecnico,descripcionerrores[codigoerror]);
	
	fclose(fdlog);
	return 1;
}
/*FIN*/

//
/*INI*/
/*SOY{FEF{FEF_abrirpuertoserie_funcionesespeciales_libgsksoa{*/
gint FEF_abrirpuertoserie_funcionesespeciales_libgsksoa (gint idpuerto,gint *descriptor)
{	
	gint fd;
	gchar puerto[16]={0};
	if (idpuerto >= 0)
	{				
		if (funcionesespeciales_fdpuerto[idpuerto] == -1)
		{
			sprintf(puerto,"/dev/ttyS%d",idpuerto);
			fd = open(puerto, O_RDWR | O_NOCTTY );
			if (fd < 0) 
			{  
				printf("\nError-fd error-al abrir puerto\n");
				return -1;
			}
			funcionesespeciales_fdpuerto[idpuerto] = fd;
			*descriptor = fd;
			return 1;		
		}
		else
		{
			*descriptor = funcionesespeciales_fdpuerto[idpuerto];
			return 0;
		}	
	}
	return -1;	
}
/*FIN*/

/*INI*/
/*SOY{FEF{FEF_configurarpuertoserie_funcionesespeciales_libgsksoa{*/
gint FEF_configurarpuertoserie_funcionesespeciales_libgsksoa (gint descriptorpuerto, gint velocidad, gint paridad, gint bitstop, gint canonico, gint sincrono, gint bitdatos)
{
	struct termios conf_puerto_actual;
	gint velocidad_puerto = 0, dev = 0;
	
	if ( (descriptorpuerto <= 0) || (paridad < 1 || paridad >3 ) || (bitstop < 1 || bitstop > 2) || 
			(canonico < 1 || canonico > 2) || (bitdatos < 5 || bitdatos > 8) ||
			(sincrono < 1 || sincrono > 2) || (velocidad < 50 || velocidad > 230400))
		return -1;	
				
	bzero(&conf_puerto_actual,sizeof(conf_puerto_actual));
	conf_puerto_actual.c_cflag |= (CLOCAL | CREAD);

	if (paridad == 1)//sinparidad
	{
		conf_puerto_actual.c_cflag &= ~PARENB;
	}
	else
	{
		conf_puerto_actual.c_cflag |= PARENB;	
		if (paridad == 2)//impar
		{
			conf_puerto_actual.c_cflag |= PARODD;
		}
		if (paridad == 3)//par
		{
			conf_puerto_actual.c_cflag &= ~PARODD;
		}
	}

	if (bitstop == 2)
	{
		conf_puerto_actual.c_cflag |= CSTOPB;//2 bitstop
	}
	else
	{
		conf_puerto_actual.c_cflag &= ~CSTOPB;//1 bitstop
	}
	
	conf_puerto_actual.c_cflag &= ~CSIZE;		
	
	if (canonico == 1) //comunicacion canonica
	{
		conf_puerto_actual.c_lflag = ICANON;
		conf_puerto_actual.c_lflag &= ~(ECHO | ECHOE | ISIG);
		conf_puerto_actual.c_oflag &= ~OPOST;
		conf_puerto_actual.c_cc[VEOF]     = 4;//comentar
		conf_puerto_actual.c_cc[VMIN]     = 1;//comentar
	}
	else//no canonica
	{
		conf_puerto_actual.c_cc[VEOF]     = 0;
		conf_puerto_actual.c_cc[VMIN]     = 0;		
	}

	//Activar ECHO//23-02-2006 comentar
	//conf_puerto_actual.c_lflag = ECHO;

	switch (bitdatos)
	{
		case 5 : conf_puerto_actual.c_cflag |= CS5; 
		break;
		case 6 : conf_puerto_actual.c_cflag |= CS6; 
		break;
		case 7 : conf_puerto_actual.c_cflag |= CS7; 
		break;
		case 8 : conf_puerto_actual.c_cflag |= CS8; 
		break;
		default : 
		break;
	}
	//Sincronizacion : por defecto es sincrono
	if (sincrono == 2) //si es asincrono
	{
		fcntl(descriptorpuerto, F_SETFL, FASYNC);
	}
	
	conf_puerto_actual.c_cc[VINTR]    = 0;
	conf_puerto_actual.c_cc[VQUIT]    = 0;
	conf_puerto_actual.c_cc[VERASE]   = 0;
	conf_puerto_actual.c_cc[VKILL]    = 0;
	//conf_puerto_actual.c_cc[VEOF]     = 0;//comentar ?
	conf_puerto_actual.c_cc[VTIME]    = 0;
	//conf_puerto_actual.c_cc[VMIN]     = 0;//comentar ?
	conf_puerto_actual.c_cc[VSWTC]    = 0;
	conf_puerto_actual.c_cc[VSTART]   = 0;
	conf_puerto_actual.c_cc[VSTOP]    = 0;
	conf_puerto_actual.c_cc[VSUSP]    = 0;
	conf_puerto_actual.c_cc[VSTOP]    = 0;
	conf_puerto_actual.c_cc[VSUSP]    = 0;
	conf_puerto_actual.c_cc[VEOL]     = 0;
	conf_puerto_actual.c_cc[VREPRINT] = 0;
	conf_puerto_actual.c_cc[VDISCARD] = 0;     
	conf_puerto_actual.c_cc[VDISCARD] = 0;     
	conf_puerto_actual.c_cc[VWERASE]  = 0;     
	conf_puerto_actual.c_cc[VLNEXT]   = 0;     
	conf_puerto_actual.c_cc[VEOL2]    = 0;  

	switch (velocidad)
	{
		case 50 : velocidad_puerto = B50; 
		break;
		case 75 : velocidad_puerto = B75; 
		break;
		case 110 : velocidad_puerto = B110; 
		break;
		case 134 : velocidad_puerto = B134; 
		break;
		case 150 : velocidad_puerto = B150; 
		break;
		case 200 : velocidad_puerto = B200; 
		break;
		case 300 : velocidad_puerto = B300; 
		break;
		case 600 : velocidad_puerto = B600; 
		break;
		case 1200 : velocidad_puerto = B1200; 
		break;
		case 1800 : velocidad_puerto = B1800; 
		break;
		case 2400 : velocidad_puerto = B2400; 
		break;
		case 4800 : velocidad_puerto = B4800; 
		break;
		case 9600 : velocidad_puerto = B9600; 
		break;
		case 19200 : velocidad_puerto = B19200; 
		break;
		case 38400 : velocidad_puerto = B38400; 
		break;
		case 57600 : velocidad_puerto = B57600;
		break;
		case 115200 : velocidad_puerto = B115200; 
		break;
		case 230400 : velocidad_puerto = B230400; 
		break;
		default :
		break;
	}
	
	if(cfsetispeed(&conf_puerto_actual, velocidad_puerto) !=-1 && 
		cfsetospeed(&conf_puerto_actual, velocidad_puerto) !=-1)
	{
		tcflush(descriptorpuerto, TCIFLUSH);
		dev = tcsetattr(descriptorpuerto,TCSANOW,&conf_puerto_actual); 
		if( dev == 0 )
			return 1;
		else
		{
			printf("\nError 1 al configurar\n");			
			return -1;
		} //Error 7; No se pudo configurar puerto
	}
	else
	{
		printf("\nError 2 al configurar\n");
		return -1;	 //Error 7; No se pudo configurar puerto	
	}
}
/*FIN*/

/*INI*/
/*SOY{FEF{FEF_escribirpuertoserie_funcionesespeciales_libgsksoa{*/
gint FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(gint descriptorpuerto, gchar *tramaenviar, gint tamtrama)
{
	gint i=0;
	if (descriptorpuerto >= 0)
	{
		tcflush(descriptorpuerto,TCIOFLUSH);
		if(write ( descriptorpuerto, tramaenviar, tamtrama ) == tamtrama )
		{
			return 1;
		}
		else
		{
			printf("\nError en el ecribir write\n");
			return -1;
		}
	}
	else
	{
		printf("\nError al escribir\n");			
	}
	return -1;
}
/*FIN*/
/*INI*/
/*SOY{FEF{FEF_leerpuertoserie_funcionesespeciales_libgsksoa{*/
guchar *FEF_leerpuertoserie_funcionesespeciales_libgsksoa(gint descriptorpuerto, gint tiemposec, gint tiempousec, gint tiempousleep, gint tamtrama)
{
	guchar *trama = NULL;
	fd_set fic;
	struct timeval tiempo_espera;		

	if ( descriptorpuerto >= 0	)
	{
		trama = g_malloc(sizeof(guchar)*tamtrama);
		bzero(trama,tamtrama);
		FD_ZERO(&fic);
		FD_SET(descriptorpuerto, &fic);
		tiempo_espera.tv_sec = tiemposec;
		//tiempo_espera.tv_sec = 1;
		//tiempo_espera.tv_sec = 0; de esta forma funciona mal
		tiempo_espera.tv_usec = tiempousec;
		if(select((descriptorpuerto+1), &fic, NULL, NULL, &tiempo_espera))
		{
			usleep(tiempousleep);
			if(read(descriptorpuerto, trama, tamtrama)!=-1)
			{
				//-//printf("\nLEE\n");
				gint i =0;
				while (i < tamtrama)
				{
					//--//if (trama != NULL)
						//--//printf ("[%d] ",trama[i]);						
					i++;
				}				
				return trama;
			}
			else
			{
				printf("\nTiempo de espera agotado en la lectura\n");		
			}
		}
		else
		{
			printf("\nTiempo del select agotado en lectura\n");
		}
		/*liberando trama*/
		if (trama != NULL)
		{
			g_free (trama);
			trama=NULL;
		}
		return NULL;	
	}
	else
	{
		printf("\nDescriptor de puerto menor que cero\n");
	}
	return NULL;
}
/*FIN*/
/*INI*/
/*SOY{FEF{FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa{*/
gint FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa (gint idpuerto)
{
	gint fd,res=-1;	
	if (idpuerto >= 0)
	{
			fd=funcionesespeciales_fdpuerto[idpuerto];
			res = close(fd);
			if (res == 0)
			{
				funcionesespeciales_fdpuerto[idpuerto]=-1;
				return 0;
			}		
	}
	return -1;		
}
/*FIN*/

///////////////////////////////////////////////////////////////////

//opciones//
//
gint reseteardireccion_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listaresetear=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0, comandoenviado=0, comandorecibido=0;
  	//guchar valorparametro;	
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	

	if(listaresetear!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listaresetear,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//ttyS
		comando=atoi(g_list_nth_data(listaresetear,1));			// ej.= 20
		velocidad=atoi(g_list_nth_data(listaresetear,2));		// ej.= 19200
		paridad=atoi(g_list_nth_data(listaresetear,3));			// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listaresetear,4));			// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listaresetear,5));  	//1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listaresetear,6)); 	//2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listaresetear,7)); 		// 5,6,7,8
		eco=atoi(g_list_nth_data(listaresetear,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listaresetear,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listaresetear,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listaresetear,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listaresetear,12)) * 1000);//milseg			

		//////////////////////////////
		//envio: <adr> <0x01> <bcc> //
		//respuesta: <adr>			//a continuacion olvida su direccion//
		//////////////////////////////
		if(eco==1)
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
		
		tramaida[0] = comando;
		tramaida[1] = 0x01;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
					
		g_printf("\nfuncionesespeciales\n----circontrol-RESETEAR----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",5,idpuerto,NULL);	
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1];
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crcrecibido = tramavuelta [2]; //crc del eco
								comandorecibido = tramavuelta [3];		
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---CON ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3]);				
							}
							else
							{
								crcrecibido = crccorrecto;	//no recibe crc
								comandorecibido = tramavuelta [0];		
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---SIN ECO----->TRAMA VUELTA=recibido:[%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0]);
							}
							
							g_printf("\n>>>comando enviado:[%d]<-------->TRAMA VUELTA=recibido(comando):[%d]\n",tramaida[0],comandorecibido);
							
							actualizar_pcb=FALSE;
							if ( (crccorrecto == crcrecibido) && (comandorecibido == comandoenviado) )
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","resetear",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)	//recibido comando ok//
				{
					g_printf("\n>OPERACION CIRCONTROL RESETEAR OK comando:[%d]<\n",comando);
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL RESETEAR ERROR? comando:[%d]<\n",comando);					
	g_printf(">COMPROBAR OPERACION CIRCONTROL SI OK<\n");					
	return -1;
}
//
gint programardireccion_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listaprogramar=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0, comandoenviado=0, comandorecibido=0;
  	//guchar valorparametro;	
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	

	if(listaprogramar!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listaprogramar,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//tty
		comando=atoi(g_list_nth_data(listaprogramar,1));		// ej.= 20
		velocidad=atoi(g_list_nth_data(listaprogramar,2));	// ej.= 19200
		paridad=atoi(g_list_nth_data(listaprogramar,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listaprogramar,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listaprogramar,5));  //1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listaprogramar,6)); //2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listaprogramar,7)); 	// 5,6,7,8
		eco=atoi(g_list_nth_data(listaprogramar,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listaprogramar,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listaprogramar,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listaprogramar,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listaprogramar,12)) * 1000);//milseg			

		//////////////////////////////si no ha leido una tarjeta se ignora.
		//envio: <adr> <0x00> <bcc> //si hay tarjeta leida y no tiene direccion
		//respuesta: <adr>			//debe programarse con la direccion de la trama
		//////////////////////////////y responder. Si es la misma debe responder y
		if(eco==1)					//parpadear el led. //
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
				
		tramaida[0] = comando;	//direccion nueva
		tramaida[1] = 0x00;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
			
		g_printf("\nfuncionesespeciales\n----circontrol-PROGRAMAR DIRECCION----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);			
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1];
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crcrecibido = tramavuelta [2]; //crc del eco
								comandorecibido = tramavuelta [3];		
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---CON ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3]);	
							}
							else
							{
								crcrecibido = crccorrecto;	//no recibe crc
								comandorecibido = tramavuelta [0];		
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---SIN ECO----->TRAMA VUELTA=recibido:[%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0]);				
							}
							
							actualizar_pcb=FALSE;
							if ( (crccorrecto == crcrecibido) && (comandorecibido == comandoenviado) )
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programardir",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL PROGRAMAR DIR   OK comando:[%d]<\n",comando);					
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL PROGRAMAR DIR   ERROR? comando:[%d]<\n",comando);					
	g_printf(">COMPROBAR OPERACION CIRCONTROL SI OK<\n");					
	return -1;
}
//
gint informacionequipo_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listainfo=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0;
	guchar comandoenviado=0, comandorecibido=0, tipoequipo=0, versionequipo=0;
  	guchar valor;	
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	

	if(listainfo!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listainfo,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//tty
		comando=atoi(g_list_nth_data(listainfo,1));		// ej.= 20
		velocidad=atoi(g_list_nth_data(listainfo,2));	// ej.= 19200
		paridad=atoi(g_list_nth_data(listainfo,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listainfo,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listainfo,5));  //1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listainfo,6)); //2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listainfo,7)); 	// 5,6,7,8
		eco=atoi(g_list_nth_data(listainfo,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listainfo,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listainfo,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listainfo,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listainfo,12)) * 1000);//milseg			

		//////////////////////////////////////////////
		//envio: <adr> <0x05> <bcc>					//
		//respuesta: <adr> <tipo> <version> <cbcc>	//
		//////////////////////////////////////////////
		if(eco==1)
			tamtramavuelta=7;
		else
			tamtramavuelta=4;
		
		tramaida[0] = comando;
		tramaida[1] = 0x05;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
					
		g_printf("\nfuncionesespeciales\n----circontrol-INFO LECTOR----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crccorrecto = tramavuelta[3]+tramavuelta[4]+tramavuelta[5];
								crccorrecto = 255 - crccorrecto;
								crcrecibido = tramavuelta [6]; //crc del eco
								comandorecibido = tramavuelta [3];		
								tipoequipo = tramavuelta [4];
								versionequipo = tramavuelta [5];								
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) && (tramavuelta[4] == 0) && (tramavuelta[5] == 0) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---CON ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3],tramavuelta[4],tramavuelta[5],tramavuelta[6]);	
							}
							else
							{
								crccorrecto = tramavuelta[0]+tramavuelta[1]+tramavuelta[2];
								crccorrecto = 255 - crccorrecto;
								crcrecibido = tramavuelta[3];
								comandorecibido = tramavuelta [0];		
								tipoequipo = tramavuelta [1];
								versionequipo = tramavuelta [2];																
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---SIN ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3]);									
							}

							actualizar_pcb=FALSE;
							if ( (crccorrecto == crcrecibido) && (comandorecibido == comandoenviado) )
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL INFORMACIONEQUIPO OK comando:[%d]<\n",comando);					
					g_printf("INFORMACION EQUIPO tipo:[%d]---version:[%d] (10=1.0)<\n",tipoequipo,versionequipo);
					
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL INFORMACIONEQUIPO ERROR? comando:[%d]<\n",comando);					
	g_printf(">COMPROBAR OPERACION CIRCONTROL SI OK<\n");					
	return -1;
}
//
gint tiempolectura_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listatiempolectura=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0, tiempolecturalector=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0, comandoenviado=0, comandorecibido=0;
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	

	if(listatiempolectura!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listatiempolectura,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//tty
		comando=atoi(g_list_nth_data(listatiempolectura,1));		// ej.= 20
		velocidad=atoi(g_list_nth_data(listatiempolectura,2));	// ej.= 19200
		paridad=atoi(g_list_nth_data(listatiempolectura,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listatiempolectura,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listatiempolectura,5));  //1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listatiempolectura,6)); //2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listatiempolectura,7)); 	// 5,6,7,8
		eco=atoi(g_list_nth_data(listatiempolectura,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listatiempolectura,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listatiempolectura,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listatiempolectura,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listatiempolectura,12)) * 1000);//milseg			
		tiempolecturalector=atoi(g_list_nth_data(listatiempolectura,13)); 	//seg.

		//////////////////////////////
		//envio: <adr> <0x30> <bcc> //tiempo relectura de fabrica= 1 seg.//
		//respuesta: <adr>			//
		//////////////////////////////
		if(eco==1)
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
		
		if(tiempolecturalector==0)
		{
			tramaida[0] = comando;
			tramaida[1] = 0x30 | 0;
			tramaida[2] = tramaida[0] + tramaida[1];
			tramaida[3] = 0;
		}
		else
		{
			tramaida[0] = comando;
			tramaida[1] = 0x30 | (tiempolecturalector/2);
			tramaida[2] = tramaida[0] + tramaida[1];
			tramaida[3] = 0;
		}
					
		g_printf("\nfuncionesespeciales\n----circontrol-PROGRAMAR TIEMPOLECTURA----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",6,idpuerto,NULL);										usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1];
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crcrecibido = tramavuelta [2]; //crc del eco
								comandorecibido = tramavuelta [3];		
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---CON ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3]);	
							}
							else
							{
								crcrecibido = crccorrecto;	//no recibe crc
								comandorecibido = tramavuelta [0];		
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---SIN ECO----->TRAMA VUELTA=recibido:[%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0]);				
							}
							
							actualizar_pcb=FALSE;
							if ( (crccorrecto == crcrecibido) && (comandorecibido == comandoenviado) )
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programartiempolectura",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL PROGRAMAR TIEMPO LECTURA OK comando:[%d]<\n",comando);
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL PROGRAMAR TIEMPO LECTURA   ERROR? comando:[%d]<\n",comando);		
	g_printf(">COMPROBAR OPERACION CIRCONTROL SI OK<\n");					
	return -1;
}
///
gint cambiarbinario_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listaresetear=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0, comandoenviado=0, comandorecibido=0;
  	//guchar valorparametro;	
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	

	if(listaresetear!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listaresetear,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//tty
		comando=atoi(g_list_nth_data(listaresetear,1));		// ej.= 20
		velocidad=atoi(g_list_nth_data(listaresetear,2));	// ej.= 19200
		paridad=atoi(g_list_nth_data(listaresetear,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listaresetear,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listaresetear,5));  //1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listaresetear,6)); //2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listaresetear,7)); 	// 5,6,7,8
		eco=atoi(g_list_nth_data(listaresetear,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listaresetear,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listaresetear,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listaresetear,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listaresetear,12)) * 1000);//milseg			

		/////////////////////////
		//COMANDO SIN RESPUESTA//
		/////////////////////////
		if(eco==1)
			tamtramavuelta=7;
		else
			tamtramavuelta=1;
		
				
		//[$] [9] [9] [Z] [SUMAanteriores] [LF]	//1//opcion OK//si pita ok//
		tramaida[0] = '$';
		tramaida[1] = '9';
		tramaida[2] = '9';
		tramaida[3] = 'Z';
		tramaida[4] = tramaida[0]+tramaida[1]+tramaida[2]+tramaida[3];
		tramaida[5] = 10;
		tramaida[6] = 0;

		g_printf("\nfuncionesespeciales\n----circontrol CAMBIAR A BINARIO lector---->%s---->tramaida:[%d][%d][%d][%d][%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4],tramaida[5],tramaida[6]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,7);

				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1];
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crcrecibido = tramavuelta [2]; //crc del eco
								comandorecibido = tramavuelta [3];		
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
							}
							else
							{
								crcrecibido = crccorrecto;	//no recibe crc
								comandorecibido = tramavuelta [0];		
							}
							if(comando!=0)				
							{
								g_printf("\n>>>comando enviado:[%d][%d][%d][%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4],tramaida[5],tramaida[6]);
							}
							else
							{
								g_printf("\n>>>comando enviado:[%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2]);
							}	
							g_printf("\n>>>recibido:[%d][%d][%d][%d][%d][%d][%d][%d]\n",tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3],tramavuelta[4],tramavuelta[5],tramavuelta[6],tramavuelta[7]);

							actualizar_pcb=FALSE;
							if ( (crccorrecto == crcrecibido) && (comandorecibido == comandoenviado) )
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"circontrol","cambiarbinario",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				//if(actualizar_pcb)	//SI PITA = OK
				//{
					g_printf("\n>OPERACION CIRCONTROL CAMBIARBINARIO FIN comando:[%d]<\n",comando);
					return 1;
				//}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL CAMBIARBINARIO comando:[%d]<\n",comando);					
	return -1;
}
///
gint fijarvelocidad_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listatiempolectura=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0, tiempolecturalector=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0, comandoenviado=0, comandorecibido=0;
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	
	gint velocidadequipo=0;
	
	if(listatiempolectura!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listatiempolectura,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//tty
		comando=atoi(g_list_nth_data(listatiempolectura,1));		// ej.= 20
		velocidad=atoi(g_list_nth_data(listatiempolectura,2));	// ej.= 19200
		paridad=atoi(g_list_nth_data(listatiempolectura,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listatiempolectura,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listatiempolectura,5));  //1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listatiempolectura,6)); //2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listatiempolectura,7)); 	// 5,6,7,8
		eco=atoi(g_list_nth_data(listatiempolectura,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listatiempolectura,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listatiempolectura,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listatiempolectura,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listatiempolectura,12)) * 1000);//milseg			
		velocidadequipo=atoi(g_list_nth_data(listatiempolectura,13)); 	//velocidad bps

		//////////////////////////////
		//envio: <adr> <0x02> <bcc> //velocidad=4800	bps
		//envio: <adr> <0x03> <bcc> //velocidad=9600
		//envio: <adr> <0x04> <bcc> //velocidad=19200
		//respuesta: <adr>			//envia la respuesta a la nueva velocidad//
		//////////////////////////////
		if(eco==1)
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
		if(velocidadequipo==4800)
		{
			tramaida[0] = comando;
			tramaida[1] = 0x02;
			tramaida[2] = tramaida[0] + tramaida[1];
			tramaida[3] = 0;
		}			
		if(velocidadequipo==9600)
		{
			tramaida[0] = comando;
			tramaida[1] = 0x03;
			tramaida[2] = tramaida[0] + tramaida[1];
			tramaida[3] = 0;
		}			
		if(velocidadequipo==19200)
		{
			tramaida[0] = comando;
			tramaida[1] = 0x04;
			tramaida[2] = tramaida[0] + tramaida[1];
			tramaida[3] = 0;
		}			
		//		
		g_printf("\nfuncionesespeciales\n----circontrol-PROGRAMAR(FIJAR VELOCIDAD a:%d)----puerto---->%s---->tramaida:[%d][%d][%d]\n",velocidadequipo,puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",6,idpuerto,NULL);
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1];
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crcrecibido = tramavuelta [2]; //crc del eco
								comandorecibido = tramavuelta [3];		
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---CON ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3]);	
							}
							else
							{
								crcrecibido = crccorrecto;	//no recibe crc
								comandorecibido = tramavuelta [0];		
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---SIN ECO----->TRAMA VUELTA=recibido:[%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0]);				
							}
							
							actualizar_pcb=FALSE;
							if ( (crccorrecto == crcrecibido) && (comandorecibido == comandoenviado) )
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,1,"circontrol","programarvelocidad",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL PROGRAMAR VELOCIDAD OK comando:[%d]<\n",comando);
					g_printf("\n>EL EQUIPO ENVIA LA RESPUESTA A LA NUEVA VELOCIDAD<\n");
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL PROGRAMAR VELOCIDAD   ERROR? comando:[%d]<\n",comando);		
	g_printf(">EL EQUIPO ENVIA LA RESPUESTA A LA NUEVA VELOCIDAD<\n");
	g_printf(">COMPROBAR OPERACION CIRCONTROL SI OK<\n");					
	return -1;
}
///
//opcion especial 7//
///
/////////////////////////////////////////////////////////////////////
///
gint informaciontag_lectorcircontrol_circontrol(GList *datalista)
{
	GList *listainfo=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[4]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0;
	guchar comandoenviado=0, comandorecibido=0, tipoequipo=0, versionequipo=0;
  	guchar valor;	
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	
	//
	guchar tiporespuesta=0;
	guchar tag4=0;
	guchar tag3=0;
	guchar tag2=0;
	guchar tag1=0;
	guchar tag0=0;
	gchar iden[10]={0};		
	gchar *aux=NULL;		
	gchar *estadolector_dato=NULL;
	//
	memset(iden,0,10);
	
	if(listainfo!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listainfo,0));		//0,1,...
		sprintf(puerto,"/dev/ttyS%d",idpuerto);					//tty
		comando=atoi(g_list_nth_data(listainfo,1));		// ej.= 20
		velocidad=atoi(g_list_nth_data(listainfo,2));	// ej.= 19200
		paridad=atoi(g_list_nth_data(listainfo,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listainfo,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listainfo,5));  //1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listainfo,6)); //2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listainfo,7)); 	// 5,6,7,8
		eco=atoi(g_list_nth_data(listainfo,8)); 			// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listainfo,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listainfo,10)); //microseg
		tiempotrama=atoi(g_list_nth_data(listainfo,11)); 	//microseg				
		tiemposalidarb=( atoi(g_list_nth_data(listainfo,12)) * 1000);//milseg			

		//////////////////////////////////////////////////////////////////////
		//envio: <adr> <0x10> <bcc>											//
		//respuesta: <adr> <0x02> <tag4> <tag3> <tag2> <tag1> <tag0> <bcc>	//
		//////////////////////////////////////////////////////////////////////
		if(eco==1)
			tamtramavuelta=11;
		else
			tamtramavuelta=8;
		
		tramaida[0] = comando;
		tramaida[1] = 0x10;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
					
		g_printf("\nfuncionesespeciales\n----circontrol-INFO TAG----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","infotag",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","infotag",4,idpuerto,NULL);
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","infotag",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						actualizar_pcb=FALSE;
				
						if (tramavuelta == NULL)
						{
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","infotag",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							comandoenviado = tramaida[0];
							if(eco==1)
							{
								crccorrecto = tramavuelta[3]+tramavuelta[4]+tramavuelta[5]+tramavuelta[6]+tramavuelta[7]+tramavuelta[8]+tramavuelta[9];
								crccorrecto = 255 - crccorrecto;
								crcrecibido = tramavuelta [10]; //crc del eco
								comandorecibido = tramavuelta [3];		
								tiporespuesta = tramavuelta [4];								
								if(tramaida[2] != tramavuelta[2])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) && (tramavuelta[4] == 0) && (tramavuelta[5] == 0) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,2,"circontrol","info",8,idpuerto,NULL);
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---CON ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3],tramavuelta[4],tramavuelta[5],tramavuelta[6],tramavuelta[7],tramavuelta[8],tramavuelta[9],tramavuelta[10]);	
								if( ( tramaida[2] == tramavuelta[2]) && (tramavuelta[4]==0x02) )	//recibido tag//
								{
									tag4 = tramavuelta [5];
									tag3 = tramavuelta [6];
									tag2 = tramavuelta [7];
									tag1 = tramavuelta [8];
									tag0 = tramavuelta [9];									
									//extraccion//
									sprintf(iden,"%hhx",tramavuelta[5]);
									estadolector_dato=g_strconcat(iden,NULL);
									//
									sprintf(iden,"%hhx",tramavuelta[6]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									sprintf(iden,"%hhx",tramavuelta[7]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									sprintf(iden,"%hhx",tramavuelta[8]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									sprintf(iden,"%hhx",tramavuelta[9]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
																													
									actualizar_pcb=TRUE;
								}
							}
							else
							{
								crccorrecto = tramavuelta[0]+tramavuelta[1]+tramavuelta[2]+tramavuelta[3]+tramavuelta[4]+tramavuelta[5]+tramavuelta[6];
								crccorrecto = 255 - crccorrecto;
								crcrecibido = tramavuelta[7];
								comandorecibido = tramavuelta [0];		
								tiporespuesta = tramavuelta [1];
								g_printf("\n>>>comando enviado:[%d][%d][%d]<---SIN ECO----->TRAMA VUELTA=recibido:[%d][%d][%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramavuelta[0],tramavuelta[1],tramavuelta[2],tramavuelta[3],tramavuelta[4],tramavuelta[5],tramavuelta[6],tramavuelta[7]);	
								if( (tramavuelta[1]==0x02) )	//recibido tag//
								{
									tag4 = tramavuelta [2];
									tag3 = tramavuelta [3];
									tag2 = tramavuelta [4];
									tag1 = tramavuelta [5];
									tag0 = tramavuelta [6];	
									//extraccion//
									sprintf(iden,"%hhx",tramavuelta[2]);
									estadolector_dato=g_strconcat(iden,NULL);
									//
									sprintf(iden,"%hhx",tramavuelta[3]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									sprintf(iden,"%hhx",tramavuelta[4]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									sprintf(iden,"%hhx",tramavuelta[5]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									sprintf(iden,"%hhx",tramavuelta[6]);
									aux=estadolector_dato;
									estadolector_dato=g_strconcat(estadolector_dato,iden,NULL);
									/*liberando aux*/
									if(aux!=NULL)
									{
										g_free(aux);
										aux=NULL;
									}
									//
									actualizar_pcb=TRUE;
								}
							}
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					//
					g_printf("\n>OPERACION CIRCONTROL INFORMACIONTAG OK comando:[%d]<\n",comando);					
					g_printf("INFORMACION TAG LEIDA:%s<\n",estadolector_dato);
					/*liberando estadolector_dato*/
					if(estadolector_dato!=NULL)
					{
						g_free(estadolector_dato);
						estadolector_dato=NULL;
					}
					
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL INFORMACIONTAG ERROR? comando:[%d]<\n",comando);					
	g_printf(">COMPROBAR OPERACION CIRCONTROL SI OK<\n");					
	return -1;
}

///
/////////////////////////////////////////////////////////////////////

///
gint main (int argc, char *argv[])
{	
	gint resultado=-1;
	gint operacion=-1;	
	gint velocidad=0;
	gboolean hay_operacion=FALSE;
	GList *listaoperacion=NULL;
	//recibe 4/5 argumentos: tipo operacion(0,1,2,3,4,5)-comando-puerto(0,1,..)-eco(1,2)-velocidadcomunicacion-[tiempolectura/velocidad]//
	//g_printf("\n----%s----%s---%s----%s---%s---\n",argv[1],argv[2],argv[3],argv[4],argv[5],argv[6]);
	//	
	if(argv[1]!=NULL)
	{
		operacion=atoi(argv[1]);
		g_print( "\n\n\n========================================\n",operacion);
		g_print( ">>>>>>operacion:%d CIRCONTROL inicio<<<<<\n",operacion);				
		if( (operacion==3) || (operacion==5) )
		{
			if( argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL && argv[5]!=NULL )
			{
				hay_operacion=TRUE;
				resultado=-1;
				if(operacion==5)
				{
					velocidad=atoi(argv[5]);
					if( (velocidad!=4800) && (velocidad!=9600) && (velocidad!=19200) )
					{
						hay_operacion=FALSE;				
					}
				}
				if(hay_operacion==TRUE)
				{
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("4800",NULL));					
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("2",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("8",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL)); //eco
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));	
					listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[5],NULL));		
	
					switch(operacion)
					{
						case 3:resultado=tiempolectura_lectorcircontrol_circontrol(listaoperacion);
						break;
						case 5:resultado=fijarvelocidad_lectorcircontrol_circontrol(listaoperacion);
						break;
					}
				}
				if(resultado!=1)
				{
					g_print( "\n>>>>>>OPERACION CIRCONTROL - ERROR? - NO EJECUTADA<<<<<\n" );					
					g_printf(">COMPROBAR OPERACION <\n");					
					if(operacion==5)
					{
						g_print( "\n>>>>>>OPERACION CIRCONTROL 5 velocidad: 4800,9600,19200<<<<<\n" );										
					}
				}
			}			
			else
			{
				g_print( "\n>>>>>>OPERACIONES CIRCONTROL - ERROR EN ARGUMENTOS: operacion<<<<<\n" );		
				if(operacion==3)
					g_print( "\n      ARGUMENTOS : operacion(3) comando puerto(0,1) eco(1,otro) tiempolectura ej.: 1 2 1 1 2\n" );				
				else
					g_print( "\n      ARGUMENTOS : operacion(5) comando puerto(0,1) eco(1,otro) velocidad(4800,9600,19200) ej.: 1 2 1 1 9600\n" );									
			}			
		}
		else
		{
			if( (operacion==0) || (operacion==1) || (operacion==2) || (operacion==4) || (operacion==7) )
			{
				if( argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL )
				{
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("4800",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("2",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("8",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL)); //eco
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
					listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));	
					listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		

					switch(operacion)
					{
						case 0:resultado=reseteardireccion_lectorcircontrol_circontrol(listaoperacion);
						break;
						case 1:resultado=programardireccion_lectorcircontrol_circontrol(listaoperacion);
						break;
						case 2:resultado=informacionequipo_lectorcircontrol_circontrol(listaoperacion);
						break;
						case 4:resultado=cambiarbinario_lectorcircontrol_circontrol(listaoperacion);
						break;
						case 7:resultado=informaciontag_lectorcircontrol_circontrol(listaoperacion);
						break;
					}
					if(resultado!=1)
					{
						g_print( "\n>>>>>>OPERACION CIRCONTROL - ERROR?-NO EJECUTADA?...COMPROBAR...<<<<<\n" );					
					}
					//
				}			
				else
				{
					g_print( "\n>>>>>>OPERACIONES CIRCONTROL - ERROR EN ARGUMENTOS: operacion 0,1,2<<<<<\n" );		
					g_print( "\n      ARGUMENTOS : operacion(0,1,2) comando puerto(0,1) eco(1,otro) ej.: 1 2 1 1\n" );					
				}
				
			}
			else
			{
				g_print( "\n>>>>>>OPERACIONES CIRCONTROL - ERROR EN ARGUMENTO OPERACION: operacion NO EXISTE... (operaciones validas: 0,1,2,3,4,5)<<<<<\n" );								
			}
		}	
		g_print( "\n>>>>>>funciones especiales...operaciones CIRCONTROL ejecutado<<<<<\n" );			
		g_print( "=====================================================================\n\n\n" );			
	}
	else
	{
		g_print( "\n>>>>>>OPERACIONES CIRCONTROL - ERROR EN ARGUMENTO 1º:operacion<<<<<\n\n" );		
		g_print( "\n--(AYUDA)---------------------------------------------------------------------------------" );
		g_print( "\n ARGUMENTO 1: operacion(solo 0,1,2,3,4,5)" );				
		g_print( "\n operacion 0: resetear lector." );				
		g_print( "\n operacion 1: programar-fijar direccion lector." );				
		g_print( "\n operacion 2: informacion equipo: tipo y version." );				
		g_print( "\n operacion 3: fijar tiempo relectura." );				
		g_print( "\n operacion 4: cambiar a binario. lector con protocolo a tipo binario" );				
		g_print( "\n operacion 5: fijar velocidad lector." );	
		g_print( "\n------------------------------------------------------------------------------------------" );		
		g_print( "\n>operacion(0,1,2) ---> 4 argumentos:" );				
		g_print( "\n operacion   comando   puerto   eco \n" );				
		g_print( " (0,1,2)     (lector)  (0,1,.)  (1:si,otro:no)   ej.: 2 1 0 1\n" );				
		g_print( "\n>operacion(3,5)   ---> 5 argumentos:" );
		g_print( "\n operacion  comando  puerto  eco            tiemporelectura" );
		g_print( "\n (3)        (lector) (0,1,.) (1:si,otro:no) (0,1,2,3,4,...)" );		
		g_print( "\n                                            (0,1=70ms?/2,3=1seg./4=2seg)  ej.: 3 1 0 1 0\n" );		
		g_print( "\n operacion  comando  puerto  eco            velocidad" );
		g_print( "\n (5)        (lector) (0,1,.) (1:si,otro:no) (4800,9600,19200)  ej.: 5 1 0 1 4800\n" );
		g_print( "\n>operacion(4)     ---> 4 argumentos:" );
		g_print( "\n operacion  comando  puerto  eco \n" );
		g_print( " (4)        (=1)     (0,1,.) (1:si,otro:no)   ej.: 4 1 1 0 \n" );
		g_print( "\n (el lector debe ser el unico en el bus para opciones: 0,1,4)" );
		g_print( "\n------------------------------------------------------------------------------------------\n" );		
	}		
	//
	exit(0);
}
