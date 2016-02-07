
﻿// JavaScript Document
// wait until document is fully scriptable
/********************************************/

/************COMIENZA - MANEJA LOS POPUPS****/
$("#boton_r").click(function(e){
      parent.tb_remove();
      setTimeout("tb_show('Registro','#TB_inline?height=770&width=412&inlineId=Register', null)",350);
});	
/************TERMINA- MANEJA LOS POPUPS****/

$("#boton_registrar").click(function(e){
	var r_clave = $("#r_clave").val();
	var r_clave2= $("#r_clave2").val();

	if( r_clave != r_clave2 )
		{
			e.preventDefault();
			$("#r_clave").addClass("error");
			$("#r_clave2").addClass("error");
			parent.tb_remove();
			setTimeout("tb_show('Error','#TB_inline?height=140&width=390&inlineId=claves_diferentes', null)",350);

		}
});

$("#r_select_paises").change(function(){
	var id_pais = $("#r_select_paises option:selected").attr("atributo");
	var nombre_pais = $("#r_select_paises option:selected").html();
	$("#hidden_register_pais").val( id_pais );
	$("#hidden_register_nombre_pais").val( nombre_pais );
	$("#r_select_ciudades").removeAttr("disabled");
/*CAMBIADO EL 27/11/2011
	$.ajax({
	   type: "POST",
	   data: "id_pais="+id_pais,
	   url: "include/get_ciudades.php",
	   success: function(msg){
				$("#r_select_ciudades").html(msg);
				$("#r_select_ciudades").removeAttr("disabled");
			}
	});	
/**************/	
});	

$("#r_select_ciudades").change(function(){
	var id_ciudad = $("#r_select_ciudades option:selected").attr("atributo");
	var nombre_ciudad = $("#r_select_ciudades option:selected").html();
	$("#hidden_register_ciudad").val( id_ciudad );
	$("#hidden_register_nombre_ciudad").val( nombre_ciudad );
    $("#r_select_distritos").removeAttr("disabled");

/*CAMBIADO EL 27/11/2011
	$.ajax({
	   type: "POST",
	   data: "id_ciudad="+id_ciudad,
	   url: "include/get_distritos.php",
	   success: function(msg){
				$("#r_select_distritos").html(msg);
                $("#r_select_distritos").removeAttr("disabled");
			}
	});	
/**************/
});	

$("#r_select_distritos").change(function(){
	var id_distrito = $("#r_select_distritos option:selected").attr("atributo");
	var nombre_distrito = $("#r_select_distritos option:selected").html();
	$("#hidden_register_distrito").val( id_distrito );
	$("#hidden_register_nombre_distrito").val( nombre_distrito );
	
});	
/*******************************************/
/********************************************/
function a_entero(valor){  
   //intento convertir a entero.  
   //si era un entero no le afecta, si no lo era lo intenta convertir  
   valor = parseInt(valor);  
  
    //comprobamos si es un valor entero  
    if (isNaN(valor)) {  
          //no es entero 0  
          return 0;  
    }else{  
          //es un valor entero  
          return valor;  
    }  
}  

function trim( str ){
      return str.replace(/^\s*|\s*$/g,"");
}
function a_moneda( numero ){
  var salida = '';
	if( numero.indexOf (".", 0) == -1 )
                salida = numero + ".00";
        else
                salida = numero; 
  return salida;
}	

function aleatorio(a,b) {

  return Math.round(Math.random()*(b-a)+a);

}
function agregar_a_carrito( producto_id, producto_imagen, producto_nombre, producto_link, producto_precio, id_detalle_lista )
{
var identificador = producto_id +"_"+aleatorio(10, 1000000);
		$.ajax({
		   type: "POST",
		   url: "include/agregar_a_carrito.php",
		   data:         "identificador="+identificador+
                                 "&producto_id="+producto_id+
		   		 "&producto_imagen="+producto_imagen+
		   		 "&producto_nombre="+producto_nombre+
				 "&producto_link="+producto_link+
				 "&producto_precio="+producto_precio+
				 "&id_detalle_lista="+id_detalle_lista,
		   success: function(msg){
			 	//alert( "Se agregó este producto a su carrito: " + producto_nombre );
			 	var productos = $("div.shop p").html();
				if( productos != '' && productos != null )
				{
					var cantidad = productos.split("<br>");
					var cantidad_productos = a_entero( cantidad[0] )+1;
					$("div.shop p").html( cantidad_productos.toString() +"<br><span>• PRODUCTOS •</span>");
				}
					$("#hidden_identificador").val( identificador );				
		   }
		 });
}

