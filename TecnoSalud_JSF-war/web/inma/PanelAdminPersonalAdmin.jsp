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
        <title>PANEL ADMINISTRACION PERSONAL ADMINISTRATIVO</title>
    </head>
    <body>
       <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
     <h1>Bienvenido: <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %></h1>
     <br>
     <a href="/Inicio/logoutServlet"> Salida </a>
     <br>
     <div id="cabz">
           <h1>Panel de control del personal administrativo</h1>
            <div class="side-menu fl">
                <br>
			<h3>Funcionalidades</h3>
			<ul>
				<li><a href="http://localhost:8080/TecnoSalud_Final-war/NuevoPersonalAdmin">Crear nuevo personal administrativo</a></li>
				<li><a href="BorrarPersonalAdmin.jsp">Eliminar personal administrativo</a></li>
                                <li><a href="ConsultarPersonalAdmin.jsp">Consultar personal administrativo</a></li>
                                <li><a href="ModificarPersonalAdmin.jsp">Modificar datos del personal administrativo</a></li>
					
			</ul>
				
            </div> <!-- end side-menu -->
         
        </div>
                  
        
            <%-- <input type="submit" name="btnVolver" value="Volver"> --%>
            <a href="PanelAdminPersonalAdmin.jsp">Volver al panel administracion</a>
	</div> <!-- end top-bar -->
        
        <br><br> 
	
	<!-- MAIN CONTENT -->
	
         <!-- FOOTER -->
	<div id="footer">
		<p><strong>Admin Principal</strong> theme by TecnoSalud </p>
	</div> <!-- end footer -->   
        
        
    </body>
</html>