<%-- 
    Document   : ModificarPersonalAdmin
    Created on : 13-may-2014, 13:41:11
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar datos de personal</title>
        
        
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
                   Modificar datos de personal
               </h1>
        </div>      
       
                
        <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ModificarPersonalAdmin" method="post">
              <%-- Datos del personal a buscar --%>
                <fieldset>   
                    <label> Introduzca el identificador del personal:</label> 
                    <br><br>
                    <input type="text" name="id_padmin">
                    <br><br>
     
                </fieldset>
                <br>
                <br>
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">              
                           
          </form>     
        
        
    </body>
</html>