function eliminar_producto( identificador )
{
		$.ajax({
		   type: "POST",
		   data: "identificador="+identificador,
		   url: "include/eliminar_producto.php",
		   success: function(msg){
		   			var subtotal = msg;
					var precio_delivery = $("#hidden_delivery").val();
					var total = $("#hidden_total").val();
					var total = parseFloat(subtotal) + parseFloat(precio_delivery);
					
					$("#hidden_subtotal").val(subtotal);
					$("#hidden_total").val(total);
					
					$("#subtotal").html("SUB TOTAL S/. "+a_moneda(subtotal) );
					$("#total").html("TOTAL S/. "+a_moneda(String(total)) );
					
					$("div#"+identificador).hide(1000, function () {
						$(this).remove();
					  });

				}
		});
}

function eliminar_producto_regalo( identificador )
{
		$.ajax({
		   type: "POST",
		   data: "identificador="+identificador,
		   url: "include/eliminar_producto_regalo.php",
		   success: function(msg){
		   			var subtotal = msg;
					var precio_delivery = $("#hidden_delivery").val();
					var total = $("#hidden_total").val();
					var total = parseFloat(subtotal) + parseFloat(precio_delivery);
					
					$("#hidden_subtotal").val(subtotal);
					$("#hidden_total").val(total);
					
					$("#subtotal").html("SUB TOTAL S/. "+a_moneda(subtotal) );
					$("#total").html("TOTAL S/. "+a_moneda(String(total)) );
					
					$("div#"+identificador).hide(1000, function () {
						$(this).remove();
					  });

				}
		});
}

function getCantidadProductos_lazo()
{
		$.ajax({
		   type: "GET",
		   url: "include/getCantidadProductos.php",
		   success: function(msg){
   					$("div.shop p").html(msg+"<br><span>• PRODUCTOS •</span>");

				}
		});
};

$(document).ready(function() {
       getCantidadProductos_lazo();
});



$(document).ready(function() {
	var todos = "todos";
		$.ajax({
		   type: "POST",
		   data: "todos="+todos,		   
		   url: "include/get_paises.php",
		   success: function(msg){
					$("#r_select_paises").html(msg);
				}
		});	

		$.ajax({
		   type: "POST",
		   data: "todos="+todos,
		   url: "include/get_ciudades.php",
		   success: function(msg){
					$("#r_select_ciudades").html(msg);
				}
		});	

		$.ajax({
		   type: "POST",
		   data: "todos="+todos,
		   url: "include/get_distritos.php",
		   success: function(msg){
					$("#r_select_distritos").html(msg);
				}
		});			
});



