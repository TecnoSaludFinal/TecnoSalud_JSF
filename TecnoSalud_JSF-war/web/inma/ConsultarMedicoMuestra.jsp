<%-- 
    Document   : ConsultarMedicoMuestra
    Created on : 28-abr-2014, 19:02:45
    Author     : Inma
--%>
<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Medico</title>
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
           <h1>Consultar Medico
           </h1>
        </div>
       
        <fieldset> 
            
             <%
                    Medicos medico = (Medicos) request.getAttribute("m");
             %>
                       <legend align= "left">
                                Datos del medico a consultar
                       </legend>
                       <br>
                       Identificador del médico:
                       <input  name="id_med" value="<%= medico.getIdMedicos() %>  ">                             
                       <br><br>
                       Nombre: 
                       <input  name="nombre" value="<%= medico.getNombre() %>  ">
                       <br><br>                                  
                       Apellidos:         
                       <input  name="Apellidos" value="<%= medico.getApellidos() %> ">
                       <br><br>          
                       Especialidad:           
                       <input  name="Especialidad" value=" <%= medico.getIdEspecialidad().getNombre() %> ">        
                       <br><br>           
                                      
            </fieldset>
                                
            <%-- Opcion volver --%>
            <%-- <input type="submit" name="btnVolver" value="Volver"> --%>
            <a href="PanelAdminMedicos.jsp">Volver al panel administracion</a>
                                
                             
   
    </body>
</html>
