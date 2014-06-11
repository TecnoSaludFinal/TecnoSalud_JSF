<%-- 
    Document   : DatosPaciente
    Created on : 29-abr-2014, 18:44:52
    Author     : JoseAntonio
--%>
<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Medicos"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Hora"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.HistorialMedico"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
                        
<%
  	//Obtener el objeto HistorialMedico a partir de la petición (request)
        List<HistorialMedico> historialpaciente = (List<HistorialMedico> ) request.getAttribute("lista");
        String valor = (String) request.getAttribute("valor");
        List<Hora> listaHora = (List<Hora>) request.getAttribute("listaHora");
        String dni= (String) session.getAttribute("dni2");
                    String password = (String) session.getAttribute("password2");
         Integer idRol = (Integer) session.getAttribute("id");
    %>
			
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
                          Pacientes p = (Pacientes) session.getAttribute("entidad");%>
                                <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %>
                         <%} 
                          else if (idRol==2)
                         { 
                              Medicos m = (Medicos) session.getAttribute("entidad");%>
                          
                          <%= m.getNombre() +" "+ m.getApellidos() +" -- "+ m.getIdRol().getTipoRol() %>
                          
                          <%} 
                          else if (idRol==3)
                         { 
                            PersonalAdministrativo ad = (PersonalAdministrativo) session.getAttribute("entidad");%>
                          
                          <%= ad.getNombre() +" "+ ad.getApellidos() +" -- "+ ad.getIdRol().getTipoRol() %>
                          
                          <%} 
                          else if (idRol==4)
                         { 
                              Administrador a = (Administrador) session.getAttribute("entidad");%>
                          
                          <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %>
                          
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
					
						<h2 class="fl">Datos paciente</h2>
											
					  
                                        
                                       
                           <%
                            
                          
                          String nombre = historialpaciente.get(0).getNuhsaPaciente().getNombre();
                          String apellidos = historialpaciente.get(0).getNuhsaPaciente().getApellidos();
                          SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); 
                          String nacimiento = sdf.format(historialpaciente.get(0).getNuhsaPaciente().getFechaNacimiento());
                          String direccion = historialpaciente.get(0).getNuhsaPaciente().getDireccion();
                          Integer NUHSA = historialpaciente.get(0).getNuhsaPaciente().getNuhsa();
                          Integer id = historialpaciente.get(0).getIdHistorial();
                         %>
            <br><br>           
            Nombre: <%=nombre%>
            <br><br>
            Apellidos: <%=apellidos%>
            <br><br>
            Fecha de Nacimiento: <%=nacimiento%>
            <br><br>
            Dirección: <%=direccion%>
            <br><br>
            <u>Historial Medico:</u><br>
            
            <%
            
             for(int i=0;i<historialpaciente.size();i++)
                {         
                          String fecha = sdf.format(historialpaciente.get(i).getFecha());
                          String historial = historialpaciente.get(i).getDescripcion();
                          
                         
              if (valor == "cons")
                 { %>
             <form name="edit" action="http://localhost:8080/TecnoSalud-war/ConsultarHistorialPaciente" method="get">     
            <%-- <fieldset> --%>
             <br><br>
           
            Fecha visita: <%=fecha%><br><br> 
            Diagnostico: <%=historial%> 
            
          
            
      <%--      
	</fieldset>
             </form>
            <br><br>
                            
      --%><%   
                 }  
               
                 } if(valor == "edit")
                         {
                             Medicos m = (Medicos) session.getAttribute("entidad");
                    
                             
              %>
              
              <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/editarHistorialPaciente" method="post">
            
            <% Calendar Cal= Calendar.getInstance(); 
                    String fec= Cal.get(Cal.YEAR)+"-"+(Cal.get(Cal.MONTH)+1)+"-"+Cal.get(Cal.DATE); 
                 %>
            <input type="hidden" name="nuhsaid" value="<%= NUHSA %>">
            <input type="hidden" name="fecha" value="<%= fec %>">
             <%
             for(int i=0;i<historialpaciente.size();i++)
                {
           String historial = historialpaciente.get(i).getDescripcion();%>
                          
            <input type="hidden" name="historial" value="<%= historial %>"
                   <% } %> 
            <input type="hidden" name="medic" value="<%= m.getIdMedicos()%>"
            <input type="hidden" name="especialidad" value="<%= m.getIdEspecialidad()%>"
            <input type="hidden" name="id_historial" value="<%= id %>"
                   
            Numero Seguridad Social:  <%=NUHSA%>
            
            
            Fecha actual: <%=fec%>
            
            <br><br>
            Hora<select name="hora">
            <%
                for(int t=0;t<listaHora.size();t++)
                {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(listaHora.get(t).getHora());
                    Integer hr = cal.get(Calendar.HOUR);
                    Integer mi = cal.get(Calendar.MINUTE);
                    Integer se = cal.get(Calendar.SECOND);                          
            %>
            
            <option value="<%= listaHora.get(t).getIdHora() %>"><%= hr + ":"+mi+":"+se %></option>
            
            <%
                }
            %>
             <br><br>
            Diagnostico: 
            <br><textarea name="diagnostico" rows="10" cols="40" value=""></textarea>
            
               <%-- value="<%= historialpaciente.getDescripcion()%> --%>
               
          <br><br>
            <%-- Botón Actualizar --%>
            <input type="submit" name="btnActualizar" value="Actualizar">
             <br><br>
              </form>
              
              
              <%}
            %>
              
               <br><br>
             
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
