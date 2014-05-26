<%-- 
    Document   : ModificarPersonalAdminMuestra
    Created on : 13-may-2014, 13:41:25
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Roles"%>
<%@page import="app.entity.PersonalAdministrativo"%>
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
        <h1>Modificar datos de personal</h1>
        <br><br>       
     
         <%
                    PersonalAdministrativo pa = (PersonalAdministrativo) request.getAttribute("m");
         %>
       
        
        <%
            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
        %>
     
          <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ModificarPersonalAdminM" method="post">
                <fieldset> 
                        <legend align= "left">
                                Datos del personal a modificar
                       </legend>
                       <br>
                       ID del personal:
                       <input  name="id_padmin" value="<%= pa.getIdPersonalAdmin() %>">                        
                       <br><br>
                       DNI:
                       <input  name="dni" value="<%= pa.getDni()%>">                             
                       <br><br>
                       Nombre: 
                       <input  name="nombre" value="<%= pa.getNombre() %>">
                       <br><br>                                  
                       Apellidos:         
                       <input  name="apellidos" value="<%= pa.getApellidos() %>">
                       <br><br>          
                       Contrasena:         
                       <input  name="contrasena" value="<%= pa.getContrasena()%>">
                       <br><br>             
                        <label for="rol">Rol</label>
                        <select name ="rol" id="rol">
                                <%
                                //Recorremos la lista
                                for(int i=0;i<lista_rol.size();i++)
                                {                                  
                                    %>
                                    <option value="<%= lista_rol.get(i).getIdRol() %>">
                                        <%= lista_rol.get(i).getTipoRol()  %>
                                    </option>
                                <%    
                                }
                                %>

                        </select> 
                       
                       
               </fieldset>
                       
                        <%-- Botón buscar --%>
            <input type="submit" name="btnModificar" value="Modificar"> 
                                
          </form>
          <br>
          <br>
            <%-- Opcion volver --%>
            <%-- <input type="submit" name="btnVolver" value="Volver"> --%>
            <a href="PanelAdminPersonalAdmin.jsp">Volver al panel administracion</a>
        
    </body>
</html>
