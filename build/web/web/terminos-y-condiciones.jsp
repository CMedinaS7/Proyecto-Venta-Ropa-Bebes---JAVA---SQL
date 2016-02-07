<%-- 
    Document   : terminos-y-condiciones
    Created on : 20-may-2012, 17:42:47
    Author     : user
--%>
<%@page import="Beans.DetalleVenta"%>
<%@page import="java.util.ArrayList"%>
<%
            HttpSession sesion = request.getSession(true);
            String Usuario = (String) sesion.getAttribute("Cnombres");
            String Direccion = (String) sesion.getAttribute("Cdireccion");
            String Telefono = (String) sesion.getAttribute("Ctelefono");
            String Email = (String) sesion.getAttribute("Cemail");
	    int total=0;
            int totales=0;
            ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
            if(lista!=null){
            totales=lista.size();
                              }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html><head id="www-sitename-com" data-template-set="html5-reset"> 
<base  />
	<meta charset="utf-8"> 
	
	<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame --> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	
	<title>BABYMODAS - Regalos para recién nacido, juguetes, ropa para bebés y niños.</title> 
	
	<meta name="title" content="Regalos para recién nacidos, juguetes, ropa, accesorios para niños y bebés. Mallas de seguridad para el hogar."> 
	<meta name="description" content=""> 
	<link rel="icon" type="image/png" href="image/icono.png" />	 
	
	<!-- CSS: screen, mobile & print are all in the same file --> 
    <link rel="stylesheet" href="css/reset.css"> 
    <link rel="stylesheet" href="css/queryLoader.css"> 
    <link rel="stylesheet" href="ThickBox/thickbox.css" type="text/css" media="screen" > 
    <link rel="stylesheet" type="text/css" href="css/tango/skin1.css" />    
    <link rel="stylesheet" href="css/style.css"> 
 
	<!-- jquery para iniciar page --> 
	<script src="js/queryLoader.js"></script><!-- loading page -->    
<style type="text/css">
#apDiv1 {	position:absolute;
	width:99px;
	height:29px;
	z-index:1;
	left: 475px;
	top: 10px;
}
#natural
{
display:;	}


#juridica
{
display:none;	}

</style>

<script type="text/javascript">

function naturales() {

natural.style.display ='';
juridica.style.display ='none';

}
function juridicas() {

natural.style.display ='none';
juridica.style.display ='inline';

}
</script>

</head> 
 
<body> 
 
<div id="wrapper"> 
 
	

<div id="header" class="HeaderWidth2">
  <div id="head">
    <div class="logo"> <a href="index.jsp"><img src="image/logo.png"></a> </div>
    <%if ((String) sesion.getAttribute("Cnombres") == null) {%>
    <div class="login">
      <div class="iconUser">
        <div class="formLogin">
          <form action="../validarCliente" method="post" id="logeo" class="logeo">
            <p>
              <label class="lbl">Correo eléctronico:</label>
              <input class="input required email" type="text" name="email" id="email2">
            </p>
            <p>
              <label class="lbl">Ingrese Clave:</label>
              <input class="input required" type="password" name="clave" id="clave">
            </p>
            <p> <a href="%24site_url.html#TB_inline?height=190&width=390&inlineId=RecoveryPwd" 
                            name="&nbsp;&nbsp;&nbsp;Recuperar Contraseña"  id="enlace" class="link2 thickbox"> Olvidó contraseña </a>
              <button class="submitLogin" type="submit">Ingresar</button>
            </p>
          </form>
        </div>
      </div>
      <p> <a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox"> <b>REGISTRARSE</b> </a> </p>
    </div>
    <%}else{%>
    <div class="login">
      <div class="iconUser">
        <div class="formLogin">
        <form>
          <p>
            <center>
              <label  class="h4"><%=Usuario%></label>
            </center>
          </p>
          <br>
          <p>
            <label class="parrafo6">
            <b>Direccion:</b>
            <label class="parrafo9"><%=Direccion%></label>
            </label>
          </p>
          <p>
            <label class="parrafo6">
            <b>Telefono:</b>
            <label class="parrafo9"><%=Telefono%></label>
            </label>
          </p>
          <p>
            <label class="parrafo6">
            <b>E-mail:</b>
            <label class="parrafo9"><%=Email%></label>
            </label>
          </p>
          <br>
          <p> <a href="../logoutcliente"><font color="#FF0000">Cerrar Session</font></a>
            <button class="submitLogin" type="submit">Modificar Datos</button>
          </p>
          </div>
        </form>
      </div>
      <p> <a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox"> <b>REGISTRARSE</b> </a> </p>
    </div>
    <%}%>
    <div class="search">
      <form action="#" method="post">
        <input type="text" name="s">
      </form>
    </div>
    <div class="number"> (044)-282259 </div>
    <div class="menu">
      <ul>
        <li > <a href="index.jsp" >Inicio</a> </li>
        <li > <a href="bebes.jsp?p=1" >Bebes</a> </li>
        <li > <a href="niños.jsp" >Niños</a> </li>
        <li > <a href="promociones.jsp" >Promociones</a> </li>
        <li > <a href="seguridad.jsp" >Novedades</a> </li>
      </ul>
    </div>
    <div class="shop" onClick="location.href='carrito.jsp'"></div>
    <div id="apDiv1"><a href="../intranet/login.jsp" target="_blank"><img src="image/btnintranet.png"></a></div>
  </div>
