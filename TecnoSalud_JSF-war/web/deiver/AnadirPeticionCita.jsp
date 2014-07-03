<%-- 
    Document   : AnadirCita
    Created on : 05-may-2014, 11:04:09
    Author     : Deiver
--%>

<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Hora"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.TipoCita"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Solicitar cita</title>
        <script	type="text/javascript">
            function validar(ev)
            {
                var FiltroRx2 = /^\d{4}\-\d{1,2}\-\d{1,2}$/;
                var ok= true;
                var msg = null;
                
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
            List<TipoCita> lista_tc = (List<TipoCita>) request.getAttribute("lista_tc");
            List<Hora> lista_hora = (List<Hora>) request.getAttribute("lista_hora");
            
            Pacientes p = (Pacientes) session.getAttribute("entidad");
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
                            <li> <a href="faces/deiver_jsf/pacientePersonal.xhtml">Datos personales</a></li>
                        </ul>
                    </li>
                    <li><a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Historial Médico</a></li>
                    <li>
                        <a href="#"> Consulta de Citas </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Gestión citas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Citas para hoy</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Buscar por próximas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Buscar por pasadas</a> </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"> Formularios/Quejas </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listar?do=cons">Nuevo formulario)</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=personal&perfil=<%=p.getNuhsa()%>">Historial formulario personales</a> </li>   
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %>
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
            <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                        <h2>Anadir petición cita</h2>
                        <div class="property">
                            <div class="property_left">
                                <form name="form" onsubmit="return validar(this)" method="POST" action="http://localhost:8080/TecnoSalud_JSF-war/peticion">

                                    Tipo de solicitud: <select name="cita">
                                    <%
                                        for(int i=0;i<lista_tc.size();i++)
                                        {
                                    %>

                                    <option value="<%= lista_tc.get(i).getNombre() %>"><%= lista_tc.get(i).getNombre() %></option>

                                    <%
                                        }
                                    %>

                                    </select> <br/>
                                    Fecha (AAAA-MM-DD): <input type="text" name="fecha"><br/>
                                    
                                    Hora: <select name="hora">
                                    <%
                                        for(int i=0;i<lista_hora.size();i++)
                                        {
                                            Calendar hor = Calendar.getInstance();
                                            hor.setTime(lista_hora.get(i).getHora());
                                            Integer hr = hor.get(Calendar.HOUR);
                                            Integer mi = hor.get(Calendar.MINUTE);
                                            Integer se = hor.get(Calendar.SECOND);
                                    %>

                                    <option value="<%= lista_hora.get(i).getIdHora() %>"><%= hr+":"+mi+":"+se %></option>

                                    <%
                                        }
                                    %>

                                    </select> <br/>
                                    Comentario: <br/>
                                    <textarea rows="4" cols="50" type="text" name="comentario"></textarea><br/><br/>
                                    <br/><br/>
                                    <input type="submit" value="Enviar" name="Enviar">
                                </form>
                            </div>
                            <div class="clear"></div>
                        </div>    
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
