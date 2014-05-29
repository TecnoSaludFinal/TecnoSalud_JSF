<%-- 
    Document   : consultar_paciente
    Created on : 2014-05-08, 21:47:04
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="app.entity.Pacientes"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <h1>Entrada al sistema</h1>
        <h2>Introduzca sus datos personales</h2><br>
        <% String error = (String) request.getAttribute("error");
            if(error != null)
            {
                out.println(error);
            }
        %>
        <br>
        <form method="POST" action="/TecnoSalud_JSF-war/PersonalAdministrativoLogin">
            DNI: <input type="text" name="dni" id="dni">
            Contraseña: <input type="password" id="pass" name="pass">
        
            <input type="submit" value="Enviar" name="Enviar">
        </form>
    </body>
</html>