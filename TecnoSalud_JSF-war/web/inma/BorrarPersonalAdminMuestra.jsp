<%-- 
    Document   : BorrarPersonalAdminMuestra
    Created on : 13-may-2014, 13:39:08
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Eliminar personal</title>
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
                            <li><a href="faces/inma/ListadoMensajes.xhtml">MENSAJES</a>
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
                                <li><a href="faces/inma/ListadoMedicos.xhtml">
                                    Listado de Medicos del hospital
                                    </a>
                                </li>
                                <li><a href="faces/inma/ListadoPA.xhtml">
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
                            <h3>Borrar P. Administrativo</h3>
                            <img src="../estilo/images/borra.jpg" alt="Commercial Properties" />
                            <p>A través de este enlace podrá eliminar el usuario elegido.<br/><br/>
                                <a href="inma/BorrarPersonalAdmin.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar P. Administrativo</h3>
                            <img src="../estilo/images/consultar.jpg" alt="Commercial Properties" />
                            <p>A través de este enlace podrá realizar la consulta de los datos personales del personla 
                                seleccionado.<br/><br/>
                                <a href="inma/ConsultarPersonalAdmin.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Crear P. Administrativo</h3>
                            <img src="../estilo/images/crear_nuevo.jpg" alt="Deluxe Properties" />
                            <p>Pinchando en este enlace podrá crear un personal nuevo<br/><br/><br/><br/>
                                <a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoPersonalAdmin">Ir ...</a></p>
                        </div>
                        <div id="estate4-box">
                            <h3>Modificar P. Administrativo</h3>
                            <img src="../estilo/images/modifica.jpg" alt="Deluxe Properties" />
                            <p>Pinchando en este enlace podrá modificar los datos del usuario<br/><br/><br/><br/>
                                <a href="inma/ModificarMedico.jsp">Ir ...</a></p>
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
                        <h2>Datos del Personal Administrativo</h2>
                        <div class="property">
                            <div class="property_left">
                        
                        <%
                              PersonalAdministrativo padmin = (PersonalAdministrativo) request.getAttribute("m");
                        %>
                    
                      <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/BorraDefinitivoServlet" method="post">    
                        <legend align= "left">
                                Datos del personal a borrar
                       </legend>
                       <br>
                       Identificador del personal:
                       <input  name="id_personal_admin" value="<%= padmin.getIdPersonalAdmin()  %>">                             
                       <br><br>
                       Nombre: 
                       <input  name="nombre" value="<%= padmin.getNombre() %>  ">
                       <br><br>                                  
                       Apellidos:         
                       <input  name="Apellidos" value="<%= padmin.getApellidos() %> ">
                       <br><br> 
                       Contrasena:           
                       <input  name="Contrasena" value=" <%= padmin.getContrasena() %> ">        
                       <br><br>
                       Email:           
                       <input  name="Email" value=" <%= padmin.getEmail() %> ">        
                       <br><br>   
                       DNI:           
                       <input  name="Dni" value=" <%= padmin.getDni() %> ">        
                       <br><br>
                       Rol:           
                       <input  name="Rol" value=" <%= padmin.getIdRol().getTipoRol() %> ">        
                       <br><br>
            
             <%-- Boton  --%>               
            <input type="submit" value="Borrar" name="Borrar">              
            <br>  
                        </form>
                            </div>
                            <div class="clear"></div>
                        </div>    
                               
                    </div>
                </div>
            </div>

        <br><br> 
        
	</div>
        <div class="clear"></div>
        <!-- footer -->
		<div id="footer">
		<p><strong>Admin Principal</strong> theme by TecnoSalud </p>
	</div> <!-- end footer -->
    </body>
</html>
        
