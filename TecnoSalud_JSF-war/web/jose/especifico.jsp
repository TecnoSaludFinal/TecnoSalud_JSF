<%-- 
    Document   : especifico
    Created on : 20-may-2014, 21:33:58
    Author     : JoseAntonio
--%>

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
					
						<h3 class="fl">Busqueda por paciente</h3>
											
					</div> <!-- end content-module-heading -->    

            
            <form name="edit" action="http://localhost:8080/TecnoSalud_Final-war/ConsultarFormulario?do=espe" method="post">
            <%-- Datos del paciente a buscar --%>
           <fieldset>   
            <label> Introduzca los datos necesarios para la busqueda de paciente:</label> 
            <br><br>
            <label for="nuhsa">Numero Seguridad Social:</label>
            <input type="text" name="nuhsa" value="">
            <br><br>
     
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">
	</fieldset>

            </form>
           
            
       
    </body>
</html>
