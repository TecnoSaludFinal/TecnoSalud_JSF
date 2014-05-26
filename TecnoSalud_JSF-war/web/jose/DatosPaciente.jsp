<%-- 
    Document   : DatosPaciente
    Created on : 29-abr-2014, 18:44:52
    Author     : JoseAntonio
--%>
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
 <meta charset="utf-8">
	<title>TECNOSALUD</title>
	
	
    </head>
    <body>
        <a href="http://localhost:8080/TecnoSalud_Final-war/logoutServlet"> Salida </a>
        
                          <h3 class="fl">Datos Pacientes</h3>
                        
<%
  	//Obtener el objeto HistorialMedico a partir de la petición (request)
        List<HistorialMedico> historialpaciente = (List<HistorialMedico> ) request.getAttribute("lista");
        String valor = (String) request.getAttribute("valor");
        List<Hora> listaHora = (List<Hora>) request.getAttribute("listaHora");
        String dni= (String) session.getAttribute("dni2");
                    String password = (String) session.getAttribute("password2");
        
    %>
			
                        </div>

		</div> <!-- end full-width -->	
	
	</div> <!-- end top-bar -->
	
	<!-- MAIN CONTENT -->
	<div id="content">
		
		<div class="page-full-width cf">

			<div class="side-menu fl">
				
				
				
			</div> <!-- end side-menu -->
                        <div class="side-content fr">
			
				<div class="content-module">
				
					<div class="content-module-heading cf">
					
						<h3 class="fl">Datos paciente</h3>
											
					</div> <!-- end content-module-heading -->  
                                        
                                       
                           <%
                            
                          for(int i=0;i<historialpaciente.size();i++)
                {
                          String nombre = historialpaciente.get(i).getNuhsaPaciente().getNombre();
                          String apellidos = historialpaciente.get(i).getNuhsaPaciente().getApellidos();
                          SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); 
                          String nacimiento = sdf.format(historialpaciente.get(i).getNuhsaPaciente().getFechaNacimiento());
                          String direccion = historialpaciente.get(i).getNuhsaPaciente().getDireccion();
                          String historial = historialpaciente.get(i).getDescripcion();
                          Integer NUHSA = historialpaciente.get(i).getNuhsaPaciente().getNuhsa();
                          Integer id = historialpaciente.get(i).getIdHistorial();
                    
                 
                 if (valor == "cons")
                 { %>
             <form name="edit" action="http://localhost:8080/TecnoSalud-war/ConsultarHistorialPaciente" method="get">     
             <fieldset> 
            
            <legend align= "center">Historial paciente</legend>
            Nombre: <%=nombre%>
            <br><br>
            Apellidos: <%=apellidos%>
            <br><br>
            Fecha de Nacimiento: <%=nacimiento%>
            <br><br>
            Dirección: <%=direccion%>
            <br><br>
            Historial Medico <%=historial%>
            <br><br>
          <input type="submit" name="btnVolver" value="Volver">
            
	</fieldset>
             </form>
            <br><br>
                            
           
            <%  
                 } if(valor == "edit")
                         {
                             Medicos m = (Medicos) session.getAttribute("entidad");
                    Integer idRol = (Integer) session.getAttribute("id");
                             
              %>
              
               <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/editarHistorialPaciente" method="post">
              <fieldset> 
            <legend align= "center">Historial paciente</legend>
            <% Calendar Cal= Calendar.getInstance(); 
                    String fec= Cal.get(Cal.YEAR)+"-"+(Cal.get(Cal.MONTH)+1)+"-"+Cal.get(Cal.DATE); 
                 %>
            <input type="hidden" name="nuhsaid" value="<%= NUHSA %>">
            <input type="hidden" name="fecha" value="<%= fec %>">
            <input type="hidden" name="historial" value="<%= historial %>"
            <input type="hidden" name="medic" value="<%= m.getIdMedicos()%>"
            <input type="hidden" name="especialidad" value="1"
            <input type="hidden" name="id_historial" value="<%= id %>"
                   
            Numero Seguridad Social:  <%=NUHSA%>
            
            <br><br>
            Nombre: <%=nombre%>
            
            <br><br>
            Apellidos: <%=apellidos%>
            <br><br>
            Fecha de Nacimiento: <%=nacimiento%>
            <br><br>
            Dirección: <%=direccion%>
            <br><br>
             Historial Medico:  <%=historial%>
            <br><br>
             
            Fecha actual: <%=fec%>
            
            <br><br>
            Hora<select name="hora">
            <%
                for(int t=0;t<listaHora.size();t++)
                {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(listaHora.get(i).getHora());
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
	</fieldset>
            
              </form>
              
              
              
              
               <%   
                 }  }
              %>
       
    </body>
</html>

