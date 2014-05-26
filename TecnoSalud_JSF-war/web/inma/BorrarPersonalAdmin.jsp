<%-- 
    Document   : BorrarPersonalAdmin
    Created on : 13-may-2014, 12:16:43
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar personal administrativo</title>
	 
	
    </head>
   <body>
        <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
     <h1>Bienvenido: <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %></h1>
     <br>
     <a href="/Inicio/logoutServlet"> Salida </a>
     <br>
        <div id="cabecera">
               <h1>
                   Eliminar personal administrativo
               </h1>
        </div>      
        	    
                
         <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/BorrarPersonalAdmin" method="post">
              <%-- Datos del personal a buscar --%>
                <fieldset>   
                    <label> Introduzca el identificador del personal que desee borrar:</label> 
                    <br><br>
                    <input type="text" name="id_personal_admin" value="">
                    <br><br>
                     <%-- Botón buscar --%>
                    <input type="submit" name="btnBuscar" value="Buscar"> 
                         
                </fieldset>
                <br>
                <br>                
                           
          </form>      
        
        <br><br> 
	
    </body>
</html>
