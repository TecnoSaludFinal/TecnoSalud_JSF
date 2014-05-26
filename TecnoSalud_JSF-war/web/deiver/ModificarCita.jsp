<%-- 
    Document   : ModificarCita
    Created on : 05-may-2014, 11:04:28
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cita</title>
    </head>
    <body>
        <h1>Modificar cita</h1>
        
        <%
            Citas c = (Citas) request.getAttribute("cita");
            
            PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(c.getFecha());
            Integer dia = cal.get(Calendar.DATE);
            Integer mes = cal.get(Calendar.MONTH) + 1;
            Integer anio = cal.get(Calendar.YEAR);
            
            Calendar hor = Calendar.getInstance();
            hor.setTime(c.getIdHora().getHora());
            Integer hr = hor.get(Calendar.HOUR);
            Integer mi = hor.get(Calendar.MINUTE);
            Integer se = hor.get(Calendar.SECOND);
        %>
        
        <br/><br/>
        <h1>Bienvenido: <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %></h1>
        <br/><br/>
        
        <form method="POST" action="http://localhost:8080/TecnoSalud_Final-war/modificando">
        
            <input type="hidden" value="<%= c.getIdCitas() %>" name="idCita">
            <input type="hidden" value="<%= c.getNushaPaciente().getDni() %>" name="idPaciente">
            <input type="hidden" value="<%= c.getIdMedicos().getIdMedicos() %>" name="idMedico">
            Especialidad: <input type="text" value="<%= c.getIdEspecialidad().getNombre() %>" name="nomEspecialidad"> <br/>
            Fecha: <input type="text" value="<%= anio+"-"+mes+"-"+dia  %>" name="fecha"><br/>
            Hora: <input type="text" value="<%= hr+":"+mi+":"+se %>" name="hora"><br/>
            Médico: <input type="text" value="<%= c.getIdMedicos().getNombre() +" "+ c.getIdMedicos().getApellidos() %>" name="medico"><br/>
            Consulta: <input type="text" value="<%= c.getLocalizacion() %>" name="localizacion"><br/><br/>
        
            <input type="submit" value="Enviar" name="Enviar">
        </form>
    </body>
</html>
