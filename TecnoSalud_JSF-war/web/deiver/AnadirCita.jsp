<%-- 
    Document   : AnadirCita
    Created on : 13-may-2014, 13:51:29
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="java.util.Calendar"%>
<%@page import="app.entity.Hora"%>
<%@page import="app.entity.Especialidad"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añadir Cita</title>
        
       
        
    </head>
    <body>
        <h1>Anadir Cita - Personal Administrativo</h1>
        
        <%
            List<Especialidad> listaEspe = (List<Especialidad>) request.getAttribute("listaEspe");
            List<Hora> listaHora = (List<Hora>) request.getAttribute("listaHora");
            
            PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
        
        <br/><br/>
        <h1>Bienvenido: <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %></h1>
        <br/><br/>
        
        <form name="form" onsubmit="return validar(this)" method="POST" action="http://localhost:8080/TecnoSalud_Final-war/anadirCita">
            
            Nuhsa Paciente: <input type="text" name="nuhsa" id="campo1"><br/>
            Médico: <input type="text" name="medico" id="campo2"><br/>
            Fecha: <input type="text" name="fecha"><br/>
            
            Hora: <select name="hora">
            <%
                for(int i=0;i<listaHora.size();i++)
                {
                    Calendar hor = Calendar.getInstance();
                    hor.setTime(listaHora.get(i).getHora());
                    Integer hr = hor.get(Calendar.HOUR);
                    Integer mi = hor.get(Calendar.MINUTE);
                    Integer se = hor.get(Calendar.SECOND);
            %>
            
            <option value="<%= listaHora.get(i).getIdHora() %>"><%= hr+":"+mi+":"+se %></option>
            
            <%
                }
            %>
            </select> <br/>
            
            Especialidad: <select name="especialidad">
            <%
                for(int i=0;i<listaEspe.size();i++)
                {
            %>
            
            <option value="<%= listaEspe.get(i).getNombre() %>"><%= listaEspe.get(i).getNombre() %></option>
            
            <%
                }
            %>
            
            </select> <br/>
            
            Consulta: <input type="text" name="localizacion"><br/>
        
            <input type="submit" value="Enviar" name="Enviar">
        </form>
        
        <script type="text/javascript">
            function validar(ev)
            {
                var FiltroRx2 = /^\d{4}\-\d{1,2}\-\d{1,2}$/;
                var FiltroRx = /[0-9]/;
                var ok= true;
                var msg = null;
                if(document.form.nuhsa.value === "")
                { //¿Tiene 0 caracteres?
                // formulario.nombre.focus(); // Damos el foco al control
                    msg = "Debes escribir algo en el campo : Nuhsa\n"; //Mostramos el mensaje
                    ok = false;
                }
                else if (!FiltroRx.test(document.form.nuhsa.value))
                {
                    msg = "Solo se aceptan numeros para el campo Nuhsa";
                    ok = false;
                }
                else if (!FiltroRx.test(document.form.medico.value))
                {
                    msg = "Solo se aceptan numeros para el campo Nuhsa";
                    ok = false;
                }
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