/**********************************************/
$(function() {	
	/* LOADING PAGE*/
	//QueryLoader.init();
	
	/*$(window).load(function(){
		var clas = $("#container").attr('Class');
		if(clas == 'star'){
			//alert(clas)
			//setInterval("$('#container .star').animate({opacity: 0.25},1500)",1500);
			$('.star').show(300).delay(800).animate({opacity: 0.25},1500);
		}
	});*/
	
	//setInterval(alert("hello"),1000)
	
	$('.shop').mouseenter(
		function(){
			$('#slider .imagen .shop p').css({color:'#993300'});
		}
	);
	$('.shop').mouseleave(
		function(){
			$('#slider .imagen .shop p').css({color:''});
		}
	);
	
	$(".iconUser").click(
		function(e){
			$(this).find(".formLogin").fadeIn("slow","swing");
		}
	);
	
	$(".iconUser").mouseleave(
		function(){
			$(this).find(".formLogin").fadeOut("slow", "swing");
			$(this).find(".pwdRecovery").hide();
			$(this).find(".footerLogin").removeClass("footerLogin1");
		}
	); 
	
	$('.imagen .shop').mouseenter(
		function(){
			$('#slider .imagen .shop p').css({color:'#993300'});
		}
	);
	$('.imagen .shop').mouseleave(
		function(){
			$('#slider .imagen .shop p').css({color:''});
		}
	);
	
	$('#container').bgscroll({scrollSpeed:100 , direction:'h', heading: 'l'});
	
	$('#menuCat ul li:has(ul)').click(
		function(e)
			{$(this).parents('ul').find('ul').hide("slow","swing"); $(this).find('ul').fadeToggle();},
		function(e)
			{$(this).find('ul').fadeToggle();}
	);
	
	$(".iconUser").click(
		function(e){
			$(this).find(".formLogin").fadeIn("slow","swing");
		}
	);
	
	$(".iconUser").mouseleave(
		function(){
			$(this).find(".formLogin").fadeOut("slow", "swing");
			$(this).find(".pwdRecovery").hide();
			$(this).find(".footerLogin").removeClass("footerLogin1");
		}
	); 
	
});

//styled select
(function($){
 $.fn.extend({
 
 	customStyle : function(options) {
	  if(!$.browser.msie || ($.browser.msie&&$.browser.version>6)){
	  return this.each(function() {
	  
			var currentSelected = $(this).find(':selected');
			$(this).after('<span class="customStyleSelectBox"><span class="customStyleSelectBoxInner">'+currentSelected.text()+'</span></span>').css({position:'absolute', opacity:0,fontSize:$(this).next().css('font-size')});
			var selectBoxSpan = $(this).next();
			var selectBoxWidth = parseInt($(this).width()) - parseInt(selectBoxSpan.css('padding-left')) -parseInt(selectBoxSpan.css('padding-right'));			
			var selectBoxSpanInner = selectBoxSpan.find(':first-child');
			selectBoxSpan.css({display:'inline-block'});
			selectBoxSpanInner.css({width:selectBoxWidth, display:'inline-block'});
			var selectBoxHeight = parseInt(selectBoxSpan.height()) + parseInt(selectBoxSpan.css('padding-top')) + parseInt(selectBoxSpan.css('padding-bottom'));
			$(this).height(selectBoxHeight).change(function(){
				selectBoxSpanInner.text($(this).val()).parent().addClass('changed');
			});
			
	  });
	  }
	}
 });
})(jQuery);

$(function(){
	$('select.styled').customStyle();
});

//styled select1
(function($){
 $.fn.extend({
 
 	customStyle1 : function(options) {
	  if(!$.browser.msie || ($.browser.msie&&$.browser.version>6)){
	  return this.each(function() {
	  
			var currentSelected = $(this).find(':selected');
			$(this).after('<span class="customStyleSelectBox1"><span class="customStyleSelectBoxInner1">'+currentSelected.text()+'</span></span>').css({position:'absolute', opacity:0,fontSize:$(this).next().css('font-size')});
			var selectBoxSpan = $(this).next();
			var selectBoxWidth = parseInt($(this).width()) - parseInt(selectBoxSpan.css('padding-left')) -parseInt(selectBoxSpan.css('padding-right'));			
			var selectBoxSpanInner = selectBoxSpan.find(':first-child');
			selectBoxSpan.css({display:'inline-block'});
			selectBoxSpanInner.css({width:selectBoxWidth, display:'inline-block'});
			var selectBoxHeight = parseInt(selectBoxSpan.height()) + parseInt(selectBoxSpan.css('padding-top')) + parseInt(selectBoxSpan.css('padding-bottom'));
			$(this).height(selectBoxHeight).change(function(){
				selectBoxSpanInner.text($(this).val()).parent().addClass('changed');
			});
			
	  });
	  }
	}
 });
})(jQuery);

$(function(){
	$('select.styled1').customStyle1();
});

