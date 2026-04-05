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

#if defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
// La union ya está definida en sys/sem.h
#else
// Tenemos que definir la union
union semun 
{ 
	int val;
	struct semid_ds *buf;
	unsigned short int *array;
	struct seminfo *__buf;
};
#endif

#ifndef __SERIEPATINESPUERTO__
#define __SERIEPATINESPUERTO__
gint seriepatines_fdpuerto[17]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,NULL};
#endif

#ifndef __FUNCIONESESPECIALESPUERTO__
#define __FUNCIONESESPECIALESPUERTO__
gint funcionesespeciales_fdpuerto[17]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,NULL};
#endif

////////////////////////////////////////////
// ./orden2 clip clip.c
////////////////////////////////////////////
//MACROS//////general//
//
#define MC_LIBERARLISTADATA_DRIVERSCLIPSERIE_LIBSOAV1(lista)\
{\
	gchar *LIBERARLISTADATA_data = NULL;\
	GList **LIBERARLISTADATA_local = NULL;\
	GList *LIBERARLISTADATA_elemento = NULL;\
	LIBERARLISTADATA_local = lista;\
	if ( LIBERARLISTADATA_local != NULL)\
	{\
		while ( (GList*)(*LIBERARLISTADATA_local) != NULL )\
		{\
			LIBERARLISTADATA_elemento = g_list_nth ((GList*)(*LIBERARLISTADATA_local),0);\
			if (LIBERARLISTADATA_elemento != NULL )\
			{\
				LIBERARLISTADATA_data = LIBERARLISTADATA_elemento->data;\
				(*LIBERARLISTADATA_local) = g_list_delete_link ((GList*)(*LIBERARLISTADATA_local),LIBERARLISTADATA_elemento);\		
				LIBERARLISTADATA_elemento = NULL;\
				if ( LIBERARLISTADATA_data != NULL )\
				{\
					g_free (LIBERARLISTADATA_data);\
					LIBERARLISTADATA_data = NULL;\
				}\
			}\
			else\
			{\
				(*LIBERARLISTADATA_local) = NULL;\
			}\
		}\
	}\
}
//
//clip//
//
#define MC_CALCULARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(sumacadena,checksum_ok)\
{\
	gint CALCULARCHECKSUM_n_modulo=0; \	
	CALCULARCHECKSUM_n_modulo=(sumacadena % 64); \
	if(CALCULARCHECKSUM_n_modulo==0) \
		CALCULARCHECKSUM_n_modulo=64; \
	CALCULARCHECKSUM_n_modulo=64-CALCULARCHECKSUM_n_modulo; \
	CALCULARCHECKSUM_n_modulo=CALCULARCHECKSUM_n_modulo+64; \
	if(CALCULARCHECKSUM_n_modulo==128) \
		CALCULARCHECKSUM_n_modulo=64; \
	checksum_ok=CALCULARCHECKSUM_n_modulo; \
}
//
#define MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(cadenaverificar,resultadochecksum)\
{\
	gint VERIFICARCHECKSUM_i=0; \
	gint VERIFICARCHECKSUM_n_generar=0; \	
	gint VERIFICARCHECKSUM_cuantos=0; \
	gchar *VERIFICARCHECKSUM_cadenam=NULL; \	
	gchar VERIFICARCHECKSUM_caracter_checksum[2]; \
	int VERIFICARCHECKSUM_valor_ascii=0; \
	int VERIFICARCHECKSUM_valor_ascii_checksum=0; \
	int VERIFICARCHECKSUM_suma_cadena=0; \
	int VERIFICARCHECKSUM_n_modulo=0; \
	resultadochecksum=-1; \
	if(cadenaverificar!=NULL) \
	{ \
		/*VERIFICARCHECKSUM_cadenam se libera en esta funcion*/\
		VERIFICARCHECKSUM_cadenam = g_malloc((sizeof(gchar)*strlen(cadenaverificar))+3);\
		strcpy(VERIFICARCHECKSUM_cadenam,(gchar *)cadenaverificar); \
		VERIFICARCHECKSUM_n_generar=0; \
		/**/ \
		VERIFICARCHECKSUM_cuantos=strlen(VERIFICARCHECKSUM_cadenam)-2; \
		/**/ \
		while( VERIFICARCHECKSUM_n_generar < VERIFICARCHECKSUM_cuantos ) \
		/**/ \
		{ \
			VERIFICARCHECKSUM_valor_ascii=VERIFICARCHECKSUM_cadenam[VERIFICARCHECKSUM_n_generar]; \
			VERIFICARCHECKSUM_suma_cadena=VERIFICARCHECKSUM_suma_cadena+VERIFICARCHECKSUM_valor_ascii; \
			VERIFICARCHECKSUM_n_generar++; \
		} \
		VERIFICARCHECKSUM_valor_ascii_checksum=VERIFICARCHECKSUM_cadenam[VERIFICARCHECKSUM_n_generar-1]; \
		VERIFICARCHECKSUM_suma_cadena=VERIFICARCHECKSUM_suma_cadena-VERIFICARCHECKSUM_valor_ascii_checksum; \
		VERIFICARCHECKSUM_n_modulo=0; \
		VERIFICARCHECKSUM_n_modulo=(VERIFICARCHECKSUM_suma_cadena % 64); \
		if(VERIFICARCHECKSUM_n_modulo==0) \
			VERIFICARCHECKSUM_n_modulo=64; \
		VERIFICARCHECKSUM_n_modulo=64-VERIFICARCHECKSUM_n_modulo; \
		VERIFICARCHECKSUM_n_modulo=VERIFICARCHECKSUM_n_modulo+64; \
		if(VERIFICARCHECKSUM_n_modulo==128) \
			VERIFICARCHECKSUM_n_modulo=64; \
		if(VERIFICARCHECKSUM_n_modulo==VERIFICARCHECKSUM_valor_ascii_checksum) \
			resultadochecksum=1; \	
	} \
	/*liberando VERIFICARCHECKSUM_cadenam*/\
	if(VERIFICARCHECKSUM_cadenam != NULL)\
	{\
		g_free(VERIFICARCHECKSUM_cadenam);\
		VERIFICARCHECKSUM_cadenam=NULL;\
	}\
}
////

//////////////funciones puerto/////////////
//
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
//
gint FEF_abrirpuertoserieclip_funcionesespeciales_libgsksoa (gint idpuerto,gint *descriptor)
{	
	gint fd;
	gchar puerto[16]={0};
	if (idpuerto >= 0)
	{				
		if (seriepatines_fdpuerto[idpuerto] == -1)
		{			
			sprintf(puerto,"/dev/ttyS%d",idpuerto);		
			fd = open(puerto, O_RDWR | O_NONBLOCK );
			if (fd < 0) 
			{  
				return -1;
			}
			seriepatines_fdpuerto[idpuerto] = fd;
			*descriptor = fd;
			return 1;		
		}
		else
		{
			*descriptor = seriepatines_fdpuerto[idpuerto];			
			return 0;
		}	
	}
	return -1;	
}
//
gint FEF_configurarpuertoserieclip1_funcionesespeciales_libgsksoa (gint descriptorpuerto, gint velocidad, gint paridad, gint bitstop, gint canonico, gint sincrono, gint bitdatos)
{
	struct termios conf_puerto_actual;
	gint fd=0;
	gint intentos=0;
	gint velocidad_puerto;

	gchar BConf[50],*BPuerto=NULL;

	switch(velocidad)
	{
		case 2400:velocidad_puerto=B2400;
		break;
		case 4800:velocidad_puerto=B4800;
		break;
		case 9600:velocidad_puerto=B9600;
		break;
		case 19200:velocidad_puerto=B19200;printf("\n-----clip------>velocidad:19200<-------------\n");
		break;
		case 38400:velocidad_puerto=B38400;
		break;
		case 57600:velocidad_puerto=B57600;
		break;
		case 115200:velocidad_puerto=B115200;
		break;
		case 230400:velocidad_puerto=B230400;
		break;
		default:
		return -1;
		break;
	}
	fd=descriptorpuerto;
				
	
	bzero(&conf_puerto_actual,sizeof(conf_puerto_actual));
	
	//nuevo
	conf_puerto_actual.c_lflag = ICANON; // cadena de configuracion canonica
	//nuevo
	
	// cadena para configuracion no canonica solo con la toma de parametros de final de caracteres.
	conf_puerto_actual.c_lflag &= ~( ECHO | ECHOE | ISIG );
	
	//nuevo
	// cadena para configuracion no canonica solo con la toma de parametros de final de caracteres.
	conf_puerto_actual.c_oflag &= ~OPOST;
	//
	
	conf_puerto_actual.c_cflag |= (CLOCAL | CREAD);
	//para paridad par
	//conf_puerto_actual.c_cflag &= ~PARENB;
	conf_puerto_actual.c_cflag |= PARENB;
	//CLIP a 7 bits - paridad par ----------
	conf_puerto_actual.c_cflag &= ~PARODD;					
	
	conf_puerto_actual.c_cflag &= ~CSTOPB;
	conf_puerto_actual.c_cflag &= ~CSIZE;
	//conf_puerto_actual.c_cflag |= CS8;
	conf_puerto_actual.c_cflag |= CS7;
	
	///////////////////////////////////////
	//conf_puerto_actual.c_oflag &= ONLCR;
	//conf_puerto_actual.c_oflag &= ONLRET;
	//conf_puerto_actual.c_oflag |= OPOST;					
	///////////////////////////////////////
	
	conf_puerto_actual.c_cc[VINTR]    = 0;     /* Ctrl-c */
	conf_puerto_actual.c_cc[VQUIT]    = 0;     /* Ctrl-\ */
	conf_puerto_actual.c_cc[VERASE]   = 0;     /* del */
	conf_puerto_actual.c_cc[VKILL]    = 0;     /* @ */
	//conf_puerto_actual.c_cc[VEOF]     = 0;     /* Ctrl-d */
	conf_puerto_actual.c_cc[VEOF]     = 4;     /* Ctrl-d */					
	conf_puerto_actual.c_cc[VTIME]    = 0;     /* temporizador entre caracter, no usado */
	//conf_puerto_actual.c_cc[VMIN]     = 0;     /* bloqu.lectura hasta llegada de caracter. 1 */
	conf_puerto_actual.c_cc[VMIN]     = 1;     /* bloqu.lectura hasta llegada de caracter. 1 */
	conf_puerto_actual.c_cc[VSWTC]    = 0;     /* '\0' */
	conf_puerto_actual.c_cc[VSTART]   = 0;     /* Ctrl-q */
	conf_puerto_actual.c_cc[VSTOP]    = 0;     /* Ctrl-s */
	conf_puerto_actual.c_cc[VSUSP]    = 0;     /* Ctrl-z */
	conf_puerto_actual.c_cc[VEOL]     = 0;     /* '\0' */
	conf_puerto_actual.c_cc[VREPRINT] = 0;     /* Ctrl-r */
	conf_puerto_actual.c_cc[VDISCARD] = 0;     /* Ctrl-u */
	conf_puerto_actual.c_cc[VWERASE]  = 0;     /* Ctrl-w */
	conf_puerto_actual.c_cc[VLNEXT]   = 0;     /* Ctrl-v */
	conf_puerto_actual.c_cc[VEOL2]    = 0;     /* '\0' */
	//------------------
	
	if(cfsetispeed(&conf_puerto_actual, velocidad_puerto) !=-1 && cfsetospeed(&conf_puerto_actual, velocidad_puerto)!=-1)
	{
		tcflush(fd, TCIFLUSH);
		if(tcsetattr(fd,TCSANOW,&conf_puerto_actual)==0)
		{
			return 1;
		}
		else
		{	
			return -1;			
		}
	}
	else
	{
		return -1;
	}
	return -1;			
}
//
gint FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa (gint idpuerto)
{
	gint fd,res=-1;	
	if (idpuerto >= 0)
	{
			fd=seriepatines_fdpuerto[idpuerto];
			res = close(fd);
			if (res == 0)
			{
				seriepatines_fdpuerto[idpuerto]=-1;
				return 0;
			}		
	}
	return -1;		
}
//

