<%-- 
    Document   : BorrarPersonalAdminMuestra
    Created on : 13-may-2014, 13:39:08
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar personal</title>
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
           <h1>Eliminar personal
           </h1>
        </div>
        
         <fieldset> 
            
             <%
                    PersonalAdministrativo padmin = (PersonalAdministrativo) request.getAttribute("m");
             %>
                       <legend align= "left">
                                Datos del personal a consultar
                       </legend>
                       <br>
                       Identificador del personal:
                       <input  name="id_personal_admin" value="<%= padmin.getIdPersonalAdmin()  %>  ">                             
                       <br><br>
                       Nombre: 
                       <input  name="nombre" value="<%= padmin.getNombre() %>  ">
                       <br><br>                                  
                       Apellidos:         
                       <input  name="Apellidos" value="<%= padmin.getApellidos() %> ">
                       <br><br> 
                       Contrasena:           
                       <input  name="Contrasena" value=" <%= padmin.getContrasena() %> ">        
                       <br><br>
                       Email:           
                       <input  name="Email" value=" <%= padmin.getEmail() %> ">        
                       <br><br>   
                       DNI:           
                       <input  name="Dni" value=" <%= padmin.getDni() %> ">        
                       <br><br>
                       Rol:           
                       <input  name="Rol" value=" <%= padmin.getIdRol().getTipoRol() %> ">        
                       <br><br>
                       
                                      
            </fieldset>
            
             <%-- Boton  --%>               
            <input type="submit" value="Borrar" name="Borrar">              
            <br>           
            <%-- Opcion volver --%>
            <%-- <input type="submit" name="btnVolver" value="Volver"> --%>
            <a href="PanelAdminPersonalAdmin.jsp">Volver al panel administracion</a>
                                
                             
   
    </body>
</html>

