#include <glib.h>
#include <time.h>
#include <dlfcn.h>
#include <locale.h>
#include <mysql.h>
#include <libgsksoa.h>
#include <creaciontri_libmsqlsoa.h>
#include <pthread.h>
#include <gtk/gtk.h>


gchar *IDRBACTUAL_rb_librb=NULL;
gchar *RBACTUAL_rb_librb=NULL;
pthread_cond_t condiciones_rb_librb[500];
pthread_mutex_t mutex_rb_librb[500];
pthread_mutex_t mutexrb_rb_librb[500];
gchar *estado_rb_librb[500];
 
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

		if(eco==1)
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
		
		tramaida[0] = comando;
		tramaida[1] = 0x01;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
					
		g_printf("\n----circontrol-resetear----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		///fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",4,idpuerto,NULL);
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",5,idpuerto,NULL);	
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",6,idpuerto,NULL);			
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
									FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",8,idpuerto,NULL);
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
								FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","resetear",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL RESETEAR OK comando:[%d]<\n",comando);
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL RESETEAR ERROR comando:[%d]<\n",comando);					
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

		if(eco==1)
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
				
		tramaida[0] = comando;
		tramaida[1] = 0x00;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
			
		g_printf("\n----circontrol-programar direccion----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		//fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);			
		if(fdpuerto==-1)
		{
			FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",4,idpuerto,NULL);
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",6,idpuerto,NULL);			
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
									FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",8,idpuerto,NULL);
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
								FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programardir",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
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
	
	g_printf("\n>OPERACION CIRCONTROL PROGRAMAR DIR   ERROR comando:[%d]<\n",comando);					
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

		if(eco==1)
			tamtramavuelta=7;
		else
			tamtramavuelta=4;
		
		tramaida[0] = comando;
		tramaida[1] = 0x05;
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
					
		g_printf("\n----circontrol-informacionequipo----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		///fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",4,idpuerto,NULL);
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",6,idpuerto,NULL);			
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
									FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) && (tramavuelta[4] == 0) && (tramavuelta[5] == 0) )
									{
										FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",8,idpuerto,NULL);
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
								FEF_logpatines_seriepatines_libgsksoa (0,comando,2,"circontrol","info",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
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
	
	g_printf("\n>OPERACION CIRCONTROL INFORMACIONEQUIPO ERROR comando:[%d]<\n",comando);					
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

		if(eco==1)
			tamtramavuelta=4;
		else
			tamtramavuelta=1;
		
		tramaida[0] = comando;
		tramaida[1] = 0x30 | (tiempolecturalector/2);
		tramaida[2] = tramaida[0] + tramaida[1];
		tramaida[3] = 0;
					
		g_printf("\n----circontrol-programar tiempolectura----puerto---->%s---->tramaida:[%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		///fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",4,idpuerto,NULL);
				//FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",6,idpuerto,NULL);										usleep(tiempodesbloqueo);
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
									FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",8,idpuerto,NULL);
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
								FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programartiempolectura",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
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
	
	g_printf("\n>OPERACION CIRCONTROL PROGRAMAR TIEMPO LECTURA ERROR comando:[%d]<\n",comando);		
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

		g_printf("\n----Cambiar a binario---->%s---->tramaida:[%d][%d][%d][%d][%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4],tramaida[5],tramaida[6]);
					
		///fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",4,idpuerto,NULL);
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,7);

				if (respuesta == -1)
				{
						FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",6,idpuerto,NULL);			
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
									FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",8,idpuerto,NULL);
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
								FEF_logpatines_seriepatines_libgsksoa (0,comando,0,"circontrol","cambiarbinario",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL CAMBIARBINARIO OK comando:[%d]<\n",comando);
					return 1;
				}
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
		g_printf("\n----circontrol-programar-fijar velocidad:%d----puerto---->%s---->tramaida:[%d][%d][%d]\n",velocidadequipo,puerto,tramaida[0],tramaida[1],tramaida[2]);
					
		///fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",3,idpuerto,NULL);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",4,idpuerto,NULL);
				//FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,3);
				if (respuesta == -1)
				{
						FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",5,idpuerto,NULL);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",6,idpuerto,NULL);
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
									FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",7,idpuerto,NULL);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[2] == tramavuelta[2] ) && 
										( tramavuelta[3] == 0 ) )
									{
										FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",8,idpuerto,NULL);
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
								FEF_logpatines_seriepatines_libgsksoa (0,comando,1,"circontrol","programarvelocidad",9,idpuerto,NULL);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				///FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(idpuerto);				
				//
				if(tramavuelta != NULL)
				{
					g_free(tramavuelta);
					tramavuelta = NULL;
				}
				if(actualizar_pcb)
				{
					g_printf("\n>OPERACION CIRCONTROL PROGRAMAR VELOCIDAD OK comando:[%d]<\n",comando);
					return 1;
				}
		}		
	}
	
	g_printf("\n>OPERACION CIRCONTROL PROGRAMAR VELOCIDAD ERROR comando:[%d]<\n",comando);		
	return -1;
}
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
		g_print( "\n>>>>>>operacion:%d CIRCONTROL inicio<<<<<\n",operacion);				
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
					g_print( "\n>>>>>>OPERACION CIRCONTROL - ERROR - NO EJECUTADA<<<<<\n" );					
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
			if( (operacion==0) || (operacion==1) || (operacion==2) || (operacion==4) )
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
					}
					if(resultado!=1)
					{
						g_print( "\n>>>>>>OPERACION CIRCONTROL - ERROR - NO EJECUTADA<<<<<\n" );					
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
		g_print( "\n>>>>>>operaciones CIRCONTROL ejecutado<<<<<\n" );			
	}
	else
	{
		g_print( "\n>>>>>>OPERACIONES CIRCONTROL - ERROR EN ARGUMENTO 1º:operacion<<<<<\n\n" );		
		g_print( "\n--(AYUDA)-------------------------------------------------------------------------------------" );
		g_print( "\n ARGUMENTO 1: operacion(solo 0,1,2,3,4,5)" );				
		g_print( "\n operacion 0: resetear lector." );				
		g_print( "\n operacion 1: programar-fijar direccion lector." );				
		g_print( "\n operacion 2: informacion equipo: tipo y version." );				
		g_print( "\n operacion 3: fijar tiempo relectura." );				
		g_print( "\n operacion 4: cambiar a binario. lector con protocolo tipo binario" );				
		g_print( "\n operacion 5: fijar velocidad lector." );	
		g_print( "\n----------------------------------------------------------------------------------------------" );		
		g_print( "\n operacion(0,1,2) ---> 4 argumentos:" );				
		g_print( "\n operacion  comando(lector)  puerto(0,1,...)  eco(1:si,otro:no) : 0 1 1 1\n" );				
		g_print( "\n operacion(3,5)   ---> 5 argumentos:" );
		g_print( "\n operacion  comando(lector)  puerto(0,1,...)  eco(1:si,otro:no)  [tiemporelectura]o[velocidad]" );
		g_print( "\n (tiemporelectura= 2,4(1 seg,2 seg) o velocidad= 4800,9600,19200)         : 0 1 1 1 [2]o[4800]\n" );				
		g_print( "\n operacion(4)     ---> 4 argumentos:" );
		g_print( "\n operacion  comando(solo 0,1)  puerto  eco(1:si,otro:no)   : 0 1 1 1 \n" );
		g_print( "\n (el lector debe ser el unico en el bus)\n" );
		g_print( "\n----------------------------------------------------------------------------------------------\n" );		
	}		
	//
	exit(0);
}
