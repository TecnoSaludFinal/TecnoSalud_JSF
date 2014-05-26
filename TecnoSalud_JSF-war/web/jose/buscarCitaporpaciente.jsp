<%-- 
    Document   : buscarporpaciente
    Created on : 15-may-2014, 2:49:56
    Author     : JoseAntonio
--%>

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
					
						<h3 class="fl">Busqueda por paciente</h3>
											
					

            <% 
                
                List<Citas> listaCitas = (List<Citas>) request.getAttribute("listaCitas");

                
                String dni= (String) session.getAttribute("dni2");
                    String password = (String) session.getAttribute("password2");
                    
                if(listaCitas==null)
                {
                %>
            <form name="consulta" action="http://localhost:8080/TecnoSalud_Final-war/ConsultarListadoCitas?do=paci" method="post" onsubmit="return validarForm(this)">
            <%-- Datos del paciente a buscar --%>
           <fieldset>   
               
            <label> Introduzca el número de la Seguridad Social del Paciente:</label> 
            <br><br>
            <label for="ss"> Numero Seguridad Social:</label>
            <input type="text" name="ss" value="">
            <br>
           
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">
	</fieldset>

            </form>
           
            <%}else
                {%>
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
                    
     <script type="text/javascript">               
              function validarForm(f) {
    
    var FiltroRx = /[0-9]/;
    var ok= true;
    var msg = null;
  if(document.consulta.ss.value === "")
           { //¿Tiene 0 caracteres?
   // formulario.nombre.focus();    // Damos el foco al control
    msg = "Debes escribir algo en el campo : Nuhsa\n"; //Mostramos el mensaje
    ok = false;
    
  }
  else if (!FiltroRx.test(document.consulta.ss.value))
        {
           msg = "Solo se aceptan numeros para el campo Nuhsa";
            ok = false;
        }
  if (ok===false)
  {
      alert(msg);

      return ok;
  }
   //Si ha llegado hasta aquí, es que todo es correcto
}
</script>
       
    </body>
</html>
