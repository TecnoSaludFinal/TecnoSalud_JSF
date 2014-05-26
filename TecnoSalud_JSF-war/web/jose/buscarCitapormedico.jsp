<%-- 
    Document   : buscarporpaciente
    Created on : 15-may-2014, 2:49:56
    Author     : JoseAntonio
--%>

<%@page import="app.entity.Medicos"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.entity.Citas"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
 <meta charset="utf-8">
	<title>TECNOSALUD</title>
	
	
    </head>
    <body>
             <a href="http://localhost:8080/TecnoSalud_Final-war/logoutServlet"> Salida </a>
					
						<h3 class="fl">Busqueda por medico</h3>
											
					

            <% 
                
                List<Citas> listaCitas = (List<Citas>) request.getAttribute("listaCitas");
                List<Medicos> listaMedico = (List<Medicos>) request.getAttribute("listaMedico");
                String valor = (String) request.getAttribute("valor");
                String dni= (String) session.getAttribute("dni2");
                    String password = (String) session.getAttribute("password2");
                if(listaCitas==null && listaMedico == null)
                {
                %>
            <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ConsultarListadoCitas?do=medi" method="post">
            <%-- Datos del paciente a buscar --%>
           <fieldset>   
               
            <label> Introduzca los datos del médico:</label> 
            <br><br>
            
            <label for="ss"> Apellidos</label>
            <input type="text" name="apellidos" value="">
           
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">
	</fieldset>

            </form>
           
            <%}else if (listaMedico != null)
                {%>
                <table border="1">
                        <tr>
                          <td><strong>Nº Colegiado</strong></td>
                          <td><strong>Medico</strong></td>
                          <td><strong>Especialidad</strong></td>
                                                  </tr>  
                        
                        <%
                for(int i=0;i<listaMedico.size();i++)
                { %>
 
                         <td> <%= listaMedico.get(i).getIdMedicos()%></td>
                         <td> <%= listaMedico.get(i).getNombre() + " " + listaMedico.get(i).getApellidos()  %></td>
                         <td> <%= listaMedico.get(i).getIdEspecialidad().getNombre()%></td>
                         <td> <a href="ConsultarListadoCitas?do=medi&perfil=<%=listaMedico.get(i).getIdMedicos()%>">Consultar</a> </td>
              <%
                }
                    
                }
                   else if (listaCitas != null)
                {%> 
                    <%----%>
                <table border="1">
                        <tr>
                          <td><strong>Cita</strong></td>
                          <td><strong>Seguridad Social</strong></td>
                          <td><strong>Paciente</strong></td>
                          
                          <td><strong>Nombre Medico</strong></td>
                          <td><strong>Fecha</strong></td>
                          <td><strong>Hora</strong></td>
                          <td><strong>Especialidad</strong></td>
                          <td><strong>Localizacion</strong></td>
                        </tr>  
                        
                        <%
                for(int i=0;i<listaCitas.size();i++)
                {    
                   SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); 
                   String Fecha = sdf.format(listaCitas.get(i).getFecha());
                          
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(listaCitas.get(i).getIdHora().getHora());
                    Integer hr = cal.get(Calendar.HOUR);
                    Integer mi = cal.get(Calendar.MINUTE);
                    Integer se = cal.get(Calendar.SECOND);
                %>
                            
                
                        
                         <tr>
                         <td> <%= listaCitas.get(i).getIdCitas()%></td>
                         <td> <%= listaCitas.get(i).getNushaPaciente().getNuhsa() %></td>
                         <td> <%= listaCitas.get(i).getNushaPaciente().getNombre() + " " + listaCitas.get(i).getNushaPaciente().getApellidos() %></td>
                         <td> <%= listaCitas.get(i).getIdMedicos().getNombre() + " " + listaCitas.get(i).getIdMedicos().getApellidos() %></td>
                         <td> <%= Fecha %></td>
                         <td> <%= hr + ":"+mi+":"+se %></td>
                         <td> <%= listaCitas.get(i).getIdEspecialidad().getNombre() %></td>
                         <td> <%= listaCitas.get(i).getLocalizacion() %></td>
                    <%
                }
                    
                }
                    
                    %>
       
    </body>
</html>
