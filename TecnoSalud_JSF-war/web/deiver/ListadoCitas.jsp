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
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script src="jquery-1.3.2.min.js" type="text/javascript"></script>
        <script>
            
            $(document).ready(function()
            {
                $("#ocultar1").click(function(event)
                {
                    event.preventDefault();
                    $("#capaefectos1").hide("slow");
                });

                $("#mostrar1").click(function(event)
                {
                    event.preventDefault();
                    $("#capaefectos1").show(3000);
                });
            });
        </script>
        
        <script>
            
            $(document).ready(function()
            {
                $("#ocultar2").click(function(event)
                {
                    event.preventDefault();
                    $("#capaefectos2").hide("slow");
                });

                $("#mostrar2").click(function(event)
                {
                    event.preventDefault();
                    $("#capaefectos2").show(3000);
                });
            });
        </script>
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
                        <a href="/TecnoSalud_JSF-war/logoutServlet" id="logout">Salir</a>
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
                        <div id="capaefectos1">
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
                            </div>
                            
                            <br/><br/>
                            
                            <p>
                                <a href="#" id="ocultar1">Ocultar citas</a> | 
                                <a href="#" id="mostrar1">Mostrar citas</a>  
                            </p>
                         <br/>   
                            
                        <h2>Listado de peticiones</h2>
                        <div id="capaefectos2">
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
                        
                        <br/><br/>
                            
                            <p>
                                <a href="#" id="ocultar2">Ocultar peticiones</a> | 
                                <a href="#" id="mostrar2">Mostrar peticiones</a>  
                            </p>
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
