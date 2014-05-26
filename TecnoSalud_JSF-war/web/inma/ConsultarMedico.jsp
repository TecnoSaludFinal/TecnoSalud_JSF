<%-- 
    Document   : ConsultarMedico
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
                        
        
        <%-- Con esto, nos devuelve el objeto MEDICO --%>
                
         <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ConsultarMedico" method="post">
              <%-- Datos del medico a buscar --%>
                <fieldset>   
                    <label> Introduzca el identificador del médico que desee consultar:</label> 
                    <br><br>
                    <input type="text" name="id_medicos" value="">
                    <br><br>
     
                </fieldset>
                <br>
                <br>
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">   
	
           <%-- Una vez le damos al botón buscar, nos vamos a CONSULTARMEDICOMUESTRA --%>
            </form>
                   
    </body>
</html>