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
 <meta charset="utf-8">
	<title>Crear Medico Nuevo</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta charset="utf-8">
	
    </head>
    <body>
         <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
     <h1>Bienvenido: <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %></h1>
     <br>
     <a href="/Inicio/logoutServlet"> Salida </a>
     <br>
       <div id="cabecera">
           <h1>Crear Medico Nuevo
           </h1>
        </div>       
		
        
        <br><br> 
	
	<!-- MAIN CONTENT -->
	
        <%
            List<Especialidad> lista_espe = (List <Especialidad>)request.getAttribute("lista_especialidad");
        %>
        
        <%
            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
        %>
											
	 
        <form method="post" action="http://localhost:8080/TecnoSalud_JSF-war/NuevoMedicoM" name="datos" onsubmit="return validarForm(this)">
            <fieldset>
                
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
            
            </fieldset>        
            <br><br>
            
        <%-- Boton Crear Medico Nuevo --%>    
                
        <input type="submit" value="Enviar" name="Enviar">
        
        </form>   

       
    </body>
</html>

<script type="text/javascript">
    function validarForm(f) 
    {
            var numero;
            var let;
            var letra;
            var expresion_regular_dni;
            expresion_regular_dni = /^\d{8}[a-zA-Z]$/;
            
            if(expresion_regular_dni.test (dni)===true)
            {
                numero = dni.substr(0,dni.length-1);
                let = dni.substr(dni.length-1,1);
                numero = numero % 23;
                letra='TRWAGMYFPDXBNJZSQVHLCKET';
                letra=letra.substring(numero,numero+1);
                if (letra!==let) 
                    {
                        alert('Dni erroneo, la letra del NIF no se corresponde');
                    }
                    else
                    {
                        alert('Dni correcto');
                    }
            }
            else
            {
                alert('Dni erroneo, formato no válido');
            } 
    }
</script>