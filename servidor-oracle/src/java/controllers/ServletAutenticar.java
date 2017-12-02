package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GrobbierElder
 */
public class ServletAutenticar extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws SecurityException, IOException, ServletException{
                        /*response.setContentType("text/html;charset=UTF-8"); //Para mostrarte el mensaje en la pagina web                       
                         //response.setContentType("application/msword");//Para abrirte un archivo de Word o descargarlo y viene el mensaje adentro del word
                        //fabricamos la respuesta
                          PrintWriter salida=  response.getWriter();
                                    salida.println("Hola Mundo con Servlets");         
                        // el de la camara getoutputStream()
                        */
                        
     //Pedimos los valores que envio el formulario y verificamos que sean correctos
       String login= request.getParameter("login");
       String password= request.getParameter("password");
                        
        System.out.println("El login es: "+login+" el password es: "+password);
        
                        
                        
                        
   //El servlet hace el ruteamiento como sigue
        RequestDispatcher despachador=request.getRequestDispatcher("/bienvenido.html"); //requestdispatcher es el despachador de paginas
        
  //El despachador la routea
        despachador.forward(request, response);
        
        }
    }

