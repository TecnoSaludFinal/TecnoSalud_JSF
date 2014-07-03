<%-- 
    Document   : AnadirCita
    Created on : 13-may-2014, 13:51:29
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Hora"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Añadir Cita</title>
        <script	type="text/javascript">
            function validar(ev)
            {
                var FiltroRx2 = /^\d{4}\-\d{1,2}\-\d{1,2}$/;
                var FiltroRx = /[0-9]/;
                var ok= true;
                var msg = null;
                if(document.form.nuhsa.value === "")
                { //¿Tiene 0 caracteres?
                // formulario.nombre.focus(); // Damos el foco al control
                    msg = "Debes escribir algo en el campo : Nuhsa\n"; //Mostramos el mensaje
                    ok = false;
                }
                else if (!FiltroRx.test(document.form.nuhsa.value))
                {
                    msg = "Solo se aceptan numeros para el campo Nuhsa";
                    ok = false;
                }
                else if (!FiltroRx.test(document.form.medico.value))
                {
                    msg = "Solo se aceptan numeros para el campo Nuhsa";
                    ok = false;
                }
                if(document.form.fecha.value === "")
                { //¿Tiene 0 caracteres?
                    // formulario.nombre.focus(); // Damos el foco al control
                    msg = "Debes escribir algo en el campo : Fecha\n"; //Mostramos el mensaje
                    ok = false;
                }
                else if (!FiltroRx2.test(document.form.fecha.value))
                {
                    msg = "El formato de la fecha no es correcto";
                    ok = false;
                }
                
                
                if (ok===false)
                {
                    alert(msg);
                    return ok;
                }
                //Si ha llegado hasta aquí, es que todo es correcto
            }
        </script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        <%
            List<Especialidad> listaEspe = (List<Especialidad>) request.getAttribute("listaEspe");
            List<Hora> listaHora = (List<Hora>) request.getAttribute("listaHora");
            
            PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
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
                        <h2>Anadir Cita</h2>
                        <div class="property">
                            <div class="property_left">
                                <form name="form" onsubmit="return validar(this)" method="POST" action="http://localhost:8080/TecnoSalud_JSF-war/anadirCita">

                                    Nuhsa Paciente: <input type="text" name="nuhsa" id="campo1"><br/><br/>
                                    Médico: <input type="text" name="medico" id="campo2"><br/><br/>
                                    Fecha: <input type="text" name="fecha"><br/><br/>

                                    Hora: <select name="hora">
                                    <%
                                        for(int i=0;i<listaHora.size();i++)
                                        {
                                            Calendar hor = Calendar.getInstance();
                                            hor.setTime(listaHora.get(i).getHora());
                                            Integer hr = hor.get(Calendar.HOUR);
                                            Integer mi = hor.get(Calendar.MINUTE);
                                            Integer se = hor.get(Calendar.SECOND);
                                    %>

                                    <option value="<%= listaHora.get(i).getIdHora() %>"><%= hr+":"+mi+":"+se %></option>

                                    <%
                                        }
                                    %>
                                    </select> <br/><br/>

                                    Especialidad: <select name="especialidad">
                                    <%
                                        for(int i=0;i<listaEspe.size();i++)
                                        {
                                    %>

                                    <option value="<%= listaEspe.get(i).getNombre() %>"><%= listaEspe.get(i).getNombre() %></option>

                                    <%
                                        }
                                    %>

                                    </select> <br/><br/>

                                    Consulta: <input type="text" name="localizacion"><br/><br/>

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
