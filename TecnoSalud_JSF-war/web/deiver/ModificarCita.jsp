<%-- 
    Document   : ModificarCita
    Created on : 05-may-2014, 11:04:28
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Modificar Cita</title>
        <script	type="text/javascript"></script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        <%
            Citas c = (Citas) request.getAttribute("cita");
            
            PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(c.getFecha());
            Integer dia = cal.get(Calendar.DATE);
            Integer mes = cal.get(Calendar.MONTH) + 1;
            Integer anio = cal.get(Calendar.YEAR);
            
            Calendar hor = Calendar.getInstance();
            hor.setTime(c.getIdHora().getHora());
            Integer hr = hor.get(Calendar.HOUR);
            Integer mi = hor.get(Calendar.MINUTE);
            Integer se = hor.get(Calendar.SECOND);
        %>
        
        <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
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
                            <li><a href =" arkadiusz/bienvenido.jsp">Menu de Pacientes</a></li>
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
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        <div id="estate1-box">
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Algo para el administrador</h3>
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
            <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                        <h2>Modificar cita</h2>
                        <div class="property">
                            <div class="property_left">
                                <form method="POST" action="http://localhost:8080/TecnoSalud_JSF-war/modificando">
        
                                    <input type="hidden" value="<%= c.getIdCitas() %>" name="idCita">
                                    <input type="hidden" value="<%= c.getNushaPaciente().getDni() %>" name="idPaciente">
                                    <input type="hidden" value="<%= c.getIdMedicos().getIdMedicos() %>" name="idMedico">
                                    Especialidad: <input type="text" value="<%= c.getIdEspecialidad().getNombre() %>" name="nomEspecialidad"> <br/>
                                    Fecha: <input type="text" value="<%= anio+"-"+mes+"-"+dia  %>" name="fecha"><br/>
                                    Hora: <input type="text" value="<%= hr+":"+mi+":"+se %>" name="hora"><br/>
                                    Médico: <input type="text" value="<%= c.getIdMedicos().getNombre() +" "+ c.getIdMedicos().getApellidos() %>" name="medico"><br/>
                                    Consulta: <input type="text" value="<%= c.getLocalizacion() %>" name="localizacion"><br/><br/>

                                    <input type="submit" value="Enviar" name="Enviar">
                                </form>
                            </div>
                            <div class="clear"></div>
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
