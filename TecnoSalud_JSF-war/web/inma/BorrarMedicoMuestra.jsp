<%-- 
    Document   : BorrarMedicoMuestra
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
        <title>Eliminar Medico</title>
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
           <h1>Eliminar Medico
           </h1>
        </div>
     <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/BorrarMedico" method="post">
        <fieldset> 
            
             <%
                    Medicos medico = (Medicos) request.getAttribute("m");
             %>
                       <legend align= "center">
                                Datos del medico a eliminar 
                       </legend>
                       <br>
                       Identificado del médico:
                       <input type="label" name="id_med" value="<%= medico.getIdMedicos() %>  ">
                       <br><br>                                   
                       Nombre:                          
                       <input type="label" name="nombre" value="<%= medico.getNombre() %>  ">
                       <br><br>                           
                       Apellidos:         
                       <input type="label" name="Apellidos" value="<%= medico.getApellidos() %> ">
                       <br><br>          
                       Especialidad:          
                       <input type="label" name="Especialidad" value=" <%= medico.getIdEspecialidad().getNombre() %> ">        
                       <br><br>  
                       
                       
                                       
            </fieldset>
                       <input type="submit" value="Borrar" name="Borrar"> 
            </form>
             <%-- Boton  --%>        
                     
            <br>          
            <%-- Opcion volver --%>
            <%-- <input type="submit" name="btnVolver" value="Volver"> --%>
            <a href="PanelAdminMedicos.jsp">Volver al panel administracion</a>
                                
                        
  
    </body>
</html>