//validator
/*(function($){
  $.fn.validator = function(opts){
	  
	$(this).find('.error').live('keyup', function(){
      if($(this).val()!=""){
          $(this).removeClass('error');
      }
    });
	
    return $(this).submit(function(evt){		
      	$(this).find('.required').each(function(){			  				  	
			var data = $(this).attr('alt');
			if ($(this).attr('value') == '' | $(this).attr('value') == data){
				$(this).addClass('error');
				//var data1 = $("#contact div.errores").text();
				//var errores = "<p>"+data+"</p>";
				//var data2 = data1 + errores;
				//$("#contact div.errores").html(data2);
				evt.preventDefault();
			}
      });
	  
      $(this).find('.error').first().focus();
    });
  };
})(jQuery);

$("#news").validator();
$('#contact').validator();
$('#registerUser').validator();
$("#ForgotPwd").validator();
$("#delivery").validator();*/
//$("#logeo").validator();


(function( $ ){
  // define the initialValue() function
  $.fn.initialValue = function(value) {
    if (value) {
      return this.attr('initial-value', value);
    } else {
      return this.attr('initial-value');
    }
  };
  
  $.fn.clearInput = function() {
    return this
      .focus(function(){
        if (this.value == $(this).initialValue()) {
          this.value = '';
        }
      })
      .blur(function(){
        if (this.value == '') {
          this.value = $(this).initialValue();		  
        }
      })
      .each(function(index, elt) {
        $(this).initialValue(this.value);
      });
  };

  // apply plugin to all inputs with class ".clear-input"
  $(function() {
    $('input.clear-input').clearInput();
	$('textarea.clear-input').clearInput();
  });
})( jQuery );


//AGREGAR MAS CAMPOS
jQuery.fn.generaNuevosCampos = function(nombreCampo, nombreCampo1, indice){
	$(this).each(function(){
		elem = $(this);
		//elem.data("etiqueta",etiqueta);
		elem.data("nombreCampo",nombreCampo);
		elem.data("nombreCampo1",nombreCampo1);
		elem.data("indice",indice);
		
		elem.click(function(e){
			e.preventDefault();
			elem = $(this);
			//etiqueta = elem.data("etiqueta");
			nombreCampo = elem.data("nombreCampo");
			indice = elem.data("indice");

/*			
			texto_insertar ='<p class="input"><input type="text" class="InputW2 required span-2" name="' + nombreCampo + indice + '" id="' + nombreCampo + indice + '" value="Nombre y Apellido"></p><p class="input1"><input type="text" class="InputW2 required email" name="' + nombreCampo1 + indice + '" id="' + nombreCampo1 + indice + '" value="Correo Eléctronico"></p>';
*/		

/**************AGREGADO EL 28/02/2012*************/
			texto_insertar ='<p class="input"><label class="lbl" for="' + nombreCampo + indice + '">Nombre y Apellido</label><input type="text" class="InputW2 required span-2" name="' + nombreCampo + indice + '" id="' + nombreCampo + indice + '"></p><p class="input1"><label class="lbl" for="' + nombreCampo1 + indice + '">Correo Electrónico</label><input type="text" class="InputW2 required email" name="' + nombreCampo1 + indice + '" id="' + nombreCampo1 + indice + '"></p>';
/************************************************/

			indice ++;
			elem.data("indice",indice);
			nuevo_campo = $(texto_insertar);
			elem.before(nuevo_campo);


                        $("label.lbl").inFieldLabels();


		});
	});
	return this;
}

$(document).ready(function(){
	
	$("#mascampos").generaNuevosCampos("nombre", "email", 5);
	
	$(".box4 a.delete").click(function(){
		$(this).parents(".box4").animate({ opacity: "hide" }, "slow");
	});
	
	$("label.lbl").inFieldLabels();	
	//$("label.lbl1").inFieldLabels();	
	$("input").attr("autocomplete","off");
	
	$(".register").validate();
	$(".logeo").validate();
	$(".news").validate();
	$(".babyList").validate();
	$(".contactList").validate();
	$(".shopping-cart").validate();
	$(".eCommerceProcess").validate();
	$('.delivery').validate();
	$('.recoveryPwd').validate();
	$('.ForgotPwd').validate();
	$('.myAccount').validate();
	//$('.form_s_y_c').validate();
});