</div>
    
    <div id="container">   
    
    	<div id="slider"> 
        	
            <div class="borderSup"></div> 
            <div class="borderInf"></div>            
            
            <div class="imagen"> 
        <div class="shop" onClick="location.href='carrito.jsp'"> 
                <p><!--0-->
                <%=totales%>
                   <br> 
                   <span>• PRODUCTOS •</span>
                </p> 
        </div>



<div>
      <img src="image/img.jpg">
</div>
           
			</div> 
            
        </div> 
    	
        <div id="main"> 
        	
            <div class="title"> 
           		Términos y Condiciones</div> 
            
          <div class="grid box-1" id="informativo"> 

			  <p class="h5">1. Productos</p>
			  <p>1.1.   Características</p>
		    <p>Las características indicadas en cada producto son referenciales y éstas podrán ser modificadas en la página web sin previo aviso.</p>
			  <p>1.2.   Precios</p>
			  <p>Todos los precios incluyen el 18% del IGV y podrán ser modificados en la página web sin previo aviso.</p>
			  <p>1.3.   Fotos</p>
			  <p>La foto presentada en la página web es una referencia del producto, este puede variar ligeramente, en color, por ejemplo.</p>
			  <p>1.4.   Garantía</p>
			  <p>Todos los productos ofrecidos en nuestra página web son de calidad y cuentan con el respaldo de cada marca.</p>
			  <p>Ante algún eventual desperfecto de fábrica, el producto será evaluado por el proveedor de la marca para su cambio por otro en perfecto estado y/o ejecute la garantía que corresponda. Cabe indicar que el producto y empaque deberán estar en perfecto estado.</p>
			  <p>1.5.   Stock</p>
			  <p>Todos los productos se encuentran disponibles, salvo especificaciones de stock limitados. En dicho caso, consultar con la empresa el stock actual.</p>
			  <p>En el supuesto que el cliente haya pagado por el producto y no se cuente con el stock requerido, se devolverá el íntegro del dinero, no generando ésta situación ningún tipo de penalidad.</p>
			  <p>1.6.   Cambio o devolución</p>
			  <p>Sólo se procederá a hacer el cambio del producto, por otro de nuestra tienda virtual, siempre y cuando haya algún desperfecto o este difiera de lo ofrecido inicialmente. Cabe indicar, que tanto el producto como el empaque deben estar en perfecto estado.</p>
			  <p>Se debe tener en cuenta que no podrán devolver: productos que hayan sido probados o usados, productos con envolturas o empaques dañados, productos con bolsas o precintos de seguridad abiertos, productos que no cuenten con el recibo de compra en la tienda virtual.</p>
		    <p>1.7.   Responsabilidad ante eventuales accidentes</p>
		    <p>Cada proveedor de la marca es responsable del producto ofrecido. Nosotros somos el intermediario en la venta del mismo. No nos responsabilizamos ante un eventual accidente que pudiera ocurrir con algún producto o servicio ofrecido a través de la página web, no siendo responsables por los defectos que pudieran tener los productos o la inapropiada utilización de los mismos.</p></div> 
        	
            <div class="clear"></div> 
                
    	</div>        
        
    </div> 
    
    <div id="footer"> 
    	
    <div id="foot">
      <div class="menu">
        <ul>
          <li><a href="nosotros.jsp">&bull; Nosotros</a></li>
          <li><a href="contactenos.jsp">&bull; Contáctanos</a></li>
        </ul>
        <ul>
          <li><a href="terminos-y-condiciones.jsp">&bull; Términos Y Condiciones</a></li>
          <li><a href="pol%c3%adtica-de-privacidad.html">&bull; Política de Privacidad</a></li>
        </ul>
        <ul>
          <li><a href="nuestras-tiendas.jsp">&bull; Nuestras Tiendas</a></li>
          <li><a href="mapa-del-sitio.jsp">&bull; Multimedia</a></li>
        </ul>
      </div>
      <div class="new" id="mc_embed_signup"> 
    <h4>Suscribir</h4> 
            <p>Recibe novedades y promociones</p> 
            <form action="#" 
            id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" 
            method="post" class="news" target="_blank">
                <label class="lbl" for="mce-EMAIL">Ingrese su Correo Electrónico</label> 
                <input type="text" value="" class="required email" name="EMAIL"  id="mce-EMAIL"><br> 
	<div id="mce-responses" class="clear">
		<div class="response" id="mce-error-response" style="display:none"></div>
		<div class="response" id="mce-success-response" style="display:none"></div>
	</div>                
                <button class="button" type="submit" id="mc-embedded-subscribe">Enviar
                </button> 
            </form> 
