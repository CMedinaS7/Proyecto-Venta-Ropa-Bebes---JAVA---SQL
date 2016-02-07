

<%
String e=request.getParameter("e");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js ie6 oldie" lang=en><![endif]--> <!--[if IE 7]><html class="no-js ie7 oldie" lang=en><![endif]--> <!--[if IE 8]><html class="no-js ie8 oldie" lang=en><![endif]--> <!--[if gt IE 8]><!--> 
<html class=no-js lang=en> <!--<![endif]-->
<head>
<meta charset=utf-8>
<link rel=dns-prefetch href="http://fonts.googleapis.com/">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<title>Intranet :: BABYMODAS ::</title>
<link rel="icon" type="image/png" href="image/icono.png" />
<meta name=description content="">
<meta name=author content="">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=stylesheet href='css/c11f8f1b6c157a7a1ee04039d038c282336416b9.css'>
<link href="http://fonts.googleapis.com/css?family=PT+Sans" rel=stylesheet type="text/css">
<script src="js/libs/modernizr-2.0.6.min.js"></script>
</head>

<body class=special-page>
<div id=container>
<section id=login-box>
<div class=block-border>
<div class=block-header>
<h1>Logeo Personal ::BABYMODAS::</h1>
</div> 

<form id=login-form class="block-content form" action="../validarPersonal" method=post>

<p class=inline-small-label>
<label for=txtusuario>Usuario:</label> <input type=text name=txtusuario value="" class=required id="txtusuario">
</p> <p class=inline-small-label>
<label for=txtclave>Password</label> <input type=password name=txtclave value="" class=required id="txtclave">
</p> <p><label>
<input type=checkbox name=keep_logged />Recordar en el futuro.</label>
</p> <div class=clear></div> <div class=block-actions> <ul class=actions-left> <li><a class=button name=recover_password href="javascript:void(0);">Recuperar Password</a></li> <li class=divider-vertical></li> <li><a class="button red" id=reset-login href="javascript:void(0);">Cancelar</a></li> </ul> <ul class=actions-right> <li><input type=submit class=button value=Login></li> </ul> </div> </form> </div> </section> </div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
</script> <script>window.jQuery||document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>');</script>
<script defer src='js/8f71c247c4dadc837fe569208a7a1dc0f7625c46.js'></script>

<noscript><p></p>
<p></p>
</noscript><!--[if lt IE 7 ]><script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script> <script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})});</script><![endif]-->
<%if ("1".equals(e)){ %>
<table width="400" border="0" align="center">
  <tr>
    <td><div>
      <div class="alert error">Su sesión ha expirado  vuelva a ingresar sus datos!!!.</div>
    </div></td>
  </tr>
</table>
<%}%>
</body> 
</html>