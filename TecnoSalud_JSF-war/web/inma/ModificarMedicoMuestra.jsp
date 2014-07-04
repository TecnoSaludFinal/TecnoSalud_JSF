<%-- 
    Document   : ModificarMedicoMuestra
    Created on : 13-may-2014, 9:58:26
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Roles"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Modificar Medico</title>
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
                     <li><a href="faces/inma/ListadoMensajes.xhtml">Mensajes</a></li>
                            
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
                                <li><a href="faces/inma/ListadoMedicos.xhtml">Listado de Medicos del hospital</a></li>
                                <li><a href="faces/inma/ListadoPA.xhtml">Listado de Personal Administrativo del hospital</a></li>
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
                <div id="topoffers-left-arrow"><a href=""><img src="../estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                     <div id="topoffers-content-box">
                        <div id="estate1-box">
                            <h3>Borrar Médico</h3>
                            <a href="BorrarMedico.jsp"><img src="../estilo/images/borra.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrá borrar el médico seleccionado.</p><br/><br/>
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar Médico</h3>
                            <a href="ConsultarMedico.jsp"><img src="../estilo/images/consultar.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrás consultar los datos personales de medico.</p><br/><br/>
                                
                        </div>
                        <div id="estate3-box">
                            <h3>Crear Médico</h3>
                            <a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoMedico"><img src="estilo/images/crear_nuevo.jpg" width="50px" height="50px" alt="Deluxe Properties" /></a>
                            <p>Pinchando en este enlace podrás dar de alta a un médico nuevo.</p><br/><br/>
                              
                        </div>
                        <div id="estate4-box">
                            <h3>Modificar Médico</h3>
                            <a href="ModificarMedico.jsp"><img src="../estilo/images/modifica.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrá realizar la modificación de los datos personales del médico.</p><br/><br/>
                                
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="../estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div> 
            
            <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                        <h2>Buscar médico</h2>
                        <div class="property">
                            <div class="property_left">
                        
                       
                                      
                                
                                
                    <%
                    Medicos medico = (Medicos) request.getAttribute("m");
                    %>
         
                    <%
                      List<Especialidad> lista_espe = (List <Especialidad>)request.getAttribute("lista_especialidad");
                    %>

                    <%
                      List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
                    %>
     
          <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/ModificarMedicoM" method="post">
                 
                        <legend align= "left">
                                Datos del medico a consultar
                       </legend>
                       <br>
                       ID del médico:
                       <input  name="id_medico" value="<%= medico.getIdMedicos() %>">                        
                       <br><br>
                       DNI del médico:
                       <input  name="dni" value="<%= medico.getDni()%>">                             
                       <br><br>
                       Nombre: 
                       <input  name="nombre" value="<%= medico.getNombre() %>">
                       <br><br>                                  
                       Apellidos:         
                       <input  name="apellidos" value="<%= medico.getApellidos() %>">
                       <br><br>          
                       Contrasena:         
                       <input  name="contrasena" value="<%= medico.getContrasena()%>">
                       <br><br>                        
                       <label for="especialidad">Especialidad</label>
                       <select name ="especialidad" id="especialidad">
                        <%
                        //Recorremos la lista
                        for(int i=0;i<lista_espe.size();i++)
                        {                                  
                            %>
                            <option value="<%= lista_espe.get(i).getIdEspecialidad() %>">
                                <%= lista_espe.get(i).getNombre() %>
                            </option>
                        <%    
                        }
                        %>
            
                </select>
                               
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
                        <br>
                        <br>
                         <%-- Botón Modificar --%>
                         <input type="submit" name="btnModificar" value="Modificar">
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

        
        
        
        
        
        
        
        
        