//
gint FEF_escribirpuertoserieclip_funcionesespeciales_libgsksoa(gint descriptorpuerto, gchar *tramaenviar, gint tamtrama)
{
	gint i=0;
	if (descriptorpuerto >= 0)
	{
		tcflush(descriptorpuerto,TCIOFLUSH);
		//g_print("\nESCRIBECLIP=%s\n",tramaenviar);
		if(write ( descriptorpuerto, tramaenviar, tamtrama ) == tamtrama )
		{
			return 1;
		}
		else
		{
			return -1;
		}
	}
	return -1;
}
gchar *FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(gint descriptorpuerto, gint tiemposec, gint tiempousec, gint tiempousleep, gint tamtrama)
{
	gchar *tramaleida=NULL;
	gchar *tramacambiar=NULL;
	gchar *trama = NULL;
	fd_set fic;
	gint contadorlecturas=0;
	gint tamaleida=0;
	gchar lf[2]={10,0};
	struct timeval tiempo_espera;
		
	if ( descriptorpuerto >= 0	)
	{
		//while (contadorlecturas < 2)
		while (contadorlecturas < 5)
		{
			tramaleida = g_malloc(sizeof(gchar)*tamtrama);
			bzero(tramaleida,tamtrama);
			FD_ZERO(&fic);
			FD_SET(descriptorpuerto, &fic);
			tiempo_espera.tv_sec = tiemposec;
			tiempo_espera.tv_usec = tiempousec;
			
			if(select((descriptorpuerto+1), &fic, NULL, NULL, &tiempo_espera))
			{
				usleep(tiempousleep);
				if(read(descriptorpuerto, tramaleida, tamtrama)!=-1)
				{
					///g_print("\nLEIDOCLIP\n");					
					tamaleida=strlen(tramaleida);
					tramacambiar=trama;					
					if (trama != NULL)
						trama=g_strconcat(trama,tramaleida,NULL);
					else
						trama=g_strconcat(tramaleida,NULL);
					
					/*liberando tramacambiar*/
					if (tramacambiar != NULL)					
					{
						g_free(tramacambiar);
						tramacambiar=NULL;
					}
					
					if(tamaleida > 0)
					{
						if(tramaleida[tamaleida-1]==10)
						{
							contadorlecturas = 0;	
							/*liberando tramaleida*/
							if (tramaleida != NULL)					
							{
								g_free(tramaleida);
								tramaleida=NULL;
							}
							break;
						}
					}
					/*liberando tramaleida*/
					if (tramaleida != NULL)					
					{
						g_free(tramaleida);
						tramaleida=NULL;
					}
				}
				else//wd25012009
				{
					/*liberando tramaleida*/
					if (tramaleida != NULL)					
					{
						g_free(tramaleida);
						tramaleida=NULL;
					}
				}
			}
			else			
			{
				/*liberando tramaleida*/
				if (tramaleida != NULL)					
				{
					g_free(tramaleida);
					tramaleida=NULL;
				}
			}
			contadorlecturas ++;
		}
		
		//if (contadorlecturas == 2)
		if (contadorlecturas == 5)
		{
			//printf("\nTiempo del select agotado clip\n");
			/*liberando trama*/
			if (trama != NULL)					
			{
				g_free(trama);
				trama=NULL;
			}
			return NULL;	
		}
		
		return trama;	
	}
	else
	{
		return NULL;	
	}
	return NULL;
}
//


