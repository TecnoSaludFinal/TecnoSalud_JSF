<%-- 
    Document   : AdministracionMedicos
    Created on : 29-abr-2014, 21:43:55
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.entity.Medicos"%>
<%@page import="java.util.List"%>
<%@page language="java"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PANEL ADMINISTRACION MEDICOS</title>
    </head>
    <body>
        <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
     <h1>Bienvenido: <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %></h1>
     <br>
     <a href="http://localhost:8080/TecnoSalud_JSF-war/logoutServlet"> Salida </a>
     <br>
     <div id="cabz">
           <h1>Panel de control de Medico </h1>
            <div class="side-menu fl">
                <br>
			<h3>Funcionalidades</h3>
			<ul>
				<li><a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoMedico">Crear nuevo medico</a></li>
				<li><a href="BorrarMedico.jsp">Eliminar medico</a></li>
                                <li><a href="ConsultarMedico.jsp">Consultar medico</a></li>
                                <li><a href="ModificarMedico.jsp">Modificar datos de un medico</a></li>					
			</ul>
				
            </div> <!-- end side-menu -->
         
            
            <%-- <input type="submit" name="btnVolver" value="Volver"> --%>
            <a href="inma/PanelAdminMedicos.jsp">Volver al panel administracion</a>
            
        </div>
                  
	</div> <!-- end top-bar -->
        
        <br><br> 
	
	<!-- MAIN CONTENT -->
	
         <!-- FOOTER -->
	<div id="footer">
		<p><strong>Admin Principal</strong> theme by TecnoSalud </p>
	</div> <!-- end footer -->   
        
        
    </body>
</html>