</div> 
        


<div class="terms">
  <div class="logo"><a href="#"></a></div>
  <p>CJMS7 © 
    DISEÑO DE PAGINAS WEB </p>
  <p>Copyright ® 2012 BABYMODAS. Todos los derechos reservados.</p>
</div>
<div class="formas_pago"> 
    <p>formas de pago</p> 
            <a name="paypal"></a> 
            <a name="tb">Transferencia<br>bancaria</a> 
            <a name="cont">contraentrega</a> 
        </div>
<div class="redes">
  <p>Redes sociales</p>
  <a href="http://www.facebook.com/porta7m" target="_blank" name="fb"></a> <a href="http://twitter.com/" target="_blank" name="tw"></a> <a href="http://" target="_blank" name="gp"></a> <a href="" target="_blank" name="sk"></a> </div>
    </div> 
    
	</div> 




</div> 
 
<div id="Register" class="none"> 
 <div class="data">
 <table>
 <tr>
 <td>
 <h5><center>CLIENTE NATURAL</center></h5>
	<form action="../moduloCliente" method="post" id="registerUser"  name="registerUser" class="register">
        <input type="hidden" value="natural" id="txtfiltro" name="txtfiltro">    
        <p class="txtCenter">
        	<label class="lbl" for="txtnombres">Nombres*</label>	
            <input type="text" class="InputW required" value="" name="txtnombres" id="txtnombres"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtapellidos">Apellidos*</label>	
            <input type="text" class="InputW required" value="" name="txtapellidos" id="txtapellidos"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtdni">DNI*</label>
            <input type="text" class="InputW required number" value="" name="txtdni" maxlength="8" id="txtdni">
        </p>
        
         <p class="txtCenter">
        	<label class="lbl" for="txtdireccion">Dirección*</label>
            <input type="text" class="InputW required" value="" name="txtdireccion" id="txtdireccion">
            
        </p>         
        
              
        <p class="miniselect">
        <select class="required styled1 selectW1" name="cbosexo" id="r_select_paises">
            <option value="">Seleccione Sexo*</option>
            <option value="Femenino">Femenino</option>
            <option value="Masculino">Masculino</option>
        </select>
        </p>        
        
        <p class="txtCenter _left">
        	<label class="lbl" for="txttelefono">Teléfono*</label>
            <input type="text" class="required InputW " value="" name="txttelefono" id="txttelefono">
        </p>  

        <p class="txtCenter _left">
        	<label class="lbl" for="txtemail">Correo Electrónico*</label>
            <input type="text" class="required InputW email" value="" name="txtemail" id="txtemail">
        </p> 
        <p class="txtCenter _left">
        	<label class="lbl" for="txtclave">Contraseña*</label>
            <input type="password" class="required InputW" value="" name="txtclave" id="txtclave">
        </p>  
               
        <input type="hidden" name="redirect_ok" id="register_redirect_ok" value="gracias-por-registrarse-por-confirmar.html" />
        <p class="textL txtCenter _left span-12">
        	*Campos obligatorios
        </p>
        <p class="span-13">
            <label class="lblsubmit"><button class="submit" type="submit" id="boton_registrar">Continuar</button></label>
        </p>        
    </form>
    </td>
 	
    <td>
    <h5><center>CLIENTE JURIDICO</center></h5>
	<form action="../moduloCliente" method="post" id="recoveryPwd" class="recoveryPwd" name="registerUser1">
        <input type="hidden" value="juridico" id="txtfitro" name="txtfiltro">
        <p class="txtCenter">
        	<label class="lbl" for="txtrz">Razon Social*</label>	
            <input type="text" class="InputW required" value="" name="txtrz" id="txtrz"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtrepre">Representante*</label>	
            <input type="text" class="InputW required" value="" name="txtrepre" id="txtrepre"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtruc">RUC*</label>
            <input type="text" class="InputW required" value="" name="txtruc" id="txtruc">
        </p>
        
         <p class="txtCenter">
        	<label class="lbl" for="txtdireccion1">Dirección*</label>
            <input type="text" class="InputW required" value="" name="txtdireccion1" id="txtdireccion1">
            
        </p>         
        
        
        <p class="txtCenter _left">
        	<label class="lbl" for="txttelefono1">Teléfono*</label>
            <input type="text" class="required InputW " value="" name="txttelefono1" id="txttelefono1">
        </p>  

        <p class="txtCenter _left">
        	<label class="lbl" for="txtemail1">Correo Electrónico*</label>
            <input type="text" class="required InputW email" value="" name="txtemail1" id="txtemail1">
        </p> 
        <p class="txtCenter _left">
        	<label class="lbl" for="txtclave1">Contraseña*</label>
            <input type="password" class="required InputW" value="" name="txtclave1" id="txtclave1">
        </p>  
               
        <input type="hidden" name="redirect_ok" id="register_redirect_ok" value="gracias-por-registrarse-por-confirmar.html" />
        <p class="textL txtCenter _left span-12">
        	*Campos obligatorios
        </p>
        <p class="span-13">
            <label class="lblsubmit"><button class="submit" type="submit" id="boton_registrar1">Continuar</button></label>
        </p>        
    </form>
    </td>
 
 
    </tr>
    </table>
