<%-- 
    Document   : bebes.jsp
    Created on : 20-may-2012, 17:28:24
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
            int reg=0;
            int pant;
            int psig;
	    int total=0;
            int totales=0;
              ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
            if(lista!=null){
            totales=lista.size();
                              }
        
%>
<%@page contentType="text/html" pageEncoding="UTF-8"  import=" Dao.conexion,java.sql.*,java.util.Date"%>

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

a img,:link img,:visited img { border: none; }


.clearfix:after{clear:both;content:".";display:block;font-size:0;height:0;line-height:0;visibility:hidden;}
.clearfix{display:block;zoom:1}


.jqzoom{

	text-decoration:none;
	float:left;
}



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
    <div class="logo"> <a href="index.jsp"><img src="image/logo.png"></a></div>
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
      <p> <a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox"> <b>REGISTRARSE</b></a></p>
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
      <p> <a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox"> <b>REGISTRARSE</b></a></p>
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
        <li > <a href="index.jsp" >Inicio</a></li>
        <li > <a href="bebes.jsp?p=1" >Bebes</a></li>
        <li > <a href="niños.jsp?p=1" >Niños</a></li>
        <li > <a href="promociones.jsp?p=1" >Promociones</a></li>
        <li > <a href="seguridad.jsp" >Novedades</a></li>
      </ul>
    </div>
    <div class="shop" onClick="location.href='carrito.jsp'"></div>
    <div id="apDiv1"><a href="../intranet/login.jsp" target="_blank"><img src="image/btnintranet.png"></a></div>
  </div>