//
gint FBFK_sincronizacion_funcionesespeciales_libgsksoa(gint fdpuerto)
{
	//NUEVO//
	gchar *tramavuelta_a = NULL;	//acceso
	gint respuesta=-1;
	gint ncadena=0;
	int checksum_ok=0;
	int valorascii=0;
	int sumacadena=0;
	gchar tramaida_a[7]={0};
	gint error_acceso=-1;

	//cadena activacion//
	tramaida_a[0] = 27;	//Esc
	tramaida_a[1] = 87;	//W : protocolo TRSII
	tramaida_a[2] = 48; 	//0
	tramaida_a[3] = 54;	//6//06=activar/01=desactivar
	//tramaida_a[4] = 9;	//ht	
	tramaida_a[4] = 32;	//ht
	//
	tramaida_a[5] = 13;
	
	g_printf("\nSINCRONIZACION---ENVIO->[%s]\n",tramaida_a);	
	//enviar activacion protocolo TRSII/		
	respuesta = FEF_escribirpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tramaida_a,6);//7);
	error_acceso=respuesta;
	
	if(respuesta==1)
		g_printf("\nSINCRONIZACION-ENVIADA--ok....\n");	
	sleep(5);
	
	/*
	-1 		error al escribir en el puerto
	otro 	envio ok
	*/
	return error_acceso;
}
//
gint FBFK_claveacceso_funcionesespeciales_libgsksoa(gchar identidadacceso[3], gchar claveaccesos[5], gint eco, gint tiempolectura, gint tiempotrama, gint fdpuerto)
{
	gint respuesta=-1;
	gint resultadochecksum=-1;
	gint ncadena=0;
	int checksum_ok=0;
	int valorascii=0;
	int sumacadena=0;
	gboolean hay_ok=FALSE;
	//---de 16 -> 17---//
	gchar tramaida_a[17]={0}, *tramavuelta_a = NULL;	//acceso
	//<!17012008-comando clip(identidad) 1 ó 2 caracteres-60¡>//	
	gint posiciontrama=0;
	//
	
	//<!25012008-registrar errores eco-74¡>//
	gchar *tramavuelta_a_sineco = NULL;
	gchar *cadenarecibida_sineco=NULL;
	gint posicion=0, posicionsalida=0;
	gint finalrespuesta =0, error_acceso=-1;
	//
	gint tiempolectura2=0;
	
	//<!17012008-comando clip(identidad) 1 ó 2 caracteres-60¡>//	
	posiciontrama=0;
	if(atoi(identidadacceso)<10)
	{
		tramaida_a[posiciontrama] = identidadacceso[0];	
		posiciontrama++;
	}
	else
	{
		tramaida_a[posiciontrama] = identidadacceso[0];	
		posiciontrama++;					
		tramaida_a[posiciontrama] = identidadacceso[1];	
		posiciontrama++;					
	}
	//
	tramaida_a[posiciontrama] = 9;	
	posiciontrama++;						
	tramaida_a[posiciontrama] = 65;	//ACCES
	posiciontrama++;						
	tramaida_a[posiciontrama] = 67;
	posiciontrama++;						
	tramaida_a[posiciontrama] = 67;
	posiciontrama++;						
	tramaida_a[posiciontrama] = 69;			
	posiciontrama++;						
	tramaida_a[posiciontrama] = 83;			
	posiciontrama++;						
	tramaida_a[posiciontrama] = 9;
	posiciontrama++;						
	tramaida_a[posiciontrama] = claveaccesos[0];			
	posiciontrama++;						
	tramaida_a[posiciontrama] = claveaccesos[1];	
	posiciontrama++;						
	tramaida_a[posiciontrama] = claveaccesos[2];			
	posiciontrama++;						
	tramaida_a[posiciontrama] = claveaccesos[3];			
	posiciontrama++;						
	tramaida_a[posiciontrama] = 9;
	posiciontrama++;						
		
	while(ncadena<posiciontrama)
	{
		valorascii=tramaida_a[ncadena];
		sumacadena=sumacadena+valorascii;
		ncadena++;
	}
	MC_CALCULARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(sumacadena,checksum_ok);
	tramaida_a[posiciontrama] = checksum_ok;	
	posiciontrama++;						
	tramaida_a[posiciontrama] = 13;

	//NUEVO//
	FBFK_sincronizacion_funcionesespeciales_libgsksoa(fdpuerto);
	/////////		
	
	respuesta = FEF_escribirpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tramaida_a,16);
	if (respuesta == -1)
	{
		error_acceso=-1;
	}
	else
	{
		if ( tiempolectura >= 1000000 )						
		{
			tiempolectura2 = tiempolectura / 1000000;
			tramavuelta_a = FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura2,0,tiempotrama,512);
		}
		else
		{
			tramavuelta_a = FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,512);	
		}		
		
		g_printf("\nACCESO---RESPUESTA->[%s]\n",tramavuelta_a);	
		
		if (tramavuelta_a == NULL)
		{
			error_acceso=-2;
		}				
		else
		{	
			//<!25012008-registrar errores eco-74¡>//	
			if(eco==1)
			{
				if(strstr(tramavuelta_a,tramaida_a) == NULL)	//no tiene eco//
				{
					error_acceso=-3;
				}
				else
				{
					//cadenarecibida_sineco se libera en esta funcion//				
					cadenarecibida_sineco = g_malloc((sizeof(gchar)*strlen(tramavuelta_a))+6);									
					//<!74-registro errores sin eco-24012008¡>//
					//<inicio de la respuesta trama vuelta ida+1=comienzo respuesta>//
					posicion=posiciontrama+1;	
					posicionsalida=0;
					finalrespuesta = (strlen(tramavuelta_a)-posicion);
					while( posicionsalida <  finalrespuesta)
					{
						cadenarecibida_sineco[posicionsalida]=tramavuelta_a[posicion];
						posicionsalida++;
						posicion++;
					}
					cadenarecibida_sineco[posicionsalida]=NULL;	
					//tramavuelta_a_sineco se libera en esta funcion//
					tramavuelta_a_sineco=g_strconcat(cadenarecibida_sineco,NULL);		
					//
					
					//<tratar retorno acceso//verificar checksum>//
					MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(tramavuelta_a_sineco,resultadochecksum);
					if (resultadochecksum!=-1)
					{						
						if( (strstr(tramavuelta_a_sineco,identidadacceso)!=NULL) && (strstr(tramavuelta_a_sineco,"STATUT")!=NULL) && ( (strstr(tramavuelta_a_sineco,"OK")!=NULL) || (strstr(tramavuelta_a_sineco,"Ok")!=NULL) ) )
						{							
							hay_ok=TRUE;							
							error_acceso = 1;
						}
					}
					else
					{
						error_acceso=-5;
					}
				}
			}
			else
			{
				if(strstr(tramavuelta_a,tramaida_a) != NULL)
				{
					error_acceso=-4;
				}
				else
				{	
					MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(tramavuelta_a,resultadochecksum);
					if (resultadochecksum!=-1)
					{
						if( (strstr(tramavuelta_a,identidadacceso)!=NULL) && (strstr(tramavuelta_a,"STATUT")!=NULL) && ( (strstr(tramavuelta_a,"OK")!=NULL) || (strstr(tramavuelta_a,"Ok")!=NULL) ) )
						{
							hay_ok=TRUE;
							error_acceso=1;
						}
					}
					else
					{
						error_acceso=-5;
					}
				}
			}			
			//
		}	
	}
	//<!25012008-registrar errores eco-74¡>//		
	//liberando tramavuelta_a_sineco//
	if(tramavuelta_a_sineco != NULL)
	{
		g_free(tramavuelta_a_sineco);
		tramavuelta_a_sineco = NULL;
	}	
	//liberando cadenarecibida_sineco//
	if(cadenarecibida_sineco != NULL)
	{
		g_free(cadenarecibida_sineco);
		cadenarecibida_sineco = NULL;
	}	
	//		
	//liberando tramavuelta_a//
	if(tramavuelta_a != NULL)
	{
		g_free(tramavuelta_a);
		tramavuelta_a = NULL;
	}	
	
	/*
	-1 al escribir en el puerto
	-2 tramavuelta NULL
	-3 definido eco pero no llega
	-4 definido sin eco pero llega el eco
	-5 error CHECKSUM
	1 acceso concedido
	*/
	return error_acceso;
}
///
//sd
gint FBFK_tramaclipsd_funcionesespeciales_libgsksoa(gchar identidadacceso[3], gint tiempolectura, gint tiempotrama, gint fdpuerto, gint eco, gint recurso, gchar *valor)
{
	gint respuesta=-1, estado=-1;
	gchar tramaida_c[30]={0}, *tramavuelta_c = NULL;
	gint ncadena=0;
	int checksum_ok=0;
	int valorascii=0;
	int sumacadena=0;
	gint resultadochecksum=-1;
	gboolean actualizar_pcb=FALSE;	
	gchar comcomando[5]={0};

	gchar valorleido[15]={0};
	gint posicion=0;
	gint posicion1=-1;
	gint contadordatos=0;
	gint posicionsalida=0;

	gchar *cadenarecibida=NULL;
	gchar *cadenasalida=NULL;
	
	gboolean hay_ht1=FALSE;
	gboolean hay_ht2=FALSE;
	gint tamtramaida=0;
	gint posiciontrama=0;
	gint posiciondh=0;
	gint cuantoslleno=0;
	gint error_trama=0;
	//registrar errores eco
	gchar *tramavuelta_c_sineco = NULL;
	gchar *cadenarecibida_sineco=NULL;
	gint finalrespuesta =-1,iddato=-1;
	gchar borna[2]={0};
	gchar **datos=NULL;
	gchar separador[2]={0};
	gchar dato[20]={0};
	//
	gint tiempolectura2=0;
	gchar recursotrama[4]={0};	
	gchar valoraponer[15]={0};

	g_printf("\nA ENVIAR TRAMA SD CLIP----->[%d][%d][%d][%d]-[%d]-[%d]-[%d]-[%d]-[%d]-[%s]\n",identidadacceso[0],identidadacceso[1],identidadacceso[2],identidadacceso[3],tiempolectura,tiempotrama,fdpuerto,eco,recurso,valor);	

	//comando clip(identidad) 1 ó 2 caracteres/	
	comcomando[0]=34;	
	posiciontrama=1;
	if(atoi(identidadacceso)<10)
	{
		comcomando[posiciontrama]=identidadacceso[0];
		posiciontrama++;
	}
	else
	{
		comcomando[posiciontrama]=identidadacceso[0];
		posiciontrama++;					
		comcomando[posiciontrama]=identidadacceso[1];
		posiciontrama++;					
	}
	comcomando[posiciontrama]=34;
	posiciontrama++;					
	comcomando[posiciontrama]=NULL;//0

	//g_printf("\nA ENVIAR TRAMA SD CLIP--comcomando--->[%d][%d][%d][%d]\n",comcomando[0],comcomando[1],comcomando[2],comcomando[3]);	
	
	//recurso//
	sprintf(recursotrama,"%d",recurso);
	recursotrama[3]=0;	//0				
	if(recurso<100)
		recursotrama[2]=0;
	if(recurso<10)
		recursotrama[1]=0;
	
	//clipsd//////////////////////////////////////////////////////////
	//comando clip(identidad) 1 ó 2 caracteres	
	posiciontrama=0;
	if(atoi(identidadacceso)<10)
	{
		tramaida_c[posiciontrama]=identidadacceso[0];
		posiciontrama++;
	}
	else
	{
		tramaida_c[posiciontrama]=identidadacceso[0];
		posiciontrama++;					
		tramaida_c[posiciontrama]=identidadacceso[1];
		posiciontrama++;					
	}
	
	tramaida_c[posiciontrama] = 9;
	posiciontrama++;					
	tramaida_c[posiciontrama] = 65;//A
	posiciontrama++;					
	tramaida_c[posiciontrama] = 67;//C
	posiciontrama++;					
	tramaida_c[posiciontrama] = 84;//T
	posiciontrama++;					
	tramaida_c[posiciontrama] = 73;//I			
	posiciontrama++;					
	tramaida_c[posiciontrama] = 70;//F		
	posiciontrama++;					
	tramaida_c[posiciontrama] = 33;//!			
	posiciontrama++;					
	tramaida_c[posiciontrama] = 9;			
	posiciontrama++;					
	tramaida_c[posiciontrama] = 66;//B	
	posiciontrama++;					
	tramaida_c[posiciontrama] = 82;//R			
	//posiciontrama++;					
	//
	//recurso//
	posiciondh=0;	
	while(posiciondh < 3)
	{
		if( (recursotrama[posiciondh] >= 48) && (recursotrama[posiciondh] != 0) )
		{
			posiciontrama++;
			tramaida_c[posiciontrama]=recursotrama[posiciondh];						
		}
		posiciondh++;
	}
	posiciontrama++;					
	//
	tramaida_c[posiciontrama] = 9;			
	posiciontrama++;					
	//	
	//A-I(1-0)//
	if(atoi(valor)==1)
	{
		tramaida_c[posiciontrama] = 65;			
	}
	else
	{
		if(atoi(valor)==0)
			tramaida_c[posiciontrama] = 73;		//si no es 1-0:nada
	}
	posiciontrama++;					
	//
	tramaida_c[posiciontrama] = 9;
	//posiciontrama++;		

	ncadena=0;
	sumacadena=0;
	checksum_ok=0;
	while(ncadena<posiciontrama+1)
	{
		valorascii=tramaida_c[ncadena];
		sumacadena=sumacadena+valorascii;
		ncadena++;
	}
	MC_CALCULARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(sumacadena,checksum_ok);	
	posiciontrama++;			
	tramaida_c[posiciontrama] = checksum_ok;			
	posiciontrama++;			
	tramaida_c[posiciontrama] = 13;
	/////////////////////////////////////////////////////////////////
	//g_printf("\nENVIAR TRAMA SD CLIP--tramaida_c--->[%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d][%d]\n",tramaida_c[0],tramaida_c[1],tramaida_c[2],tramaida_c[3],tramaida_c[4],tramaida_c[5],tramaida_c[6],tramaida_c[7],tramaida_c[8],tramaida_c[9],tramaida_c[10],tramaida_c[11],tramaida_c[12],tramaida_c[13],tramaida_c[14],tramaida_c[15],tramaida_c[16],tramaida_c[17],tramaida_c[18],tramaida_c[19]);	

	//<se utiliza para rectificar la trama cuando tiene eco>//
	if (eco == 1)
		tamtramaida = posiciontrama+1;
	else
		tamtramaida = 0;	
	//
	respuesta = FEF_escribirpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tramaida_c,posiciontrama+1);	
	if (respuesta != -1)
	{
		if ( tiempolectura >= 1000000 )						
		{
			tiempolectura2 = tiempolectura / 1000000;
			//tramavuelta_c se libera en esta FUNCION//
			tramavuelta_c = FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura2,0,tiempotrama,512);
		}
		else
		{
			//tramavuelta_c se libera en esta FUNCION//
			tramavuelta_c = FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,512);	
		}

		if (tramavuelta_c != NULL)
		{
			//g_printf("\nENVIAR TRAMA SD CLIP--tramavuelta_c--->[%s]\n",tramavuelta_c);	
			//<!25012008-registrar errores eco-74¡>//	
			actualizar_pcb=TRUE;
			if(eco==1)
			{
				if(strstr(tramavuelta_c,tramaida_c) == NULL)
				{
					actualizar_pcb=FALSE;
					error_trama=-4;	
				}
				else
				{					
					//cadenarecibida_sineco se libera en esta funcion//				
					cadenarecibida_sineco = g_malloc((sizeof(gchar)*strlen(tramavuelta_c))+6);
					//<inicio de la respuesta trama vuelta ida+1=comienzo respuesta>//					
					posicion=tamtramaida;
					posicionsalida=0;
					finalrespuesta = (strlen(tramavuelta_c)-tamtramaida);
					while( posicionsalida < finalrespuesta )
					{
						cadenarecibida_sineco[posicionsalida]=tramavuelta_c[posicion];
						posicionsalida++;
						posicion++;
					}
					cadenarecibida_sineco[posicionsalida]=NULL;//0
					//tramavuelta_c_sineco se libera en esta funcion//
					tramavuelta_c_sineco=g_strconcat(cadenarecibida_sineco,NULL);
					//<tratar retorno trama pregunta//verificar checksum>//
					MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(tramavuelta_c_sineco,resultadochecksum);
					if(resultadochecksum != -1)
					{
						if(strstr(tramavuelta_c_sineco,comcomando) == NULL)
						{
							actualizar_pcb=FALSE;
							error_trama=-3;
						}
					}
					else
					{						
						actualizar_pcb=FALSE;
						error_trama=-3;
					}					
					if(actualizar_pcb == TRUE)									
					{
						//cadenarecibida se libera en esta funcion//				
						cadenarecibida = g_malloc((sizeof(gchar)*strlen(tramavuelta_c_sineco))+6);
						strcpy(cadenarecibida,tramavuelta_c_sineco);						
						separador[0]=9;
						separador[1]=NULL;
						if( (strstr(cadenarecibida,"STATUT")!=NULL) && (strstr(cadenarecibida,"000")!=NULL) && ( (strstr(cadenarecibida,"OK")!=NULL) || (strstr(cadenarecibida,"Ok")!=NULL) ) )
						{
							g_printf("\nENVIAR TRAMA SD CLIP--OK\n");	
							error_trama=1;	//TODO OK
						}
						else
						{					
							error_trama=-5;
						}						
					}					
				}
			}
			else//sin eco//
			{	
				if(strstr(tramavuelta_c,tramaida_c) != NULL)
				{
					actualizar_pcb=FALSE;					
					error_trama=-4;
				}
				else
				{
					//<tratar respuestacomando//verificar checksum>//
					MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(tramavuelta_c,resultadochecksum);
					if(resultadochecksum != -1)
					{
						if(strstr(tramavuelta_c,comcomando) == NULL)
						{
							actualizar_pcb=FALSE;
							error_trama=-3;
						}
					}
					else
					{						
						actualizar_pcb=FALSE;
						error_trama=-3;
					}										
					tamtramaida = 0;					
					if(actualizar_pcb == TRUE)									
					{
						//cadenarecibida se libera en esta funcion//				
						cadenarecibida = g_malloc((sizeof(gchar)*strlen(tramavuelta_c))+6);
						strcpy(cadenarecibida,tramavuelta_c);				
						separador[0]=9;
						separador[1]=NULL;
						//g_printf("\nENVIAR TRAMA SD CLIP--STATUT ?....\n");						
						if( (strstr(cadenarecibida,"STATUT")!=NULL) && (strstr(cadenarecibida,"000")!=NULL) && ( (strstr(cadenarecibida,"OK")!=NULL) || (strstr(cadenarecibida,"Ok")!=NULL) ) )
						{
							g_printf("\nENVIAR TRAMA SD CLIP--STATUT OK\n");						
							error_trama=1;	//TODO OK
						}
						else
						{											
							error_trama=-5;
						}					
					}//ok					
					//			
				}//ok
				//
			}//ok			
			//
		}//ok
		//<!21012008-error al preguntar por bornas clip 0-254-70¡>//						
		else
		{
			g_printf("\nENVIAR TRAMA SD CLIP--tramavuelta_c--->NULL\n");	
			error_trama=-2;		
		}
		//	
	}//ok
	//<!21012008-error al preguntar por bornas clip 0-254-70¡>//
	else
	{
		error_trama=-1;		
	}
	//	
	
	//liberando cadenarecibida_sineco//	
	if(cadenarecibida_sineco!=NULL)
	{
		g_free(cadenarecibida_sineco);
		cadenarecibida_sineco=NULL;
	}
	//liberando tramavuelta_c_sineco//	
	if(tramavuelta_c_sineco	!=NULL)
	{
		g_free(tramavuelta_c_sineco	);
		tramavuelta_c_sineco=NULL;
	}
	//liberando datos//
	if(datos !=NULL)
	{
		g_strfreev(datos);
		datos=NULL;
	}
	//liberando tramavuelta_c//
	if(tramavuelta_c!=NULL)
	{
		g_free(tramavuelta_c);
		tramavuelta_c=NULL;
	}
	//liberando cadenarecibida//	
	if(cadenarecibida!=NULL)
	{
		g_free(cadenarecibida);
		cadenarecibida=NULL;
	}	
	//liberando cadenasalida//	
	if(cadenasalida!=NULL)
	{
		g_free(cadenasalida);
		cadenasalida=NULL;
	}	
	
	//<!21012008-error al preguntar por bornas clip 0-254-70¡>//			
	return error_trama;	//-1 error a log de escribir 
						//-2 error a log de lectura null
						//-3 error a log de error checksum 
						//-4 error en eco/sin eco, no coincide opcion con trama recibida.
						//-5 error trama no OK
	//		
}
//
//edea
gint FBFK_tramaclip2_funcionesespeciales_libgsksoa(gchar identidadacceso[3], gint tiempolectura, gint tiempotrama, gint fdpuerto, gint eco, GList **valorescapsula, gchar desde[3], gchar cuantos[3])
{
	gint respuesta=-1, estado=-1;
	gchar tramaida_c[20]={0}, *tramavuelta_c = NULL;
	gint ncadena=0;
	int checksum_ok=0;
	int valorascii=0;
	int sumacadena=0;
	gint resultadochecksum=-1;
	gboolean actualizar_pcb=FALSE;	
	gchar comcomando[5]={0};

	gchar valorleido[15]={0};
	gint posicion=0;
	gint posicion1=-1;
	gint contadordatos=0;
	gint posicionsalida=0;
	
	gchar *cadenarecibida=NULL;
	gchar *cadenasalida=NULL;
	
	gboolean hay_ht1=FALSE;
	gboolean hay_ht2=FALSE;
	gint tamtramaida=0;
	gint posiciontrama=0;
	gint posiciondh=0;
	gint cuantoslleno=0;
	gint error_trama=0;
	//registrar errores eco
	gchar *tramavuelta_c_sineco = NULL;
	gchar *cadenarecibida_sineco=NULL;
	gint finalrespuesta =-1,iddato=-1;
	gchar borna[2]={0};
	gchar **datos=NULL;
	gchar *totaldatos=NULL,*datosaux=NULL;
	gchar separador[2]={0};
	gchar dato[20]={0},**toked=NULL,*valorborna=NULL;
	//
	gint tiempolectura2=0;
	gint cuantoserror=0;
	
	//cadenasalida se libera en esta funcion//
	cadenasalida = g_malloc(sizeof(gchar)*500);	
	memset(cadenasalida,NULL,500);
	cuantoslleno=atoi(cuantos)*2;
	
	//MONTAR TRAMA IDA///////////////////////////////////
	//comando clip(identidad) 1 ó 2 caracteres/	
	comcomando[0]=34;	
	posiciontrama=1;
	if(atoi(identidadacceso)<10)
	{
		comcomando[posiciontrama]=identidadacceso[0];
		posiciontrama++;
	}
	else
	{
		comcomando[posiciontrama]=identidadacceso[0];
		posiciontrama++;					
		comcomando[posiciontrama]=identidadacceso[1];
		posiciontrama++;					
	}
	comcomando[posiciontrama]=34;
	posiciontrama++;					
	comcomando[posiciontrama]=NULL;//0
	
	//comando clip(identidad) 1 ó 2 caracteres	
	posiciontrama=0;
	if(atoi(identidadacceso)<10)
	{
		tramaida_c[posiciontrama]=identidadacceso[0];
		posiciontrama++;
	}
	else
	{
		tramaida_c[posiciontrama]=identidadacceso[0];
		posiciontrama++;					
		tramaida_c[posiciontrama]=identidadacceso[1];
		posiciontrama++;					
	}
	
	tramaida_c[posiciontrama] = 9;
	posiciontrama++;					
	tramaida_c[posiciontrama] = 86;//V
	posiciontrama++;					
	tramaida_c[posiciontrama] = 65;//A
	posiciontrama++;					
	tramaida_c[posiciontrama] = 82;//R
	posiciontrama++;					
	tramaida_c[posiciontrama] = 63;//?			
	posiciontrama++;					
	tramaida_c[posiciontrama] = 9;			
	posiciontrama++;					
	tramaida_c[posiciontrama] = 70;//F			
	posiciontrama++;					
	tramaida_c[posiciontrama] = 82;//R
	//
	
	//<Desde borna inicial>//
	posiciondh=0;	
	while(desde[posiciondh] != NULL)
	{
		if( (desde[posiciondh] >= 48) && (desde[posiciondh] != 0) )
		{
			borna[0]=desde[posiciondh];
			borna[1]=NULL;
			if( atoi(borna) >= 0 )
			{
				posiciontrama++;
				tramaida_c[posiciontrama]=desde[posiciondh];
			}
			posiciondh++;
		}
	}
	//

	posiciontrama++;	
	tramaida_c[posiciontrama] = 9;			
	
	//<hasta que borna cuantos>//
	posiciondh=0;	
	//while(posiciondh < 3)COMENTAR//
	while(cuantos[posiciondh] != NULL)
	{
		//if( (cuantos[posiciondh] >= 48) && (cuantos[posiciondh] != 0) )//
		borna[0]=cuantos[posiciondh];
		borna[1]=NULL;
		if( atoi(borna) >= 0 )
		{
			posiciontrama++;
			tramaida_c[posiciontrama]=cuantos[posiciondh];						
		}
		posiciondh++;
	}	
	//
	posiciontrama++;		
	tramaida_c[posiciontrama] = 9;
	ncadena=0;
	sumacadena=0;
	checksum_ok=0;
	while(ncadena<posiciontrama+1)
	{
		valorascii=tramaida_c[ncadena];
		sumacadena=sumacadena+valorascii;
		ncadena++;
	}
	MC_CALCULARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(sumacadena,checksum_ok);	
	posiciontrama++;			
	tramaida_c[posiciontrama] = checksum_ok;			
	posiciontrama++;			
	tramaida_c[posiciontrama] = 13;
	
	//<se utiliza para rectificar la trama cuando tiene eco>/
	if (eco == 1)
		tamtramaida = posiciontrama+1;
	else
		tamtramaida = 0;	
	//
	g_printf("\nCLIP2----trama IDA: 0[%d]1[%d]2[%d]3[%d]4[%d]5[%d]6[%d]7[%d]8[%d]9[%d]10[%d]11[%d]12[%d]13[%d]14[%d]\n",tramaida_c[0],tramaida_c[1],
		tramaida_c[2],tramaida_c[3],tramaida_c[4],tramaida_c[5],tramaida_c[6],tramaida_c[7],tramaida_c[8],
		tramaida_c[9],tramaida_c[10],tramaida_c[11],tramaida_c[12],tramaida_c[13],tramaida_c[14]);
	//////////////////////////////////////////////////////////

	//ESCRIBIR TRAMA//		
	respuesta = FEF_escribirpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tramaida_c,posiciontrama+1);
	if (respuesta != -1)
	{
		//LEER TRAMAVUELTA//
		if ( tiempolectura >= 1000000 )						
		{
			tiempolectura2 = tiempolectura / 1000000;
			//tramavuelta_c se libera en esta FUNCION//
			tramavuelta_c = FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,tiempolectura2,0,tiempotrama,512);
		}
		else
		{
			//tramavuelta_c se libera en esta FUNCION/
			tramavuelta_c = FEF_leerpuertoserieclip_funcionesespeciales_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,512);	
		}
		
		//TRATAR TRAMAVUELTA//////
		if (tramavuelta_c != NULL)
		{
			g_printf("\nCLIP2----HAY TRAMAVUELTA--->(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)(%d)\n",
			tramavuelta_c[0],tramavuelta_c[1],tramavuelta_c[2],tramavuelta_c[3],tramavuelta_c[4],
			tramavuelta_c[5],tramavuelta_c[6],tramavuelta_c[7],tramavuelta_c[8],tramavuelta_c[9],
			tramavuelta_c[10],tramavuelta_c[11],tramavuelta_c[12],tramavuelta_c[13],tramavuelta_c[14]);
			//<!25012008-registrar errores eco-74¡>//	
			actualizar_pcb=TRUE;
			if(eco==1)
			{
				if(strstr(tramavuelta_c,tramaida_c) == NULL)
				{
					actualizar_pcb=FALSE;
					error_trama=-4;	
				}
				else
				{					
					//cadenarecibida_sineco se libera en esta funcion//				
					cadenarecibida_sineco = g_malloc((sizeof(gchar)*strlen(tramavuelta_c))+6);
					//<!74-registro errores sin eco-24012008¡>//
					//<inicio de la respuesta trama vuelta ida+1=comienzo respuesta>//					
					posicion=tamtramaida;
					posicionsalida=0;
					finalrespuesta = (strlen(tramavuelta_c)-tamtramaida);
					while( posicionsalida < finalrespuesta )
					{
						cadenarecibida_sineco[posicionsalida]=tramavuelta_c[posicion];
						posicionsalida++;
						posicion++;
					}
					cadenarecibida_sineco[posicionsalida]=NULL;//0
					//tramavuelta_c_sineco se libera en esta funcion//
					tramavuelta_c_sineco=g_strconcat(cadenarecibida_sineco,NULL);
					//<tratar retorno trama pregunta//verificar checksum>//
					MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(tramavuelta_c_sineco,resultadochecksum);
					if(resultadochecksum != -1)
					{
						if(strstr(tramavuelta_c_sineco,comcomando) == NULL)
						{
							actualizar_pcb=FALSE;
							error_trama=-3;
						}
					}
					else
					{						
						actualizar_pcb=FALSE;
						error_trama=-3;
					}					
					if(actualizar_pcb == TRUE)									
					{
						//cadenarecibida se libera en esta funcion//			
						cadenarecibida = g_malloc((sizeof(gchar)*strlen(tramavuelta_c_sineco))+6);
						strcpy(cadenarecibida,tramavuelta_c_sineco);						
						separador[0]=9;
						separador[1]=NULL;
						if( (strstr(cadenarecibida,"VAR=")!=NULL) && (strstr(cadenarecibida,"Fr")!=NULL) )
						{
							//datos se libera en esta funcion//
							datos = g_strsplit(cadenarecibida,separador,atoi(cuantos)+4);
							error_trama=1;
						}
						else
						{					
							error_trama=-5;
						}						
					}					
				}
			}
			else	//sin eco//
			{	
				if(strstr(tramavuelta_c,tramaida_c) != NULL)
				{
					actualizar_pcb=FALSE;
					error_trama=-4;
					g_printf("\nCLIP2---------ERROR -4\n");
				}
				else
				{
					//<tratar respuestacomando//verificar checksum>//
					MC_VERIFICARCHECKSUM_DRIVERSCLIPSERIE_LIBSOAV1(tramavuelta_c,resultadochecksum);
					if(resultadochecksum != -1)
					{
						if(strstr(tramavuelta_c,comcomando) == NULL)
						{
							actualizar_pcb=FALSE;
							error_trama=-3;
							g_printf("\nCLIP2---------ERROR -3\n");
						}
					}
					else
					{						
						actualizar_pcb=FALSE;
						g_printf("\nCLIP2---------ERROR -3 2\n");
						error_trama=-3;
					}		
					tamtramaida = 0;
					if(actualizar_pcb == TRUE)
					{
						//cadenarecibida se libera en esta funcion//			
						cadenarecibida = g_malloc((sizeof(gchar)*strlen(tramavuelta_c))+6);
						strcpy(cadenarecibida,tramavuelta_c);				
						separador[0]=9;
						separador[1]=NULL;
						if( (strstr(cadenarecibida,"VAR=")!=NULL) && (strstr(cadenarecibida,"Fr")!=NULL) )
						{
							//datos se libera en esta funcion//
							datos = g_strsplit(cadenarecibida,separador,atoi(cuantos)+4);
							error_trama=1;
						}
						else
						{											
							error_trama=-5;
							g_printf("\nCLIP2---------ERROR -5\n");
						}					
					}//ok					
					//		
				}//ok
				//
			}//ok			
			//
		}//ok
		//
		else
		{
			g_printf("\nCLIP2---------NO HAY TRAMAVUELTA...ERROR -2\n");
			error_trama=-2;		
		}
		//	
	}//ok
	else
	{
		g_printf("\nCLIP2---------NO HAY TRAMAVUELTA...ERROR EN RESPUESTA---ERROR -1\n");
		error_trama=-1;		
	}
	//	
	
	//<Se valida que lleguen el numero de datos corespondiente>//	
	if (error_trama == 1)
	{
		iddato=0;		
		while (datos[iddato]!=NULL)
		{
			contadordatos++;
			iddato++;
		}	
		if(contadordatos != atoi(cuantos)+4)
		{
			error_trama = -6;
			g_printf("\nCLIP2---------ERROR -6\n");
		}
		//
	}

	//////////////////////////////////////////////////////////////////////////////
	///IMPORTANTE///
	///CAMBIAR SEGUN cuantoslleno ->E#//NOFIJO 25-30//...
	///CAMBIAR variable(*estadocacharrob2) por lista '*valorescapsula'//
	///con valores capsula---no valor ='E'---Si todo error= todos a 'E'(cuantos)//
	//////////////////////////////////////////////////////////////////////////////
	if (error_trama != 1)	//todos error E//
	{
		g_printf("\nCLIP2---------TODOS ERROR POR errortrama...\n");
		cuantoserror=0;
		while(cuantoserror < cuantoslleno)
		{
			*valorescapsula = g_list_append(*valorescapsula,g_strconcat("E",NULL));
			cuantoserror++;
		}
		error_trama=-7;		
		g_printf("\nCLIP2---------ERROR -7\n");
	}
	else
	{	
		error_trama=1;
		g_printf("\nCLIP2---------hay trama...\n");
		iddato=3;		
		while (datos[iddato]!=NULL)
		{	
			valorborna=g_strconcat(datos[iddato],NULL);	//valor o --//
			if (strstr(valorborna,"--")==NULL)
			{
				*valorescapsula = g_list_append(*valorescapsula,g_strconcat(valorborna,NULL));
			}
			else
			{
				g_printf("\nCLIP2---------hay trama...valor --  :  E\n");
				*valorescapsula = g_list_append(*valorescapsula,g_strconcat("E",NULL));
			}
			iddato++;
			//liberando valorborna//
			if(valorborna!=NULL)
			{
				g_free(valorborna);
				valorborna=NULL;
			}	
			//<controla el numero de datos>//
			if (iddato==atoi(cuantos)+3)
				break;
			//
		}
	}	
	//liberando cadenarecibida_sineco//	
	if(cadenarecibida_sineco!=NULL)
	{
		g_free(cadenarecibida_sineco);
		cadenarecibida_sineco=NULL;
	}
	//liberando tramavuelta_c_sineco//	
	if(tramavuelta_c_sineco	!=NULL)
	{
		g_free(tramavuelta_c_sineco	);
		tramavuelta_c_sineco=NULL;
	}
	//liberando datos//
	if(datos !=NULL)
	{
		g_strfreev(datos);
		datos=NULL;
	}
	//liberando totaldatos//
	if(totaldatos!=NULL)
	{
		g_free(totaldatos);
		totaldatos=NULL;
	}	
	//liberando tramavuelta_c//
	if(tramavuelta_c!=NULL)
	{
		g_free(tramavuelta_c);
		tramavuelta_c=NULL;
	}
	//liberando cadenarecibida//	
	if(cadenarecibida!=NULL)
	{
		g_free(cadenarecibida);
		cadenarecibida=NULL;
	}	
	//liberando cadenasalida//	
	if(cadenasalida!=NULL)
	{
		g_free(cadenasalida);
		cadenasalida=NULL;
	}	
	
	//<!21012008-error al preguntar por bornas clip 0-254-70¡>//
	return error_trama;	//-1 error a log de escribir 
				//-2 error a log de lectura null
				//-3 error a log de error checksum 
				//-4 error en eco/sin eco, no coincide opcion con trama recibida.
				//-5 error trama sin Var y FR
				//-6 falta valores de respuesta
				//-7 todos error pòr error trama
	//		
}
//

