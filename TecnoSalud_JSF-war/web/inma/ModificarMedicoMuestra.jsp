<%-- 
    Document   : ModificarMedicoMuestra
    Created on : 13-may-2014, 9:58:26
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Roles"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Medico</title>
    </head>
    <body>
         <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
     <h1>Bienvenido: <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %></h1>
     <br>
     <a href="/Inicio/logoutServlet"> Salida </a>
     <br>
        <h1>Modificar Medico</h1>
        <br><br>    
        
         <%
                    Medicos medico = (Medicos) request.getAttribute("m");
         %>
         
          <%
            List<Especialidad> lista_espe = (List <Especialidad>)request.getAttribute("lista_especialidad");
          %>
        
        <%
            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
        %>
     
          <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ModificarMedicoM" method="post">
                <fieldset> 
                        <legend align= "left">
                                Datos del medico a consultar
                       </legend>
                       <br>
                       ID del médico:
                       <input  name="id_medico" value="<%= medico.getIdMedicos() %>">                        
                       <br><br>
                       DNI del médico:
                       <input  name="dni" value="<%= medico.getDni()%>">                             
                       <br><br>
                       Nombre: 
                       <input  name="nombre" value="<%= medico.getNombre() %>">
                       <br><br>                                  
                       Apellidos:         
                       <input  name="apellidos" value="<%= medico.getApellidos() %>">
                       <br><br>          
                       Contrasena:         
                       <input  name="contrasena" value="<%= medico.getContrasena()%>">
                       <br><br>                        
                       <label for="especialidad">Especialidad</label>
                       <select name ="especialidad" id="especialidad">
                        <%
                        //Recorremos la lista
                        for(int i=0;i<lista_espe.size();i++)
                        {                                  
                            %>
                            <option value="<%= lista_espe.get(i).getIdEspecialidad() %>">
                                <%= lista_espe.get(i).getNombre() %>
                            </option>
                        <%    
                        }
                        %>
            
                </select>
                               
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
            <a href="PanelAdminMedicos.jsp">Volver al panel administracion</a>
        
    </body>
</html>
