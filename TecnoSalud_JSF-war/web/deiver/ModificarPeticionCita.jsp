<%-- 
    Document   : ModificarPeticionCita
    Created on : 13-may-2014, 12:52:32
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.entity.PeticionCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Modificar PeticionCita - Pers. Admin.</h1>
        
        <%
            Pacientes p;
            PersonalAdministrativo pa;
            PeticionCita pc = (PeticionCita) request.getAttribute("peticionCita");
            
            Integer idRol = (Integer) session.getAttribute("id");
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(pc.getFecha());
            Integer dia = cal.get(Calendar.DATE);
            Integer mes = cal.get(Calendar.MONTH) + 1;
            Integer anio = cal.get(Calendar.YEAR);
            
            Calendar hor = Calendar.getInstance();
            hor.setTime(pc.getIdHora().getHora());
            Integer hr = hor.get(Calendar.HOUR);
            Integer mi = hor.get(Calendar.MINUTE);
            Integer se = hor.get(Calendar.SECOND);
        %>
        
        <br/><br/>
        <%
            if(idRol == 1)
            {
                p = (Pacientes) session.getAttribute("entidad");
        %>
        <h1>Bienvenido: <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %></h1>
        <%
            }
            else if(idRol == 3)
            {
                pa = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
        <h1>Bienvenido: <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %></h1>
        <%
            }
        %>
        <br/><br/>
        
        <form method="POST" action="http://localhost:8080/TecnoSalud_JSF-war/modificandoPeticionCita">
        
            <input type="hidden" value="<%= pc.getIdPeticion() %>" name="idPeticionCita">
            <input type="hidden" value="<%= pc.getNuhsaPaciente().getDni() %>" name="paciente">
            Tipo: <input type="text" value="<%= pc.getIdTipo().getNombre() %>" name="tipo"> <br/>
            Fecha: <input type="text" value="<%= anio+"-"+mes+"-"+dia  %>" name="fecha"><br/>
            Hora: <input type="text" value="<%= hr+":"+mi+":"+se %>" name="hora"><br/>
            Paciente: <input type="text" value="<%= pc.getNuhsaPaciente().getNombre() +" "+ pc.getNuhsaPaciente().getApellidos() %>" name="medico"><br/>
            Comentario: <input type="text" value="<%= pc.getComentario() %>" name="comentario"><br/><br/>
        
            <input type="submit" value="Enviar" name="Enviar">
        </form>
    </body>
</html>