</div>
    
    <div id="container">   
   
    	<div id="slider1">        	
            <div class="borderSup"></div> 
        </div> 
    	
        <div id="main"> 
        
        <div class="shop" onClick="location.href='carrito.jsp'"> 
                <p><!--0-->
                <%=totales%>
                   <br> 
                   <span>• PRODUCTOS •</span>
                </p> 
        </div>
        	
            <div class="title"> 
           		Linea Bebes
            </div>                       
            
            <div class="grid box">
              <div class="grid box-12 category span-12" id="menuCat">
                <ul>
                  <li class="titulo">categorias</li>
                  <!--CATEGORIAS DE PRODUCTOS PARA NIÑOS-->
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Accesorios</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC001&p=1">&raquo; Canguros</a></li>
                      <li><a href="bebes.jsp?c=SC002&p=1">&raquo; Caminadores</a></li>
                      <li><a href="bebes.jsp?c=SC003&p=1">&raquo; Cambiadores</a></li>
                      <li><a href="bebes.jsp?c=SC004&p=1">&raquo; Bolsos para pañales</a></li>
                      <li><a href="bebes.jsp?c=SC005&p=1">&raquo; Baston</a></li>
                      <li><a href="bebes.jsp?c=SC006&p=1">&raquo; Maletines</a></li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Calzados</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC007&p=1">&raquo; Zandalias</a></li>
                      <li><a href="bebes.jsp?c=SC008&p=1">&raquo; Zapatillas</a></li>
                      <li><a href="bebes.jsp?c=SC009&p=1">&raquo; Botas</a></li>
                      <li><a href="bebes.jsp?c=SC010&p=1">&raquo; Zapatos</a></li>
                      <li><a href="bebes.jsp?c=SC011&p=1">&raquo; Flex-Sand</a></li>
                      <li><a href="bebes.jsp?c=SC012&p=1">&raquo; Botines</a></li>
                      <li><a href="bebes.jsp?c=SC013&p=1">&raquo; Zapatenis</a></li>
                      <li><a href="bebes.jsp?c=SC014&p=1">&raquo; Flex-Zap</a></li>
                      <li><a href="bebes.jsp?c=SC015&p=1">&raquo; Sandalias Embol.</a></li>
                      <li><a href="bebes.jsp?c=SC016&p=1">&raquo; Flexibles</a></li>
                      <li><a href="bebes.jsp?c=SC017&p=1">&raquo; Zapato P</a></li>
                      <li><a href="bebes.jsp?c=SC018&p=1">&raquo; Balerina</a></li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Entretenimiento</a></li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Higiene y Salud</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC019&p=1">&raquo; Pañales</a></li>
                      <li><a href="bebes.jsp?c=SC020&p=1">&raquo; Biberones</a></li>
                      <li><a href="bebes.jsp?c=SC021&p=1">&raquo; Tazas</a></li>
                      <li><a href="bebes.jsp?c=SC022&p=1">&raquo; Mordedores</a></li>
                      <li><a href="bebes.jsp?c=SC023&p=1">&raquo; Platos</a></li>
                      <li><a href="bebes.jsp?c=SC024&p=1">&raquo; Cubiertos</a></li>
                      <li><a href="bebes.jsp?c=SC025&p=1">&raquo; Chupones</a></li>
                      <li><a href="bebes.jsp?c=SC026&p=1">&raquo; Shampoos</a></li>
                      <li><a href="bebes.jsp?c=SC027&p=1">&raquo; Coloneas</a></li>
                      <li><a href="bebes.jsp?c=SC028&p=1">&raquo; Hisopos</a></li>
                      <li><a href="bebes.jsp?c=SC029&p=1">&raquo; Aceites</a></li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Linea Blanca</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC062&p=1">&raquo; Colchas</a></li>
                      <li><a href="bebes.jsp?c=SC063&p=1">&raquo; Mantas</a></li>
                      <li><a href="bebes.jsp?c=SC064&p=1">&raquo; Porta bebe</a></li>
                      <li><a href="bebes.jsp?c=SC065&p=1">&raquo; Toallas</a></li>
                      <li><a href="bebes.jsp?c=SC066&p=1">&raquo; Gorros</a></li>
                      <li><a href="bebes.jsp?c=SC067&p=1">&raquo; Chaquetas</a></li>
                      <li><a href="bebes.jsp?c=SC068&p=1">&raquo; Punta</a></li>
                      <li><a href="bebes.jsp?c=SC069&p=1">&raquo; Pedias</a></li>
                      <li><a href="bebes.jsp?c=SC070&p=1">&raquo; Babitas</a></li>
                      <li><a href="bebes.jsp?c=SC071&p=1">&raquo; Baberos</a></li>
                      <li><a href="bebes.jsp?c=SC072&p=1">&raquo; Mitones</a></li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Moviliario</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC099&p=1">&raquo; Sabanas</a></li>
                      <li><a href="bebes.jsp?c=SC100&p=1">&raquo; Protectores</a></li>
                      <li><a href="bebes.jsp?c=SC101&p=1">&raquo; Movil</a></li>
                      <li><a href="bebes.jsp?c=SC102&p=1">&raquo; Tull</a></li>
                      <li><a href="bebes.jsp?c=SC103&p=1">&raquo; Colchones</a></li>
                      <li><a href="bebes.jsp?c=SC104&p=1">&raquo; Edredones</a></li>
                      <li><a href="bebes.jsp?c=SC105&p=1">&raquo; Almohadas</a></li>
                      <li><a href="bebes.jsp?c=SC106&p=1">&raquo; Cofres</a></li>
                      <li><a href="bebes.jsp?c=SC107&p=1">&raquo; Cojines Decorativos</a></li>
                      <li><a href="bebes.jsp?c=SC108&p=1">&raquo; Forros para Cesta</a></li>
                      <li><a href="bebes.jsp?c=SC109&p=1">&raquo; Porta Biberon</a></li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Moda</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC115&p=1">&raquo; Cama Cuna</a></li>
                      <li><a href="bebes.jsp?c=SC116&p=1">&raquo; Cestas para ropa</a></li>
                      <li><a href="bebes.jsp?c=SC117&p=1">&raquo; Comodas</a></li>
                      <li><a href="bebes.jsp?c=SC118&p=1">&raquo; Cunas</a></li>
                      <li><a href="bebes.jsp?c=SC119&p=1">&raquo; Lamparas</a></li>
                      <li><a href="bebes.jsp?c=SC120&p=1">&raquo; Sillas Mesedoras</a></li>
                      <li><a href="bebes.jsp?c=SC121&p=1">&raquo; Tuleros</a></li>
                      <li><a href="bebes.jsp?c=SC122&p=1">&raquo; Mecedora</a></li>
                      <li><a href="bebes.jsp?c=SC123&p=1">&raquo; Exhibidores</a></li>
                      <li><a href="bebes.jsp?c=SC124&p=1">&raquo; Roperos</a></li>
                    </ul>
                  </li>
                  <li><a href="javascript:void(0)" onClick="javascript:void(0)">Salud y belleza</a>
                    <ul>
                      <li><a href="bebes.jsp?c=SC035&p=1">&raquo; Bacines</a></li>
                      <li><a href="bebes.jsp?c=SC126&p=1">&raquo; Bermudas</a></li>
                      <li><a href="bebes.jsp?c=SC127&p=1">&raquo; Buzos</a></li>
                      <li><a href="bebes.jsp?c=SC128&p=1">&raquo; Pulover</a></li>
                      <li><a href="bebes.jsp?c=SC129&p=1">&raquo; Faldas</a></li>
                      <li><a href="bebes.jsp?c=SC130&p=1">&raquo; Jamper</a></li>
                      <li><a href="bebes.jsp?c=SC131&p=1">&raquo; Saquito</a></li>
                      <li><a href="bebes.jsp?c=SC132&p=1">&raquo; Chompas</a></li>
                      <li><a href="bebes.jsp?c=SC133&p=1">&raquo; Conjuntos</a></li>
                    </ul>
                  </li>
                  </li>
                </ul>
              </div>
              <div class="grid box-15 span-12"> 

