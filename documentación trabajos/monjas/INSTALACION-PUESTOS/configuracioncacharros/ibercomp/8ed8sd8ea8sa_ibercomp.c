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
		g_printf("\n%d------>%d\n",velocidad13,valor13);
		valor13_ida=valor13;
		
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
		
		g_printf("\n----programar ibercomp----puerto---->%s---->tramaida:[%d][%d][%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2],tramaida[3],tramaida[4]);
					
		//fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",3,idpuerto);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",4,idpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,5);
				if (respuesta == -1)
				{
						//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",5,idpuerto);			
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
							//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",6,idpuerto);			
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
									//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",7,idpuerto);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[4] == tramavuelta[4] ) && 
										( tramavuelta[5] == 0 ) )
									{
										//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",8,idpuerto);
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
								//FEF_logpatines_seriepatines_libgsksoa (comando,0,"ibercomp","programar",9,idpuerto);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
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
	
	g_printf("\n>OPERACION IBERCOMP PROGRAMAR ERROR comando:[%d]<\n",comando);					
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

		if(eco==1)
			tamtramavuelta=6;
		else
			tamtramavuelta=2;
		
		tramaida[0] = comando;
		tramaida[1] = 228;
		tramaida[2] = 13;	//reg=13
		tramaida[3] = tramaida[0] + tramaida[1] + tramaida[2];
		tramaida[4] = 0;
					
		g_printf("\n----ibercomp-leer velocidad----puerto---->%s---->tramaida:[%d][%d][%d][%d]\n",puerto,tramaida[0],tramaida[1],tramaida[2],tramaida[3]);
					
		//fdpuerto = FEF_abrirpuertoserie_seriepatines_libgsksoa(puerto);
		estado = FEF_abrirpuertoserie_seriepatines_libgsksoa(idpuerto,&fdpuerto);	
		if(fdpuerto==-1)
		{
			g_print("\n1\n");
			//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",3,idpuerto);
		}
		else
		{
			estado=FEF_configurarpuertoserie_seriepatines_libgsksoa(fdpuerto,velocidad,paridad,bitstop,tipolectura,tipoenviobits,bitsdatos);	
			if(estado==-1)
			{
				g_print("\n2\n");
				//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",4,idpuerto);
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);
			}
		}
		
		if( (estado!=-1) && (fdpuerto>=0) )
		{
				respuesta = FEF_escribirpuertoserie_seriepatines_libgsksoa(fdpuerto,tramaida,4);
				if (respuesta == -1)
				{
					g_print("\n3\n");
						//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",5,idpuerto);			
				}
				else
				{
						if ( tiempolectura >= 1000000 )						
						{
							g_print("\n3.1\n");
							tiempolectura = tiempolectura / 1000000;
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,tiempolectura,0,tiempotrama,tamtramavuelta);
						}
						else
						{
							g_print("\n3.2\n");
							tramavuelta = FEF_leerpuertoserie_seriepatines_libgsksoa(fdpuerto,0,tiempolectura,tiempotrama,tamtramavuelta);	
						}
						
						if (tramavuelta == NULL)
						{
							g_print("\n4\n");
							//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",6,idpuerto);			
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
									g_print("\n5\n");
									//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",7,idpuerto);						
									haydato_hayeco_ok=FALSE;
									usleep(tiempodesbloqueo);
								}
								else
								{
									if( ( tramaida[3] == tramavuelta[3] ) && 
										( tramavuelta[4] == 0 ) && (tramavuelta[5] == 0) )
									{
										g_print("\n6\n");
										//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",8,idpuerto);
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
								g_print("\n7\n");								
								//FEF_logpatines_seriepatines_libgsksoa (comando,1,"ibercomp","infovelocidad",9,idpuerto);
								actualizar_pcb=FALSE;
								usleep(tiempodesbloqueo);
							}							
						}							
				}
				//
				FEF_cerrarpuertoserie_seriepatines_libgsksoa(fdpuerto);				
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
		g_print( "\n>>>>>>operacion:%d ibercomp inicio<<<<<\n",operacion);				
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
				g_print( "\n      ARGUMENTOS : operacion(0) comando puerto(0,1) velocidad eco(1,otro) ej.: 0 2 1 57600 1\n" );				
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
				g_print( "\n      ARGUMENTOS : operacion(1) comando puerto(0,1) eco(1,otro) ej.: 1 2 1 1\n" );
			}
			break;
			default:
			g_print( "\n>>>>>>OPERACIONES IBERCOMP - ERROR EN ARGUMENTO OPERACION: operacion NO EXISTE... (operaciones validas: 0,1)<<<<<\n" );					
		}
		g_print( "\n>>>>>>operaciones ibercomp ejecutado<<<<<\n" );	
	}
	else
	{
		g_print( "\n>>>>>>OPERACIONES IBERCOMP - ERROR EN ARGUMENTO 1º:operacion<<<<<\n" );		
		g_print( "\n      ARGUMENTO 1º: operacion(0,1)\n" );				
	}
	//
	exit(0);
}
