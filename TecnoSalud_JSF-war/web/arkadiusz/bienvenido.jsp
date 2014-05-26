<%-- 
    Document   : bienvenido
    Created on : 2014-05-21, 17:32:30
    Author     : Administrator
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Administrativo</title>
        <link rel="Stylesheet" type="text/css" href="arkadiusz/style.css" />
    </head>
    <body>
        <%
            PersonalAdministrativo personal = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
        <div id = logo>
            <h1> PERSONAL ADMINISTRATIVO</h1>
              <a href="/TecnoSalud_Final-war/PersonalAdministrativoLogout" id=logout> Salida </a> 
              <b id = logout><%= personal.getApellidos() + " " + personal.getNombre()+ " " %></b>
              <br>
        </div>
        <div id = pagina_principal>
            <div id = menu>
                <a href ="/TecnoSalud_Final-war/arkadiusz/crear_paciente.jsp"> Crear Paciente </a>
                <br>
                <a href ="/TecnoSalud_Final-war/arkadiusz/consultar_paciente2.jsp"> Consultar Paciente</a>
                <br>
                <a href ="/TecnoSalud_Final-war/ListadoPacientes"> Listar pacientes</a>
            </div>
            <div id = centro>
  
            </div>
    
        </div>
    </body>
</html>
