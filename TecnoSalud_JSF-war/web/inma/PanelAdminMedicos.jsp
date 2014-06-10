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
        <meta http-equiv="Content-Type"	content="text/html; charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>PANEL ADMINISTRACION MEDICOS</title>
        <script	type="text/javascript">	</script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
     <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
                    <div id="trees"></div>
            </div>
            
            <!-- navigation -->
            <div id="navcontainer">
                    <ul id="navlist">
                            <li id="active"><a href="#" id="current">INICIO</a></li>
                            <li><a href="#">HOME</a></li>
                            <li><a href="#">ABOUT US</a></li>
                            <li><a href="#">BUYING</a></li>
                            <li><a href="#">SELLING</a></li>
                            <li><a href="#">INSURANCE</a></li>
                            <li><a href="#">CONTACT</a></li>
                    </ul>
            </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %>
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>
            
            <!-- topoffers -->
            <div id="topoffers">
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        <div id="estate1-box">
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Opciones cita</h3>
                            <img src="estilo/images/temp_estate.jpg" alt="Commercial Properties" />
                            <p>Pinchando en este enlace podrás realizar peticiones sobre las citas, 
                                podrás solicitar una cita, modificar y/o eliminar la misma.<br/><br/>
                                <a href="http://localhost:8080/TecnoSalud_JSF-war/listaEsp">Abrir</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Mostrar citas de hoy</h3>
                            <img src="estilo/images/temp_estate.jpg" alt="Deluxe Properties" />
                            <p>Si quieres ver las citas que tienes para el día de hoy<br/><br/><br/><br/><a href="ConsultarListadoCitas?do=all">Abrir</a></p>
                        </div>
                        <div id="estate4-box">
                            
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div>   
        
   
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
            <a href="principal.jsp">Volver al panel principal</a>
            
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