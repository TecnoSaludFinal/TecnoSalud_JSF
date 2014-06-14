<%-- 
    Document   : consultar_paciente2
    Created on : 2014-05-10, 20:43:09
    Author     : Administrator
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
      	<meta http-equiv="Content-Language" content="sk" />
        <title>ListadoPacientes-PA</title>
        <script	type="text/javascript"></script>
        <link rel="stylesheet" href="/TecnoSalud_JSF-war/estilo/style.css">
    </head>    
    <body>
         <%
            PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
         %>
      <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="/TecnoSalud_JSF-war/estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
                    <div id="trees"></div>
            </div>
            
            <!-- navigation -->
            <div id="navcontainer">
                <ul class="mi-menu">
                    <li><a href="principal.jsp"> Inicio </a></li>
                    <li>
                        <a href="#">Perfil</a>
                        <ul>
                            <li><a href =" #">Datos personales</a></li>
                            <li><a href =" #">Crear solicitud cambios de datos</a></li>
                        </ul>
                    </li>
                    <li><a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Historial Médico</a></li>
                    <li>
                        <a href="#"> Consulta de Citas </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Gestión citas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Citas para hoy</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Buscar próximas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Buscar pasadas</a> </li>
                            <li> <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=paci">Buscar por paciente</a> </li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi">Buscar por médico</a> </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Pacientes</a>
                        <ul>                          
                           <li><a href ="/TecnoSalud_JSF-war/arkadiusz/crear_paciente.jsp"> Crear Paciente</a></li>
                           <li><a href ="/TecnoSalud_JSF-war/arkadiusz/consultar_paciente2.jsp">Consultar Paciente</a></li>
                           <li><a href ="/TecnoSalud_JSF-war/ListadoPacientes">Listar pacientes</a></li>
                           <li><a href ="/TecnoSalud_JSF-war/faces/arkadiusz_jsf/crearMensaje.xhtml">Crear Mensaje</a></li>
                           <li><a href ="/TecnoSalud_JSF-war/faces/arkadiusz_jsf/ListarMensajesArkadioNoLeidos.xhtml">Mensajes Recibidos</a></li>
                           <li><a href ="/TecnoSalud_JSF-war/faces/arkadiusz_jsf/ListarMensajesArkadioLeidos.xhtml">Mensajes Antiguos</a></li>
                           
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %>
                        <a href="/TecnoSalud_JSF-war/logoutServlet" id="logout"> Salir </a>
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>
            
            <!-- topoffers -->
            <div id="topoffers">
                <div id="topoffers-left-arrow"><a href=""><img src="/TecnoSalud_JSF-war/estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        <div id="estate1-box">
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Opciones cita</h3>
                            <img src="/TecnoSalud_JSF-war/estilo/images/temp_estate.jpg" alt="Commercial Properties" />
                            <p>Pinchando en este enlace podrás realizar peticiones sobre las citas, 
                                podrás solicitar una cita, modificar y/o eliminar la misma.<br/><br/>
                                <a href="http://localhost:8080/TecnoSalud_JSF-war/listaEsp">Abrir</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Mostrar citas de hoy</h3>
                            <img src="/TecnoSalud_JSF-war/estilo/images/temp_estate.jpg" alt="Deluxe Properties" />
                            <p>Si quieres ver las citas que tienes para el día de hoy<br/><br/><br/><br/><a href="ConsultarListadoCitas?do=all">Abrir</a></p>
                        </div>
                        <div id="estate4-box">
                            
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="/TecnoSalud_JSF-war/estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div>
            
            <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                            <% String error = (String) request.getAttribute("error");
                            if(error != null)
                            {
                                out.println(error);
                            }
                            %>
                            <form action="../ConsultarPaciente" method="POST">
                                NUHSA:
                                <br>
                                <input type="text" name="nuhsa"><br>
                                <INPUT TYPE="SUBMIT" VALUE="Mostrar Datos">
                            </form>
                    </div>
                </div>
            </div>
            <div id="pravy-stlpec-box">
                <div id="pravy-stlpec">
                    <div id="find_property">

                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <!-- footer -->
        <div id="footer">
                <p>M&aacute;s <a href="http://www.mejoresplantillasgratis.es" title="MPG - plantillas web y plantillas Flash" target="_blank">Plantillas Web Gratis</a> en MPG.</p>
                <p><a href="http://www.x-reality.sk">xreality</a></p>
        </div>
                
           
            
    </body>
</html>

 