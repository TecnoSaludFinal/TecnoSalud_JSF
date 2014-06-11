<%-- 
    Document   : principal
    Created on : 16-may-2014, 11:19:48
    Author     : Deiver
--%>

<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Pagina principal</title>
        <script	type="text/javascript">	</script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        
        
        <%
            
            Integer id = (Integer) session.getAttribute("id");
            
            if(id == 1)
            {
                Pacientes p = (Pacientes) session.getAttribute("entidad");
        %>
        <h1>Bienvenido: <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %></h1>
        
        <a href="faces/deiver_jsf/pacientePersonal.xhtml">Datos personales</a>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Citas</a>
        
        <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Consultar Historial médico</a>
         <h4>Consulta de Citas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br>
    <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Consultar las citas en una fecha determinada</a> </td> <br>
    <%-- <a href="jose/buscarCitaporfecha.jsp">Consultar las citas en una fecha determinada</a> </td><br>--%>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br>
        <h4>Formularios/Quejas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/listar?do=cons">Crear nuevo formulario (Queja/Sugerencia)</a> </td><br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=personal&perfil=<%=p.getNuhsa()%>">Consultar historial de formularios personales</a> </td>  <br><br>   
        
        
        
        
        
        <%
            }    
            else if(id == 2)
            {
                Medicos m = (Medicos) session.getAttribute("entidad");
        %>
         <h1>Bienvenido: <%= m.getNombre() +" "+ m.getApellidos() +" -- "+ m.getIdRol().getTipoRol() %></h1>
         
        

        <a href =" faces/jose/ConsultarPerfil.xhtml">Datos personales</a></td><br>
        <a href =" faces/jose/CrearSolicitud.xhtml">Crear solicitud cambios de datos</a></td><br>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Consultar Historial médico</a></td><br>

      
       <h4>Consulta de Citas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Consultar las citas en una fecha determinada</a> </td> <br>

        <%
            }
            else if(id == 3)
            {
                PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
        <h1>Bienvenido: <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %></h1>
        
        <a href="datosPersonales.jsp">Datos personales</a>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Citas</a>
        
         <h4>Consulta de Citas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Consultar las citas en una fecha determinada</a> </td> <br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=paci">Consultar las citas por paciente</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi">Consultar las citas por medico</a> </td> <br><br>
        
        <h4>Consulta de Pacientes</h4>
            <a href="arkadiusz/bienvenido.jsp">Menú de Pacientes</a> </td> <br><br>
        
        <%
            }
            else
            {
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
                    <ul class="navlist"> 
                            <li>
                                <a href="principal.jsp"> <%--id="current"--%>
                                    INICIO
                                </a>
                            </li>
                            <li>
                                CITAS
                                <ul>
                                    <li><a href="http://localhost:8080/TecnoSalud_JSFl-war/ConsultarListadoCitas?do=all">
                                    Consultar citas de hoy
                                    </a>
                                    </li>                                
                                    <li><a href="jose/buscarCitaporfecha.jsp">
                                    Consultar citas de una fecha determinada
                                    </a>
                                    </li>
                                    <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">
                                    Consultar citas pasadas
                                    </a>
                                    </li>
                                    <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">
                                    Consultar citas próxima
                                    </a>
                                    </li>
                                    <li><a href="jose/buscarCitaporpaciente.jsp">
                                    Consultar citas por paciente
                                    </a>
                                    </li>
                                    <li><a href="jose/buscarCitapormedico.jsp">
                                    Consultar citas por médico
                                    </a>
                                    </li>
                                </ul>
                            <li><a href="ListadoMensajes.xhtml">MENSAJES</a>
                            </li>
                            <li>
                                FORMULARIOS
                                <ul>
                                <li><a href="jose/especifico.jsp">
                                    Consultar formularios de paciente especifico
                                    </a>
                                </li>
                                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=all">
                                    Consultar todos los formularios recibidos
                                    </a>
                                </li>
                                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=quejas">
                                    Consultar los formularios de quejas
                                    </a>
                                </li>
                                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=sug">
                                    Consultar los formularios de sugerencias
                                    </a>
                                </li>
                                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=feli">
                                    Consultar los formularios de felicitaciones
                                    </a>
                                </li>                               
                                </ul>
                            </li>
                            <li>
                                LISTADOS
                                <ul>
                                <li><a href="face/inma/ListadoMedicos.xhtml">
                                    Listado de Medicos del hospital
                                    </a>
                                </li>
                                <li><a href="face/inma/ListadoPA.xhtml">
                                    Listado de Personal Administrativo del hospital
                                    </a>
                                </li>
                                </ul>
                            </li>                            
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
                            <h3>Consultar Personal Administrativo</h3>
                            <img src="estilo/images/consultar.jpg" alt="Commercial Properties" />
                            <p>A través de este enlace podrá realizar la consulta de los datos personales del personal
                                administrativo del hospital.<br/><br/>
                                <a href="inma/ConsultarPersonalAdmin.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar Médico</h3>
                            <img src="estilo/images/consultar.jpg" alt="Commercial Properties" />
                            <p>A través de este enlace podrá realizar la consulta de los datos personales del médico 
                                seleccionado.<br/><br/>
                                <a href="inma/ConsultarMedico.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Crear Médico</h3>
                            <img src="estilo/images/crear_nuevo.jpg" alt="Deluxe Properties" />
                            <p>Pinchando en este enlace podrá crear un médico nuevo<br/><br/><br/><br/>
                                <a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoMedico">Ir ...</a></p>
                        </div>
                        <div id="estate4-box">
                             <h3>Crear P. Administrativo</h3>
                            <img src="estilo/images/crear_nuevo.jpg" alt="Commercial Properties" />
                            <p>Aenlace podrá dar de alta a personal administrativo nuevo del hospital.<br/><br/>
                                <a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoPersonalAdmin">Ir ...</a></p>
                            
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
                    
                            <div class="clear"></div>
                </div>    
                               
            </div>
            </div>
           
        <br><br> 
         <div id="pravy-stlpec-box">
                <div id="pravy-stlpec">
                    <div id="find_property">
                        <form id="form_163050" class="appnitro"  method="post" action="#">
                            <h2>Buscar citas por...</h2>
                            <div>
                                    <label class="description" for="element_1">Día </label>
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
		<p><strong>Admin Principal</strong> theme by TecnoSalud </p>
	</div> <!-- end footer -->
    </body>
</html>












<<<<<<< HEAD
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Consultar las citas en una fecha determinada</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=paci">Consultar las citas por paciente</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi">Consultar las citas por medico</a> </td> <br><br>
           
            
=======


>>>>>>> e3760d3f266b8387c0769d479d7c19752132d6b3


        <%
            }
        %>
        
    </body>
</html>
