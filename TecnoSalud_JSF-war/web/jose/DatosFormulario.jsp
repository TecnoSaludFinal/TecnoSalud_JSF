<%-- 
    Document   : DatosFormulario
    Created on : 14-may-2014, 22:37:31
    Author     : JoseAntonio
--%>
<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.entity.Formulario"%>
<%@page import="java.util.List"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>DATOS PACIENTE</title>
        <script	type="text/javascript">	</script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        									
					 
<% //HistorialMedico lista = (HistorialMedico)request.getAttribute("lista");
                     List<Formulario> listaFormulario = (List<Formulario> ) request.getAttribute("lista");
        String valor = (String) request.getAttribute("valor");
     
        String dni= (String) session.getAttribute("dni2");
        String password = (String) session.getAttribute("password2");
        Integer idRol = (Integer) session.getAttribute("id");
        for(int i=0;i<listaFormulario.size();i++)
                {
                          Integer Referencia = listaFormulario.get(i).getIdFormulario();
                          String Tipo = listaFormulario.get(i).getIdTipoform().getTipo();
                          SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); 
                          String Fecha = sdf.format(listaFormulario.get(i).getFecha());
                          String Comentario = listaFormulario.get(i).getComentario();
                          Integer nuhsa = listaFormulario.get(i).getNuhsaPaciente().getNuhsa();
                          String nombre = listaFormulario.get(i).getNuhsaPaciente().getNombre();
                          String apellidos = listaFormulario.get(i).getNuhsaPaciente().getApellidos();
                            
                 if (valor == "cons")
                 { %>    
    <!-- navigation --> 
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
                        
                        
                          <% if (idRol==1)
                          {
                              Pacientes p = (Pacientes) session.getAttribute("entidad");
                              %>
                                <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %>
                         <%} 
                          else if (idRol==2)
                         { 
                              Administrador m = (Administrador) session.getAttribute("entidad");%>
                          
                          <%= m.getNombre() +" "+ m.getApellidos() +" -- "+ m.getIdRol().getTipoRol() %>
                          
                          <%} %>
                        
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
                            <h3>Consultar historial paciente</h3>
                            <img src="estilo/images/temp_estate.jpg" alt="Commercial Properties" />
                            <p>Pinchando en este enlace podrás consultar el historial personal de un paciente.<br/><br/>
                                <%--AQUI PONGO LA DIRRECCION--%>
                                <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Abrir</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Mostrar citas de hoy</h3>
                            <img src="estilo/images/temp_estate.jpg" alt="Deluxe Properties" />
                            <p>Si quieres ver las citas que tienes para el día de hoy<br/><br/><br/><br/>
                                <a href="ConsultarListadoCitas?do=all">Abrir</a></p>
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
					
                        
                        
                        <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/jose/ConsultarFormulario.jsp" method="POST">     
            <div class="property">
                  <div class="property_left">
            <br>                    
            <h2 class="fl">Datos formulario</h2>
            </div>
                <div class="clear"></div>
                   </div> 
            <br><br>
            Referencia Sugerencia: <%=Referencia%>
            <br><br>
            Tipo de Formulario: <%=Tipo%>
            <br><br>
            Numero Seguridad Social:   <%=nuhsa%>
            <br><br>
            Paciente:  <%=nombre + " " + apellidos%>
            <br><br>
            Fecha: <%=Fecha%>
            <br><br>
            Descripción:  <%=Comentario%>
            <br><br>
           
           
          <input type="submit" name="btnVolver" value="Volver">
            
	
             </form>
            <br><br>
            <%  
                 } 
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
