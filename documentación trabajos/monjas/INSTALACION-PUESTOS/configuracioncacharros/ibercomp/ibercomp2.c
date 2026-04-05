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
// ./orden2 ibercomp2 ibercomp2.c
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

gint programarvelocidad_8ed8sd8ea8sa_ibercomp(GList *datalista)
{
	GList *listaprogramar=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0, velocidad13=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[6]={0}, *tramavuelta = NULL;	
	gint fdpuerto;
	guchar crccorrecto = 0, crcrecibido = 0, comandoenviado=0, comandorecibido=0;
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	
	gint valor13=0;
	guchar valor13_ida = 0;
	
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
		velocidad13=atoi(g_list_nth_data(listaprogramar,13)); 	//velocidad a programar

		valor13=((256*velocidad13)-115200)/velocidad13;
		g_printf("\nVELOCIDAD=%d------>VALOR EN TRAMA=%d\n",velocidad13,valor13);
		valor13_ida=valor13;
		
		//////////////////////////////////////////////////
		// enviar:  <comando> <196> <13> <valor> <crc>	//
		// recibir: <crc>								//
		//////////////////////////////////////////////////
		if(eco==1)
			tamtramavuelta=6;
		else
			tamtramavuelta=1;
		
		tramaida[0] = comando;
		tramaida[1] = 196;
		tramaida[2] = 13;	//reg=13
		tramaida[3] = valor13_ida;
		tramaida[4] = tramaida[0] + tramaida[1] + tramaida[2] + tramaida[3];
		tramaida[5] = 0;
		
		g_printf("\nfuncionesespeciales----programar ibercomp----puerto---->%s---->tramaida:[%d][%d][%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",3,idpuerto,NULL);			
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",4,idpuerto,NULL);			
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto);
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,5);
				if (respuesta == -1)
				{
						FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",5,idpuerto,NULL);			
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
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1]+tramaida[2]+tramaida[3]+tramaida[4];
							if(eco==1)
							{
								crcrecibido = tramavuelta [5]; //crc del eco
								if(tramaida[4] != tramavuelta[4])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",7,idpuerto,NULL);			
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[4] == tramavuelta[4] ) && 
										( tramavuelta[5] == 0 ) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",8,idpuerto,NULL);			
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d][%d][%d]<-------->TRAMA VUELTA=recibido:[%d]\n",tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4],tramavuelta[5]);
							}
							else
							{
								crcrecibido = tramavuelta [0];	
								g_printf("\n>>>comando enviado:[%d][%d][%d][%d][%d]<-------->TRAMA VUELTA=recibido:[%d]\n",tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4],tramavuelta[0]);
							}
							
							actualizar_pcb=FALSE;
							if (crccorrecto == crcrecibido)
							{
								actualizar_pcb=TRUE;
							}
							else
							{							
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","programar",9,idpuerto,NULL);			
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION IBERCOMP PROGRAMAR OK comando:[%d]<\n",comando);	
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION IBERCOMP PROGRAMAR ERROR? comando:[%d]<\n",comando);					
	return -1;
}
//
gint leervelocidad_8ed8sd8ea8sa_ibercomp(GList *datalista)
{
	GList *listainfo=datalista;
	//
	gint respuesta=-1, estado=-1, idsemaforo=-1;
	gint idpuerto=-1, comando=0, velocidad=0, paridad=0, bitstop=0, tipolectura=0, velocidad13=0;
	gint tipoenviobits=0, bitsdatos=0, eco=0, tiempolectura=0, tiempodesbloqueo=0, tiempotrama=0, tiemposalidarb=0;
	gchar puerto[50]={0};
	gint tamtramavuelta = 0;	
	guchar tramaida[5]={0}, *tramavuelta = NULL;	
  	guchar valorparametro;		
	gint fdpuerto;	
	guchar crccorrecto = 0, crcrecibido = 0;
	gboolean haydato_hayeco_ok=FALSE;
	gboolean actualizar_pcb=FALSE;	
	gint valor13=0;
	gchar *velocidad_dato=NULL;	
	gchar iden[10]={0};	

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

		//////////////////////////////////////////
		// enviar:  <comando> <228> <13> <crc>	//
		// recibir: <valor> <crc>				//
		//////////////////////////////////////////
		if(eco==1)
			tamtramavuelta=6;
		else
			tamtramavuelta=2;
		
		tramaida[0] = comando;
		tramaida[1] = 228;
		tramaida[2] = 13;	//reg=13
		tramaida[3] = tramaida[0] + tramaida[1] + tramaida[2];
		tramaida[4] = 0;
					
		g_printf("\nfuncionesespeciales----ibercomp-leer velocidad----puerto---->%s---->tramaida:[%d][%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2],tramaida[3]);
					
		estado = FEF_abrirpuertoserie_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",3,idpuerto,NULL);			
		}
		else
		{
			estado=FEF_configurarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",4,idpuerto,NULL);							
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto);
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_funcionesespeciales_libgsksoa(fdpuerto,tramaida,4);
				if (respuesta == -1)
				{
					FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",5,idpuerto,NULL);			
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
							FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",6,idpuerto,NULL);			
							usleep(tiempodesbloqueo);
						}
						else
						{
							haydato_hayeco_ok=TRUE;
							crccorrecto = tramaida[0]+tramaida[1]+tramaida[2]+tramaida[3];
							if(eco==1)
							{
								crccorrecto=crccorrecto+tramavuelta [4];
								crcrecibido = tramavuelta [5];
								valorparametro = tramavuelta [4];		
								if(tramaida[3] != tramavuelta[3])
								{
									FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",7,idpuerto,NULL);			
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[3] == tramavuelta[3] ) && 
										( tramavuelta[4] == 0 ) && (tramavuelta[5] == 0) )
									{
										FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",8,idpuerto,NULL);			
										haydato_hayeco_ok=FALSE;
										usleep(tiempodesbloqueo);
									}
								}
								g_printf("\n>>>comando enviado:[%d][%d][%d][%d]<-------->TRAMA VUELTA=recibido:[%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramavuelta[4],tramavuelta[5]);								
							}
							else
							{
								crccorrecto=crccorrecto+tramavuelta [0];
								crcrecibido = tramavuelta [1];	
								valorparametro = tramavuelta [0];									
								g_printf("\n>>>comando enviado:[%d][%d][%d][%d]<-------->TRAMA VUELTA=recibido:[%d][%d]\n",tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramavuelta[0],tramavuelta[1]);
							}
							
							actualizar_pcb=FALSE;
							if (crccorrecto == crcrecibido )
							{
								actualizar_pcb=TRUE;
							}
							else
							{						
								FEF_logespeciales_funcionesespeciales_libgsksoa (0,comando,0,"ibercomp_fe","infovelocidad",9,idpuerto,NULL);			
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_funcionesespeciales_libgsksoa(fdpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					valor13=valorparametro;
					velocidad13=(115200)/(256-valor13);
					
					g_printf("\n>OPERACION IBERCOMP LEER VELOCIDAD OK comando:[%d]<\n",comando);					
					g_printf("INFORMACION IBERCOMP VELOCIDAD:leido[%d]--->velocidad-->[%d]<\n",valorparametro,velocidad13);
					
					return 1;
				}
				if(velocidad_dato != NULL)
				{
					g_free(velocidad_dato);
					velocidad_dato = NULL;
				}				
		}		
	}
	
	g_printf("\n>OPERACION IBERCOMP LEER VELOCIDAD ERROR comando:[%d]<\n",comando);					
	return -1;
}
///
gint main (int argc, char *argv[])
{	
	gint resultado=-1;
	gint operacion=-1;	
	GList *listaoperacion=NULL;
	//recibe 4/5 argumentos: tipo operacion(0,1)-comando-puerto(0,1,..)-[velocidad]-eco(1,2)//
	//g_printf("\n----%s----%s---%s----%s---\n",argv[1],argv[2],argv[3],argv[4],argv[5]);
	//	
	if(argv[1]!=NULL)
	{
		operacion=atoi(argv[1]);
		g_print( "\n\n\n=======================================\n",operacion);				
		g_print( ">>>>>>operacion:%d ibercomp inicio<<<<<\n",operacion);				
		switch(operacion)
		{
			case 0:
			if(argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL && argv[5]!=NULL)
			{
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("19200",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("2",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("8",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[5],NULL)); //eco
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));	
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL));		
	
				resultado=programarvelocidad_8ed8sd8ea8sa_ibercomp(listaoperacion);
				if(resultado!=1)
				{
					g_print( "\n>>>>>>OPERACION IBERCOMP - ERROR - NO EJECUTADA<<<<<\n" );
				}				
			}			
			else
			{
				g_print( "\n>>>>>>OPERACIONES IBERCOMP - ERROR EN ARGUMENTOS: operacion 0<<<<<\n" );		
				g_print( "\n      ARGUMENTOS : operacion  comando  puerto  velocidad  eco \n" );				
				g_print( "                   (0)                 (0,1)              (1,0)    ej.: 0 2 1 57600 1\n" );				
			}
			break;
			case 1:
			if(argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL)
			{
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("19200",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("2",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("8",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL)); //eco
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));	
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		

				resultado=leervelocidad_8ed8sd8ea8sa_ibercomp(listaoperacion);
	
				if(resultado!=1)
				{
					g_print( "\n>>>>>>OPERACION IBERCOMP - ERROR - NO EJECUTADA<<<<<\n" );	
				}				
			}
			else
			{
				g_print( "\n>>>>>>OPERACIONES IBERCOMP - ERROR EN ARGUMENTOS: operacion 1<<<<<\n" );		
				g_print( "\n      ARGUMENTOS : operacion  comando  puerto  eco\n" );
				g_print( "                   (1)                 (0,1)   (1,0)    ej.: 1 2 1 1\n" );
			}
			break;
			default:
			g_print( "\n>>>>>>OPERACIONES IBERCOMP - ERROR EN ARGUMENTO OPERACION: operacion NO EXISTE...\n (operaciones validas: 0,1)<<<<<\n\n\n" );					
		}
		g_print( "\n>>>>>>operaciones ibercomp ejecutado<<<<<\n" );	
		g_print( "=========================================\n\n\n" );	
	}
	else
	{
		g_print( "\n\n\n>>>>>>OPERACIONES IBERCOMP - ERROR EN ARGUMENTO 1:operacion<<<<<\n" );		
		g_print( "\n      ARGUMENTO 1= operacion(0,1)\n" );				
		g_print( "      AYUDA operacion: ./ibercomp 0[1]\n\n\n" );				
	}
	//
	exit(0);
}
