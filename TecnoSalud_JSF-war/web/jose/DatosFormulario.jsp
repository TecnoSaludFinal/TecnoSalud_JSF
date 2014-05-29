<%-- 
    Document   : DatosFormulario
    Created on : 14-may-2014, 22:37:31
    Author     : JoseAntonio
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.entity.Formulario"%>
<%@page import="java.util.List"%>
<html>
 <meta charset="utf-8">
	<title>TECNOSALUD</title>
	
	
    </head>
    <body>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/logoutServlet"> Salida </a>
					
						<h3 class="fl">Formularios</h3>
											
					 
<% //HistorialMedico lista = (HistorialMedico)request.getAttribute("lista");
                     List<Formulario> listaFormulario = (List<Formulario> ) request.getAttribute("lista");
        String valor = (String) request.getAttribute("valor");
     
        String dni= (String) session.getAttribute("dni2");
        String password = (String) session.getAttribute("password2");
        
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
            <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/ConsultarHistorialPaciente" method="get">     
             <fieldset> 
            
            <legend align= "center">Datos Formulario</legend>
           
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
            
	</fieldset>
             </form>
            <br><br>
            <%  
                 } 
           }
             
              %>

       
    </body>
</html>

