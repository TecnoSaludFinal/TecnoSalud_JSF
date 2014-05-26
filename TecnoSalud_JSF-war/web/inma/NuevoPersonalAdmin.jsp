<%-- 
    Document   : NuevoPersonalAdmin
    Created on : 13-may-2014, 12:08:52
    Author     : Inma
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Roles"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="utf-8">
	<title>Crear personal administrativo</title>
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
           <h1>Dar de alta a nuevo personal administrativo
           </h1>
        </div>       
		
        
        <br><br> 
	
	<!-- MAIN CONTENT -->
	        
        <%
            List<Roles> lista_rol = (List <Roles>)request.getAttribute("lista_rol");
        %>
											
	 
        <form method="post" action="http://localhost:8080/TecnoSalud_Final-war/NuevoPersonalAdminM" name="datos" onsubmit="return validarForm(this)">
            <fieldset>
                
                <%-- Datos del nuevo a crear --%>    

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
            
        <%-- Boton Crear Nuevo --%>    
                
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

        if(expresion_regular_dni.test (dni)=== true)
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