<%
		   Connection cn;
                    conexion con = new conexion();
                    try {
                		
                        cn = con.getAccesoBD();
                        Statement stmt = cn.createStatement();
						
						String c=request.getParameter("c");
						int p=Integer.parseInt(request.getParameter("p"));
					
                                                if (p==0){
						p=1;
						}else{
						p=Integer.parseInt(request.getParameter("p"));
						}
						
						String a="";
                                                int actual=9 * p;
                                                
                                                int ant =actual - 9;
                                                
                                                String xx= ant + "," + actual;
						if (c==null){
			a="select IdProducto,Descripcion,Precio,foto1,Stock,count(*) as Total from producto where stock>0 and tags='bebes' group by idproducto limit " + xx + ";";;               
						}else{
							a="select IdProducto,Descripcion,Precio,foto1,Stock,count(*) as Total from producto where stock>0 and IdSubcategoria='"+c+"' group by idproducto limit " + xx + ";";;
							
							}
			String codigo=null,descripcion=null,precio=null,foto=null;
                        int stock;
			ResultSet rs = stmt.executeQuery(a);
                        while (rs.next()) {
                            codigo=String.valueOf(rs.getString(1));
                            descripcion=String.valueOf(rs.getString(2));
                            precio=String.valueOf(rs.getString(3));
                            foto=String.valueOf(rs.getString(4));
                            stock=Integer.parseInt(String.valueOf(rs.getString(5)));
                            reg=rs.getRow();
                           
				      
                %>
                
<div class="itemProd">
<%if(stock<3){%>
<div class="new"></div>  
<%}
                            %>

   <img src="<%=foto%>" width="191" height="197" />

                  	 
                         
<p><%=descripcion%></p>
<h6>s/. <%=precio%></h6>  
                        <p> 
                        	<label class="lblsubmit2 left"> 
                            	<button class="submit" onClick="location.href='detalle_producto.jsp?prod=<%=codigo%>'">Detalles</button> 
                            </label> 
                            <a href="../moduloVenta?txtcodigo=<%=codigo%>&accion=AnadirCarrito&txtcantidad=1" name="comprar"></a> 
                        </p> 
</div>

<%
                    }  
                        
                          pant=p-1;
                          psig=p+1;
                                          
                          if (reg < 9){
                              psig=psig-1;
                          }
                          
                   
%>


                </div>
          <a href="bebes.jsp?p=<%=pant%>"><img src="images/ant.png" width="32" height="33"></a> <a href="bebes.jsp?p=1"><img src="images/home.png" width="32" height="34"></a> <a href="bebes.jsp?p=<%=psig%>"><img src="images/sig.png" width="32" height="33"></a></div> 
        	
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
          <li><a href="politica-de-privacidad.jsp">&bull; Política de Privacidad</a></li>
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
  <div class="logo"><a href=""></a></div>
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
  <a href="http://www.facebook.com/porta7m" target="_blank" name="fb"></a> <a href="http://twitter.com/" target="_blank" name="tw"></a> <a href="http://" target="_blank" name="gp"></a> <a href="" target="_blank" name="sk"></a></div>
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
 
<script src="js/jquery.bgscroll.js"></script> 
<script src="js/jquery.jcarousel.min.js"></script> 
<script src="js/easySlider1.5.js"></script> 

<script src="js/jquery.validate.js"></script>
<script src="js/jquery.infieldlabel.min.js"></script>

<script src="ThickBox/thickbox.js" type="text/javascript"></script> 
<!-- this is where we put our custom functions --> 
<script src="js/functions.js"></script> 

			<script>
			$(document).ready(function(){
				$('#wrapper').addClass('background');
				$('#container').addClass('clouds');		
			});
			</script> 
<script type="text/javascript"> 

jQuery(document).ready(function() {

	jQuery('#mycarousel').jcarousel({
		wrap: 'circular',
		scroll: 3
	});	
	
	/******/

	
    $("#mycarousel li a").click(function(){
		
		//alert("sdas")
    
        var largePath = $(this).attr("href");
        var largeAlt = $(this).attr("title");
        $("#largeImg").attr({ src: largePath, alt: largeAlt }); 
        $("#contexto p").html(largeAlt); return false;
    });
	
	
});


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
<%}catch (SQLException ex) {
                        System.out.println(ex.toString());
                    } %>