</div>
</div> 
<!-- here comes the javascript --> 
 
<!-- Grab Google CDN's jQuery. fall back to local if necessary --> 
<script src="js/jquery.min.js"></script> 
<script>window.jQuery || document.write("<script src='js/jquery-1.5.1.min.js'>\x3C/script>")</script> 
 
<script src="js/slide.js"></script> 

<script src="js/jquery.bgscroll.js"></script> 
 
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.infieldlabel.min.js"></script>

<!-- this is where we put our custom functions --> 
<script src="js/functions.js"></script> 
 
<script src="ThickBox/thickbox.js" type="text/javascript"></script> 
 
<script src="js/jquery.ubillboard.js"></script> 
 

			<script>
			$(document).ready(function(){
				$('#wrapper').addClass('background');
				$('#container').addClass('clouds');		
			});
			</script> 

<script type="text/javascript"> 
 
jQuery('#billboard').simpleSlide();

/*
	$('#billboard').uBillboard({
		speed: 600,
		delay: 6000,
		width: '860px',
		height: '425px',
		effect: 'cycle',
		square_resolution: 94,
		load_check_interval: 100,
		loader_image: 'image/loading.gif'
	});
*/
 
</script> 
 
<!--GOOGLE REMARKETING (config) - START-->
<!-- Google Code for kodomokids Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1023271663;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "_-i9CNGZsAIQ78X35wM";
var google_conversion_value = 0;
/* ]]> */
</script>

<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1023271663/?label=_-i9CNGZsAIQ78X35wM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>  
</body> 

</html>