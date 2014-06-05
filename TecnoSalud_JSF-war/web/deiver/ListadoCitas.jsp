<%-- 
    Document   : ListadoCitas
    Created on : 05-may-2014, 11:03:34
    Author     : Deiver
--%>

<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.PeticionCita"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Listado citas</title>
        <script	type="text/javascript">	</script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        <%
            List<Citas> citas = (List<Citas>) request.getAttribute("citas");
            List<PeticionCita> pc = (List<PeticionCita>) request.getAttribute("petCitas");
            
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
                        <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %>
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
                        <h2>Listado de citas</h2>
                        
                            <table border="1">
                                <tr>
                                    <td><b>Médico</b></td>
                                    <td><b>Localización</b></td>
                                    <td><b>Fecha</b></td>
                                    <td><b>Hora</b></td>
                                    <td><b>Especialización</b></td>
                                </tr>
            
                                <%
                                    for(int i=0;i<citas.size();i++)
                                    {
                                        Calendar cal = Calendar.getInstance();
                                        cal.setTime(citas.get(i).getFecha());
                                        Integer dia = cal.get(Calendar.DATE);
                                        Integer mes = cal.get(Calendar.MONTH) + 1;
                                        Integer anio = cal.get(Calendar.YEAR);

                                        Calendar hor = Calendar.getInstance();
                                        hor.setTime(citas.get(i).getIdHora().getHora());
                                        Integer hr = hor.get(Calendar.HOUR);
                                        Integer mi = hor.get(Calendar.MINUTE);
                                        Integer se = hor.get(Calendar.SECOND);
                                %>
            
                                <div class="property">
                                    <div class="property_left">
                                        <tr>
                                            <td><%= citas.get(i).getIdMedicos().getNombre() +" "+ citas.get(i).getIdMedicos().getApellidos() %></td>
                                            <td><%= citas.get(i).getLocalizacion() %></td>
                                            <td><%= dia+"-"+mes+"-"+anio %></td>
                                            <td><%= hr+":"+mi+":"+se %></td>
                                            <td><%= citas.get(i).getIdEspecialidad().getNombre() %></td>
                                        </tr>
                                    </div>
                                    <div class="clear"></div>
                                </div>    
                                <%
                                    }
                                %>
                            </table>
                            <br/><br/>
                        <h2>Listado de peticiones</h2>
                        
                        <%
                            if(!pc.isEmpty())
                            {
                        %>
                            <table border="1">
                                <tr>
                                    <td><b>Paciente</b></td>
                                    <td><b>Tipo</b></td>
                                    <td><b>Fecha</b></td>
                                    <td><b>Hora</b></td>
                                    <td><b>Comentario</b></td>
                                    <td><b>Eliminar</b></td>
                                    <td><b>Modificar</b></td>
                                    <td><b>Crear cita</b></td>
                                </tr>
            
                                <%
                                    for(int i=0;i<pc.size();i++)
                                    {
                                        Calendar hor = Calendar.getInstance();
                                        hor.setTime(pc.get(i).getIdHora().getHora());
                                        Integer hr = hor.get(Calendar.HOUR);
                                        Integer mi = hor.get(Calendar.MINUTE);
                                        Integer se = hor.get(Calendar.SECOND);
                                        
                                        Calendar cal = Calendar.getInstance();
                                        cal.setTime(pc.get(i).getFecha());
                                        Integer dia = cal.get(Calendar.DATE);
                                        Integer mes = cal.get(Calendar.MONTH) + 1;
                                        Integer anio = cal.get(Calendar.YEAR);
                                %>
            
                                <div class="property">
                                    <div class="property_left">
                                        <tr>
                                            <td><%= pc.get(i).getNuhsaPaciente().getNombre() +" "+ pc.get(i).getNuhsaPaciente().getApellidos() %></td>
                                            <td><%= pc.get(i).getIdTipo().getNombre() %></td>
                                            <td><%= dia+"-"+mes+"-"+anio %></td>
                                            <td><%= hr+":"+mi+":"+se %></td>
                                            <td><%= pc.get(i).getComentario() %></td>
                                            <td><a href="eliminarPeticion?id=<%= pc.get(i).getIdPeticion() %>">Delete</a></td>
                                            <td><a href="modificarPeticion?id=<%= pc.get(i).getIdPeticion() %>">Modify</a></td>

                                            <%
                                                }
                                            %>
                                        </tr>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </table>
                        <%
                            }else
                            {
                        %>
                                <h3>No hay datos que mostrar</h3>
                        <%
                            }
                        %>
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
            
        </div>
        <div class="clear"></div>
        <!-- footer -->
		<div id="footer">
			<p>M&aacute;s <a href="http://www.mejoresplantillasgratis.es" title="MPG - plantillas web y plantillas Flash" target="_blank">Plantillas Web Gratis</a> en MPG.</p>
			<p><a href="http://www.x-reality.sk">xreality</a></p>
		</div>
    </body>
</html>
