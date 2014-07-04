<%-- 
    Document   : NuevoMedico
    Created on : 08-may-2014, 12:34:48
    Author     : Inma
--%>


<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Roles"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="app.entity.Medicos"%>
<%@page import="java.util.List"%>
<%@page language="java"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>

<!DOCTYPE html>
<html>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
	<title>Crear Medico Nuevo</title>
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
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                     <div id="topoffers-content-box">
                        <div id="estate1-box">
                            <h3>Borrar Médico</h3>
                            <a href="BorrarMedico.jsp"><img src="estilo/images/borra.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrá borrar el médico seleccionado.</p><br/><br/>
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar Médico</h3>
                            <a href="ConsultarMedico.jsp"><img src="estilo/images/consultar.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrás consultar los datos personales de medico.</p><br/><br/>
                                
                        </div>
                        <div id="estate3-box">
                            <h3>Crear Médico</h3>
                            <a href="http://localhost:8080/TecnoSalud_JSF-war/NuevoMedico"><img src="estilo/images/crear_nuevo.jpg" width="50px" height="50px" alt="Deluxe Properties" /></a>
                            <p>Pinchando en este enlace podrás dar de alta a un médico nuevo.</p><br/><br/>
                              
                        </div>
                        <div id="estate4-box">
                            <h3>Modificar Médico</h3>
                            <a href="ModificarMedico.jsp"><img src="estilo/images/modifica.jpg" width="50px" height="50px" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrá realizar la modificación de los datos personales del médico.</p><br/><br/>
                                
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
                        <h2>Crear médico</h2>
                        <div class="property">
                            <div class="property_left">
                        <%
                            List<Especialidad> lista_espe = (List <Especialidad>)request.getAttribute("lista_especialidad");
                        %>

                        <%--
                            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
                        --%>
											
	 
                        <form method="post" action="http://localhost:8080/TecnoSalud_JSF-war/NuevoMedicoM" name="datos" onblur="nif(this.value)">
                           

                                <%-- Datos del nuevo medico a crear --%>    

                                <label for="dni_m">DNI</label>
                                <input name="dni" id="dni" type="text">
                                <br><br>

                                <label for="nombre">Nombre</label>
                                <input name="nombre" id="nombre" type="text">
                                <br><br>

                                <label for="apellidos">Apellidos</label>
                                <input name ="apellidos" id="apellidos" type="text">
                                <br><br>           

                                <label for="contrasena">Contrasena</label>
                                <input name ="contrasena" id="contrasena" type="text">
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

                        <%-- Boton Crear Medico Nuevo --%>    

                        <input type="submit" value="Enviar" name="Enviar">

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
        
        


<script type="text/javascript">
   
function nif(dni) 
{
  numero = dni.substr(0,dni.length-1);
  let = dni.substr(dni.length-1,1);
  numero = numero % 23;
  letra='TRWAGMYFPDXBNJZSQVHLCKET';
  letra=letra.substring(numero,numero+1);
  if (letra!=let) 
    alert('Dni erroneo');
}
</script>