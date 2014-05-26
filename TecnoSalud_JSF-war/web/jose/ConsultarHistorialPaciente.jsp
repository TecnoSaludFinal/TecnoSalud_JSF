<%-- 
    Document   : ConsultarHistorialPaciente
    Created on : 28-abr-2014, 19:30:19
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
					
						<h3 class="fl">Historial Médico</h3>
											
				  

            
            <form name="consulta" action="http://localhost:8080/TecnoSalud_Final-war/consultarHistorial" method="post" onsubmit="return validarForm(this)">
            <%-- Datos del paciente a buscar --%>
           <fieldset>   
               
            <label> Introduzca los datos necesarios para la busqueda de paciente:</label> 
            <br><br>
            <label for="nombrePaciente"> Nombre del paciente:</label>
            <input type="text" name="nombrePaciente" value="">
            <br>
            <label for="nuhsa">Numero Seguridad Social:</label>
            <input type="text" name="nuhsa" value="">
            <br><br>
     
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">
            
            
        
	</fieldset>

            </form>
           

<script type="text/javascript">
                
function validarForm(f) {
    
    var FiltroRx = /[0-9]/;
    var ok= true;
    var msg = null;
  if(document.consulta.nuhsa.value === "")
           { //¿Tiene 0 caracteres?
   // formulario.nombre.focus();    // Damos el foco al control
    msg = "Debes escribir algo en el campo : Nuhsa\n"; //Mostramos el mensaje
    ok = false;
    
  }
  else if (!FiltroRx.test(document.consulta.nuhsa.value))
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

