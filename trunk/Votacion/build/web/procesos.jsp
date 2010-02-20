<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Time Manager</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!--TopPan-->
        <div id="topPan">
            <h1>Voto Electr&oacute;nico</h1>
        </div>
        <form id ="procesoForm" action="VotacionServlet" method="post">
            <input type="hidden" name="idProceso" value=""/>
            <input type="hidden" name="accion" value=""/>
            <!--TopPan Close-->
            <!--BodyPan-->
            <div id="bodyPan">
                <h1><span>Bienvenido</span></h1>
                <p class="bigtext">Elija el proceso electoral.</p>
                <ul>
                    <c:forEach var="proceso" items="${procesos}">
                            <!--<li><a href="VotacionServlet?accion=loginVotacion&idProceso=${proceso.idProceso}">${proceso.nombre}</a></li>-->
                        <li><a href="javascript:this.enviar('${proceso.idProceso}', '${proceso.estadoJornada}');">${proceso.nombre}</a></li>

                    </c:forEach>
                </ul>
            </div>
            <div id="bodybottomPan">&nbsp;</div>
            <!--BodyPan Close-->
            <!--FooterPan-->
        </form>
    </body>
</html>

<script type="text/javascript">
    function enviar(idProceso, estadoJornada){
        if(parseInt(estadoJornada) == 0){
            alert('El proceso electoral aun no esta iniciado');
        }else if(parseInt(estadoJornada) == 1){
            var form = document.getElementById('procesoForm');
            form.idProceso.value = idProceso;
            form.accion.value = 'loginVotacion';
            form.submit();
        }else{
            alert('El proceso electoral esta cerrado');
        }

    }
</script>