///////////////////////////////////////////////////////////////////

//opciones//
//

//
gint claveacceso_clip(GList *datalista)
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
	gint claveacceso=0;
	//
	gchar claveaccesos[5]={0};
	gchar identidadacceso[3]={0};
	gchar ht[1]={9};
	gint estadoabrirpuerto=-1;
	gint estadoclip=-1;
	//

	//
	memset(iden,0,10);
	
	if(listainfo!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listainfo,0));		//0,1,...//puerto
		sprintf(puerto,"/dev/ttyS%d",idpuerto);			//tty
		//
		comando=atoi(g_list_nth_data(listainfo,1));		// ej.= 20...//comando
		//
		velocidad=atoi(g_list_nth_data(listainfo,2));		// ej.= 19200
		paridad=atoi(g_list_nth_data(listainfo,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listainfo,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listainfo,5));  	//1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listainfo,6)); 	//2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listainfo,7)); 		// 5,6,7,8//bits
		//
		eco=atoi(g_list_nth_data(listainfo,8)); 		// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listainfo,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listainfo,10)); 	//microseg
		tiempotrama=atoi(g_list_nth_data(listainfo,11)); 	//microseg
		tiemposalidarb=( atoi(g_list_nth_data(listainfo,12)) * 1000);//milseg
		//
		claveacceso=atoi(g_list_nth_data(listainfo,13)); 	//claveacceso (por defecto 2323)
		/////////////////////////////////////////////////////////////////////////////////
		if(claveacceso==0)		
			strcpy(claveaccesos,"2323");	//por defecto
		else
			strcpy(claveaccesos,g_list_nth_data(listainfo,13));	//?
		strcpy(identidadacceso,g_list_nth_data(listainfo,1));
		tamtramavuelta=512;				

		//ABRIR PUERTO//
		estadoclip = FEF_abrirpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);
		///////////////
		estadoabrirpuerto=estadoclip;

		if(estadoabrirpuerto == 1)
		{	
			//CONFIGURAR PUERTO//
			estadoclip = FEF_configurarpuertoserieclip1_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);
			//acceso//
			if(estadoclip!=-1)
			{
				//MONTAR-ENVIAR-LEER-TRATAR CLAVE ACCESO//
				estadoclip=FBFK_claveacceso_funcionesespeciales_libgsksoa(identidadacceso, claveaccesos, eco, tiempolectura, tiempotrama, fdpuerto);
			}								
			if (estadoclip != 1)
			{
				g_printf("\nCLIPSERIE-----------------ERROR ACCESO\n");
				//Si error cerrar puerto//
				FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto);
				//
			}
			else
			{
				g_print("\nCLIPSERIE-------------------ACCESO ok....\n");
			}
			//
		}
		//estadoclip marca si es todo ok incluido acceso permitido//
	
		//estados OK para enviar capsula///////ACCESO OK////////////
		if( ((estadoclip==0) || (estadoclip==1)) && (fdpuerto>=0))
		{			
			g_printf("\nCLIPSERIE---ESTADOCLIP OK---ACCESO OK...\n");

			FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto);
			//
			return 1;
		}
		/////////////////////////////////////////////////////////////////////////////////
	}
	
	g_printf("\n>OPERACION-0 CLIP CLAVEACCESO ERROR comando:[%d]<\n",comando);
	return -1;
}
//
gint leerestadorecurso_clip(GList *datalista)
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
	gint recurso=0;
	gint estadorecurso=0;
	gint estadoabrirpuerto=-1;
	gint estadoclip=-1;
	gchar identidadacceso[3]={0};
	//
	gint tpdesde=0;
	gint tphasta=0;
	gint tpcuantos=0;
	gchar asciidesde[4]={0};
	gchar asciicuantos[4]={0};
	GList *valorescapsula = NULL;	//valores tp
	gchar desde[4]={0};
	gchar cuantos[4]={0};
	gint respuestarecurso=-1;
	//

	//
	memset(iden,0,10);
	
	if(listainfo!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listainfo,0));		//0,1,...//puerto
		sprintf(puerto,"/dev/ttyS%d",idpuerto);			//tty
		//
		comando=atoi(g_list_nth_data(listainfo,1));		// ej.= 20...//comando
		//
		velocidad=atoi(g_list_nth_data(listainfo,2));		// ej.= 19200
		paridad=atoi(g_list_nth_data(listainfo,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listainfo,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listainfo,5));  	//1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listainfo,6)); 	//2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listainfo,7)); 		// 5,6,7,8//bits
		//
		eco=atoi(g_list_nth_data(listainfo,8)); 		// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listainfo,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listainfo,10)); 	//microseg
		tiempotrama=atoi(g_list_nth_data(listainfo,11)); 	//microseg
		tiemposalidarb=( atoi(g_list_nth_data(listainfo,12)) * 1000);//milseg
		//
		recurso=atoi(g_list_nth_data(listainfo,13)); 	//recurso
		/////////////////////////////////////////////////////////////////////////////////
		tamtramavuelta=512;				
		tiempolectura=5000000;
		tiempotrama=500000;
		//ABRIR PUERTO//
		estadoclip = FEF_abrirpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);
		///////////////
		estadoabrirpuerto=estadoclip;

		if(estadoabrirpuerto == 1)
		{	
			//CONFIGURAR PUERTO//
			estadoclip = FEF_configurarpuertoserieclip1_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);
		}

		if (estadoclip != 1)
		{
			g_printf("\nCLIPSERIE-----------------ERROR CONFIGURAR\n");
			//Si error cerrar puerto//
			FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto);
			//
		}
		else
		{
			g_printf("\nCLIPSERIE-------PUERTO ABIERTO Y CONFIGURADO...\n");

			strcpy(identidadacceso,g_list_nth_data(listainfo,1));
			//
			tpdesde=recurso;
			tpcuantos=1;
			if(recurso==999)
			{
				tpdesde=0;
				tpcuantos=255;
			}
			//
			memset(&asciidesde,NULL,4);
			memset(&asciicuantos,NULL,4);
			//
			sprintf(asciidesde,"%d",tpdesde);	
			sprintf(asciicuantos,"%d",tpcuantos);
			//
			//desde=asciidesde
			desde[0]=asciidesde[0];		//max 3 cifras
			desde[1]=asciidesde[1];		//
			desde[2]=asciidesde[2];
			desde[3]=NULL;
			//hasta=asciicuantos
			cuantos[0]=asciicuantos[0];	//max 3 cifras
			cuantos[1]=asciicuantos[1];	//
			cuantos[2]=asciicuantos[2];
			cuantos[3]=NULL;

			g_printf("\nCLIPSERIE--TRAMACLIP-----desde[%s]cuantos[%s]\n",asciidesde,asciicuantos);
			//
			respuestarecurso=FBFK_tramaclip2_funcionesespeciales_libgsksoa(identidadacceso,tiempolectura,tiempotrama,fdpuerto,eco,&valorescapsula,desde,cuantos);	
			//		
	
			//OK//
			if(respuestarecurso==1 && valorescapsula!=NULL)
			{			
				//
				if(g_list_length(valorescapsula) == 1)
				{
					g_printf("\nCLIPSERIE---ESTADOCLIP OK---RECURSO OK...\n");
					g_printf("\nCLIPSERIE---RECURSO(%d)---->VALOR[%s]\n",tpdesde,g_list_nth_data(valorescapsula,0));
					//
				}
				else
				{
					g_printf("\nCLIPSERIE---ESTADOCLIP OK---RECURSOS OK...TODOS\n");
					g_printf("\nCLIPSERIE\nrecurso---valor-------");
					valor13=0;
					while(g_list_nth_data(valorescapsula,valor13))
					{
						//
						g_printf("\n(%d)       [%s]",valor13,g_list_nth_data(valorescapsula,valor13));
						//
						valor13++;
					}
					g_printf("\n----------------------\n");
					//
				}
	
				//liberando valorescapsula//
				if(valorescapsula!=NULL)
				{
					MC_LIBERARLISTADATA_DRIVERSCLIPSERIE_LIBSOAV1(&valorescapsula);
					valorescapsula = NULL;
				}

				FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto);
				//
	
				return 1;
			}
			/////////////////////////////////////////////////////////////////////////////////
		}
	}
	
	g_printf("\n>OPERACION-2 CLIP VER ESTADO RECURSO ERROR comando:[%d]<\n",comando);
	return -1;
}
//pendiente
gint ponerestadoenrecurso_clip(GList *datalista)
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
	gint recurso=0;
	gint estadorecurso=0;
	gint estadoabrirpuerto=-1;
	gint estadoclip=-1;
	gchar identidadacceso[3]={0};
	//
	gint tpdesde=0;
	gint tphasta=0;
	gint tpcuantos=0;
	gchar asciidesde[4]={0};
	gchar asciicuantos[4]={0};
	GList *valorescapsula = NULL;	//valores tp
	gchar desde[4]={0};
	gchar cuantos[4]={0};
	gint respuestarecurso=-1;
	//

	//
	memset(iden,0,10);
	
	if(listainfo!=NULL)
	{		
		idpuerto=atoi(g_list_nth_data(listainfo,0));		//0,1,...//puerto
		sprintf(puerto,"/dev/ttyS%d",idpuerto);			//tty
		//
		comando=atoi(g_list_nth_data(listainfo,1));		// ej.= 20...//comando
		//
		velocidad=atoi(g_list_nth_data(listainfo,2));		// ej.= 19200
		paridad=atoi(g_list_nth_data(listainfo,3));		// 1= sin paridad  2=impar   3=par
		bitstop=atoi(g_list_nth_data(listainfo,4));		// 2= 2 stopbits  1/otro= 1 stopbits por defecto
		tipolectura=atoi(g_list_nth_data(listainfo,5));  	//1=canonica 2/otro=no canonica por defecto
		tipoenviobits=atoi(g_list_nth_data(listainfo,6)); 	//2=sincrono   1/otro = asincrono por defecto
		bitsdatos=atoi(g_list_nth_data(listainfo,7)); 		// 5,6,7,8//bits
		//
		eco=atoi(g_list_nth_data(listainfo,8)); 		// 1=con eco  0=sin eco
		tiempolectura=atoi(g_list_nth_data(listainfo,9)); 	//microseg
		tiempodesbloqueo=atoi(g_list_nth_data(listainfo,10)); 	//microseg
		tiempotrama=atoi(g_list_nth_data(listainfo,11)); 	//microseg
		tiemposalidarb=( atoi(g_list_nth_data(listainfo,12)) * 1000);//milseg
		//
		recurso=atoi(g_list_nth_data(listainfo,13)); 		//recurso
		estadorecurso=atoi(g_list_nth_data(listainfo,14)); 	//estado
		/////////////////////////////////////////////////////////////////////////////////
		tamtramavuelta=512;				
		tiempolectura=5000000;
		tiempotrama=500000;
		//ABRIR PUERTO//
		estadoclip = FEF_abrirpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto,&fdpuerto);
		///////////////
		estadoabrirpuerto=estadoclip;

		if(estadoabrirpuerto == 1)
		{	
			//CONFIGURAR PUERTO//
			estadoclip = FEF_configurarpuertoserieclip1_funcionesespeciales_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);
		}

		if (estadoclip != 1)
		{
			g_printf("\nCLIPSERIE------SD-----------ERROR CONFIGURAR\n");
			//Si error cerrar puerto//
			FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto);
			//
		}
		else
		{
			g_printf("\nCLIPSERIE---SD----PUERTO ABIERTO Y CONFIGURADO...\n");

			strcpy(identidadacceso,g_list_nth_data(listainfo,1));
			//
			tpdesde=recurso;
			tpcuantos=1;
			//
			g_printf("\nCLIPSERIE--TRAMACLIP-SD---RECURSO[%d]-->A ESTADO[%d]\n",recurso,estadorecurso);
			//
			if(estadorecurso==0)
				respuestarecurso=FBFK_tramaclipsd_funcionesespeciales_libgsksoa(identidadacceso,tiempolectura,tiempotrama,fdpuerto,eco,tpdesde,"0");	
			if(estadorecurso==1)	
				respuestarecurso=FBFK_tramaclipsd_funcionesespeciales_libgsksoa(identidadacceso,tiempolectura,tiempotrama,fdpuerto,eco,tpdesde,"1");	
			//OK//
			if(respuestarecurso==1)
			{			
				g_printf("\nCLIPSERIE--SD--ESTADOCLIP OK---ENVIADO(%d) ESTADO(%d) OK...\n",recurso,estadorecurso);
				//

				FEF_cerrarpuertoserieclip_funcionesespeciales_libgsksoa(idpuerto);
				//
	
				return 1;
			}
			/////////////////////////////////////////////////////////////////////////////////
		}

		/////////////////////////////////////////////////////////////////////////////////

		return 1;
	}
	
	g_printf("\n>OPERACION-2 CLIP PONER ESTADO EN RECURSO: ERROR comando:[%d]<\n",comando);
	return -1;
}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////
//
gint main (int argc, char *argv[])
{	
	gint resultado=-1;
	gint operacion=-1;	
	GList *listaoperacion=NULL;
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//recibe argumentos: tipo operacion(0,1,2)-comando-puerto(0,1,..)-eco(0,1)-[recurso]-[claveacceso]-[estado(0,1)]//
	//operacion -->  0	claveacceso				operacion comando puerto eco claveacceso
	//									0 10 3 0 2323
	//		 1	leer estado recurso  ed-ea		operacion comando puerto eco recurso
	//									1 10 3 0 4
	//		 2	poner en estado 0-1 recurso sd		operacion comando puerto eco recurso estado
	//									2 10 3 0 25 1
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if(argv[1]!=NULL)
	{
		operacion=atoi(argv[1]);
		g_print( "\n\n\n=======================================\n",operacion);				
		g_print( ">>>>>>operacion:%d clip inicio<<<<<\n",operacion);				
		switch(operacion)
		{
			case 0:
			if(argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL && argv[5]!=NULL)
			{
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));	//puerto
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));	//comando
				listaoperacion=g_list_append(listaoperacion,g_strconcat("19200",NULL));	//velocidad
				listaoperacion=g_list_append(listaoperacion,g_strconcat("3",NULL));	//paridad
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//stopbits
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//canonica-nocanonica
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//sincrono-asincrono
				listaoperacion=g_list_append(listaoperacion,g_strconcat("7",NULL));	//bits
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL)); //eco
				listaoperacion=g_list_append(listaoperacion,g_strconcat("2000000",NULL));	//tiempolectura
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));	//tiempodesbloqueo
				listaoperacion=g_list_append(listaoperacion,g_strconcat("100000",NULL));	//tiempotrama
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		//tiemposalidarb
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[5],NULL));	//claveacceso
	
				resultado=claveacceso_clip(listaoperacion);
				if(resultado!=1)
				{
					g_print( "\n>>>>>>OPERACION 0 CLIP - ERROR - NO EJECUTADA<<<<<\n" );
				}				
			}			
			else
			{
				g_print( "\n>>>>>>OPERACIONES CLIP - ERROR EN ARGUMENTOS: operacion 0<<<<<\n" );		
				g_print( "\n ARGUMENTOS op 0: operacion  comando  puerto  eco claveacceso \n" );
				g_print( "\n ARGUMENTOS op 1: operacion  comando  puerto  eco recurso     \n" );
				g_print( "\n ARGUMENTOS op 2: operacion  comando  puerto  eco recurso estado\n" );				
				g_print( "        operacion: 0,1,2   comando:nn  puerto:0,1,2... eco:0,1  \n" );				
				g_print( "        claveacceso:2323   recurso:0-254  estado:0,1            \n" );				
			}
			break;
			case 1:
			if(argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL && argv[5]!=NULL)
			{
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));	//puerto
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));	//comando
				listaoperacion=g_list_append(listaoperacion,g_strconcat("19200",NULL));	//velocidad
				listaoperacion=g_list_append(listaoperacion,g_strconcat("3",NULL));	//paridad
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//stopbits
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//canonica-nocanonica
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//sincrono-asincrono
				listaoperacion=g_list_append(listaoperacion,g_strconcat("7",NULL));	//bits
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL)); //eco
				listaoperacion=g_list_append(listaoperacion,g_strconcat("2000000",NULL));	//tiempolectura
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));	//tiempodesbloqueo
				listaoperacion=g_list_append(listaoperacion,g_strconcat("100000",NULL));	//tiempotrama
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		//tiemposalidarb
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[5],NULL));	//recurso
	
				resultado=leerestadorecurso_clip(listaoperacion);
				if(resultado!=1)
				{
					g_print( "\n>>>>>>OPERACION 1 CLIP - ERROR - NO EJECUTADA<<<<<\n" );
				}				
			}			
			else
			{
				g_print( "\n>>>>>>OPERACIONES CLIP - ERROR EN ARGUMENTOS: operacion 0<<<<<\n" );		
				g_print( "\n ARGUMENTOS op 0: operacion  comando  puerto  eco claveacceso \n" );
				g_print( "\n ARGUMENTOS op 1: operacion  comando  puerto  eco recurso     \n" );
				g_print( "\n ARGUMENTOS op 2: operacion  comando  puerto  eco recurso estado\n" );				
				g_print( "        operacion: 0,1,2   comando:nn  puerto:0,1,2... eco:0,1  \n" );				
				g_print( "        claveacceso:2323   recurso:0-254  estado:0,1            \n" );				
			}
			break;
			case 2:
			if(argv[2]!=NULL && argv[3]!=NULL && argv[4]!=NULL && argv[5]!=NULL && argv[6]!=NULL)
			{
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[3],NULL));	//puerto
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[2],NULL));	//comando
				listaoperacion=g_list_append(listaoperacion,g_strconcat("19200",NULL));	//velocidad
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//paridad
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//stopbits
				listaoperacion=g_list_append(listaoperacion,g_strconcat("2",NULL));	//canonica-nocanonica
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1",NULL));	//sincrono-asincrono
				listaoperacion=g_list_append(listaoperacion,g_strconcat("8",NULL));	//bits
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[4],NULL)); //eco
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));	//tiempolectura
				listaoperacion=g_list_append(listaoperacion,g_strconcat("1000000",NULL));	//tiempodesbloqueo
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		//tiempotrama
				listaoperacion=g_list_append(listaoperacion,g_strconcat("0",NULL));		//tiemposalidarb
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[5],NULL));	//recurso
				listaoperacion=g_list_append(listaoperacion,g_strconcat(argv[6],NULL));	//estado
	
				resultado=ponerestadoenrecurso_clip(listaoperacion);
				if(resultado!=1)
				{
					g_print( "\n>>>>>>OPERACION 2 CLIP - ERROR - NO EJECUTADA<<<<<\n" );
				}				
			}			
			else
			{
				g_print( "\n>>>>>>OPERACIONES CLIP - ERROR EN ARGUMENTOS: operacion 0<<<<<\n" );		
				g_print( "\n ARGUMENTOS op 0: operacion  comando  puerto  eco claveacceso \n" );
				g_print( "\n ARGUMENTOS op 1: operacion  comando  puerto  eco recurso     \n" );
				g_print( "\n ARGUMENTOS op 2: operacion  comando  puerto  eco recurso estado\n" );				
				g_print( "        operacion: 0,1,2   comando:nn  puerto:0,1,2... eco:0,1  \n" );				
				g_print( "        claveacceso:2323   recurso:0-254  estado:0,1            \n" );				
			}
			break;
			default:
			g_print( "\n>>>>>>OPERACIONES CLIP - ERROR EN ARGUMENTO OPERACION: operacion NO EXISTE...\n (operaciones validas: 0,1,2,3,4,5)<<<<<\n\n\n" );
			g_print( "\n>>>>>>OPERACIONES CLIP - ERROR EN ARGUMENTOS: operacion 0<<<<<\n" );	
			g_print( "\n ARGUMENTOS op 0: operacion  comando  puerto  eco claveacceso \n" );
			g_print( "\n ARGUMENTOS op 1: operacion  comando  puerto  eco recurso     \n" );
			g_print( "\n ARGUMENTOS op 2: operacion  comando  puerto  eco recurso estado\n" );				
			g_print( "        operacion: 0,1,2   comando:nn  puerto:0,1,2... eco:0,1  \n" );				
			g_print( "        claveacceso:2323   recurso:0-254  estado:0,1            \n" );				
			//
		}
		g_print( "\n>>>>>>operacion CLIP ejecutada<<<<<\n" );	
		g_print( "=====================================\n\n\n" );	
	}
	else
	{
		g_print( "\n>>>>>>OPERACIONES CLIP - ERROR EN ARGUMENTOS: operacion 0<<<<<\n" );		
		g_print( "\n ARGUMENTOS op 0: operacion  comando  puerto  eco claveacceso \n" );
		g_print( "\n ARGUMENTOS op 1: operacion  comando  puerto  eco recurso     \n" );
		g_print( "\n ARGUMENTOS op 2: operacion  comando  puerto  eco recurso estado\n" );				
		g_print( "        operacion: 0,1,2   comando:nn  puerto:0,1,2... eco:0,1  \n" );				
		g_print( "        claveacceso:2323   recurso:0-254  estado:0,1            \n" );				
	}
	//
	exit(0);
}

//END
