<%-- 
    Document   : AnadirCita
    Created on : 05-may-2014, 11:04:09
    Author     : Deiver
--%>

<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Hora"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.TipoCita"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitar cita</title>
    </head>
    <body>
        <h1>Petición de cita nueva</h1>
        
        <%
            List<TipoCita> lista_tc = (List<TipoCita>) request.getAttribute("lista_tc");
            List<Hora> lista_hora = (List<Hora>) request.getAttribute("lista_hora");
            Pacientes p = (Pacientes) session.getAttribute("entidad");
        %>
        
        <br/><br/>
        <h1>Bienvenido: <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %></h1>
        <br/><br/>
        
        <form name="form" onsubmit="return validar(this)" method="POST" action="http://localhost:8080/TecnoSalud_Final-war/peticion">
            
            Tipo de solicitud: <select name="cita">
            <%
                for(int i=0;i<lista_tc.size();i++)
                {
            %>
            
            <option value="<%= lista_tc.get(i).getNombre() %>"><%= lista_tc.get(i).getNombre() %></option>
            
            <%
                }
            %>
            
            </select> <br/>
            Fecha (AAAA-MM-DD): <input type="text" name="fecha"><br/>
            Hora: <select name="hora">
            <%
                for(int i=0;i<lista_hora.size();i++)
                {
                    Calendar hor = Calendar.getInstance();
                    hor.setTime(lista_hora.get(i).getHora());
                    Integer hr = hor.get(Calendar.HOUR);
                    Integer mi = hor.get(Calendar.MINUTE);
                    Integer se = hor.get(Calendar.SECOND);
            %>
            
            <option value="<%= lista_hora.get(i).getIdHora() %>"><%= hr+":"+mi+":"+se %></option>
            
            <%
                }
            %>
            
            </select> <br/>
            Comentario: <textarea rows="4" cols="50" type="text" name="comentario"></textarea><br/><br/>
        
            <input type="submit" value="Enviar" name="Enviar">
        </form>
            
        <script type="text/javascript">
            function validar(ev)
            {
                var FiltroRx2 = /^\d{4}\-\d{1,2}\-\d{1,2}$/;
                var ok= true;
                var msg = null;
                
                if(document.form.fecha.value === "")
                { //¿Tiene 0 caracteres?
                    // formulario.nombre.focus(); // Damos el foco al control
                    msg = "Debes escribir algo en el campo : Fecha\n"; //Mostramos el mensaje
                    ok = false;
                }
                else if (!FiltroRx2.test(document.form.fecha.value))
                {
                    msg = "El formato de la fecha no es correcto";
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
