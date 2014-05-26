<%-- 
    Document   : ConsultarPersonalAdmin
    Created on : 13-may-2014, 12:53:29
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Personal Administrativo</title>
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
           <h1>Consultar Personal Administrativo
           </h1>
        </div>       
        
               
         <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ConsultarPersonalAdmin" method="post">
              <%-- Datos del medico a buscar --%>
                <fieldset>   
                    <label> Introduzca el identificador del personal administrativo que desee consultar:</label> 
                    <br><br>
                    <input type="text" name="id_personal_admin" value="">
                    <br><br>
     
                </fieldset>
                <br>
                <br>
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">   
	
           <%-- Una vez le damos al botón buscar, nos vamos a CONSULTARPERSONALADMINMUESTRA --%>
            </form>
                   
    </body>
</html>
