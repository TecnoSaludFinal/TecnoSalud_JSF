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
                    <ul id="navlist">
                            <li id="active"><a href="#" id="current">INICIO</a></li>
                            <li><a href="#">CITAS</a></li>
                            <li><a href="#">MENSAJES</a></li>
                            <li><a href="#">FORMULARIOS</a></li>
                            <li><a href="#">LISTADOS</a></li>
                    </ul>
            </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %>
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
            <div id="pravy-stlpec-box">
                <div id="pravy-stlpec">
                    <div id="find_property">
                        <form id="form_163050" class="appnitro"  method="post" action="#">
                            <h2>Buscar por...</h2>
                            <div>
                                    <label class="description" for="element_1">Country </label>
                            </div>
                            <div>
                                    <select class="element select medium" id="element_1" name="element_1">
                                            <option value="1" selected="selected">- Select -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_2">City </label>  
                            </div>
                            <div>
                                    <select class="element select medium" id="element_2" name="element_2">
                                            <option value="1" selected="selected">- Select -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_3">Zip code </label>
                            </div>
                            <div>
                                    <select class="element select medium" id="element_3" name="element_3">
                                            <option value="1" selected="selected">- Select -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_4">Price </label>
                            </div>
                            <div>
                                    <select class="element select small" id="element_4" name="element_4">
                                            <option value="1" selected="selected">- Min -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_5">Price </label>
                            </div>
                            <div>
                                    <select class="element select small" id="element_5" name="element_5">
                                            <option value="1" selected="selected">- Max -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_6">Bedrooms </label>
                            </div>
                            <div>
                                    <select class="element select small" id="element_6" name="element_6">
                                            <option value="1" selected="selected">2</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
                            </div>
                        </form>
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
