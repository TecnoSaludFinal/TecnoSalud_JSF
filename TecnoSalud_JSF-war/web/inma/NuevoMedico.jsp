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
        <link rel="stylesheet" href="../estilo/style.css">
	  
	
    </head>
    <body>
         <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
    
      <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="../estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
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
                                    Consultar citas pr�xima
                                    </a>
                                    </li>
                                    <li><a href="jose/buscarCitaporpaciente.jsp">
                                    Consultar citas por paciente
                                    </a>
                                    </li>
                                    <li><a href="jose/buscarCitapormedico.jsp">
                                    Consultar citas por m�dico
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
                <div id="topoffers-left-arrow"><a href=""><img src="../estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        <div id="estate1-box">
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar M�dico</h3>
                            <img src="../estilo/images/consultar.jpg" alt="Commercial Properties" />
                            <p>A trav�s de este enlace podr� realizar la consulta de los datos personales del m�dico 
                                seleccionado.<br/><br/>
                                <a href="ConsultarMedico.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Crear M�dico</h3>
                            <img src="../estilo/images/crear_nuevo.jpg" alt="Deluxe Properties" />
                            <p>Pinchando en este enlace podr� crear un m�dico nuevo<br/><br/><br/><br/>
                                <a href="NuevoMedico.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate4-box">
                            
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
                        <h2>Crear m�dico</h2>
                        <div class="property">
                            <div class="property_left">
                        <%
                            List<Especialidad> lista_espe = (List <Especialidad>)request.getAttribute("lista_especialidad");
                        %>

                        <%
                            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
                        %>
											
	 
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
         <div id="pravy-stlpec-box">
                <div id="pravy-stlpec">
                    <div id="find_property">
                        <form id="form_163050" class="appnitro"  method="post" action="#">
                            <h2>Buscar citas por...</h2>
                            <div>
                                    <label class="description" for="element_1">D�a </label>
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