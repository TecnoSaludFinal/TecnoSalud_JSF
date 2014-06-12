<%-- 
    Document   : ModificarPersonalAdminMuestra
    Created on : 13-may-2014, 13:41:25
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Roles"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Modificar datos de personal</title>
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
                   
                    <ul class="mi-menu">
                        <li><a href="principal.jsp"> Inicio </a></li>
                     
                             <li>
                            <a href="#"> Citas </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Gestión citas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Buscar para hoy</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Buscar próximas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Buscar pasadas</a> </li>
                            <li> <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=paci">Buscar por paciente</a> </li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi">Buscar por médico</a> </li>
                        
                            </ul>
                     </li>
                     <li><a href="ListadoMensajes.xhtml">Mensajes</a>
                            
                            <li>
                        <a href="#"> Formularios </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=all">Consultar todos los formularios recibidos</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=quejas">Consultar los formularios de quejas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=sug">Consultar los formularios de sugerencias</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=feli">Consultar los formularios de felicitaciones</a></li>                               
                        
                            </ul>
                      </li>
                            <li>
                            <a href="#">Listados</a>
                                <ul>
                                <li><a href="face/inma/ListadoMedicos.xhtml">Listado de Medicos del hospital</a></li>
                                <li><a href="face/inma/ListadoPA.xhtml">Listado de Personal Administrativo del hospital</a></li>
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
                            <a href="BorrarPersonalAdmin.jsp"><img src="estilo/images/borra.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrá borrar el personal seleccionado.</p><br/><br/>
                               
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar P. Administrativo</h3>
                            <a href="inma/ConsultarPersonalAdmin.jsp"><img src="estilo/images/consultar.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrás consultar los datos personales del personal seleccionado.</p><br/><br/>
                               
                        </div>
                        <div id="estate3-box">
                            <h3>Crear P. Administrativo</h3>
                            <a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoPersonalAdmin"><img src="estilo/images/crear_nuevo.jpg" width="50px" height="50px" alt="Deluxe Properties" /></a>
                            <p>Pinchando en este enlace podrás dar de alta a un personal administrativo nuevo.</p><br/><br/>
                               
                        </div>
                        <div id="estate4-box">
                            <h3>Modificar P. Administrativo</h3>
                            <a href="inma/ModificarMedico.jsp"><img src="estilo/images/modifica.jpg" width="50px" height="50px" alt="Deluxe Properties" /></a>
                            <p>Pinchando en este enlace podrá modificar los datos del usuario.</p><br/><br/>
                               
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
                        <h2>Modificar Personal Administrativo</h2>
                        <div class="property">
                            <div class="property_left">
                        
                                         <%
                                                    PersonalAdministrativo pa = (PersonalAdministrativo) request.getAttribute("m");
                                         %>


                                        <%
                                            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
                                        %>

                                          <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/ModificarPersonalAdminM" method="post">
                                                
                                                        <legend align= "left">
                                                                Datos del personal a modificar
                                                       </legend>
                                                       <br>
                                                       ID del personal:
                                                       <input  name="id_padmin" value="<%= pa.getIdPersonalAdmin() %>">                        
                                                       <br><br>
                                                       DNI:
                                                       <input  name="dni" value="<%= pa.getDni()%>">                             
                                                       <br><br>
                                                       Nombre: 
                                                       <input  name="nombre" value="<%= pa.getNombre() %>">
                                                       <br><br>                                  
                                                       Apellidos:         
                                                       <input  name="apellidos" value="<%= pa.getApellidos() %>">
                                                       <br><br>          
                                                       Contrasena:         
                                                       <input  name="contrasena" value="<%= pa.getContrasena()%>">
                                                       <br><br>             
                                                        <label for="rol">Rol</label>
                                                        <select name ="rol" id="rol">
                                                                <%
                                                                //Recorremos la lista
                                                                for(int i=0;i<lista_rol.size();i++)
                                                                {                                  
                                                                    %>
                                                                    <option value="<%= lista_rol.get(i).getIdRol() %>">
                                                                        <%= lista_rol.get(i).getTipoRol()  %>
                                                                    </option>
                                                                <%    
                                                                }
                                                                %>

                                                        </select> 


                                               
                                                                <br><br>
                                                        <%-- Botón buscar --%>
                                            <input type="submit" name="btnModificar" value="Modificar"> 

                                          </form>
                            </div>
                            <div class="clear"></div>
                        </div>    
                               
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
        
        
        
        
        
        
        
        
        
        
        