# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_pedidos').validate
		rules:
			'cliente_id':
				required: true
			'total':
				required: true
				number: true
			'descuento':
				required: true
				number: true
			'cp':
				required: true
				number: true
				minlenght: 5
				maxlenght: 5
			'calle':
				required: true
				rangelength: [3, 50]
			'numero':
				required: true
				number: true
			'sucursal_id':
				required: true
			'urgencia':
				required: true
		messages:
			'cliente_id':
				required: 'Por favor ingrese un cliente'
			'total':
				required: 'Por favor ingrese el total'
				number: 'Por favor ingrese solo numeros'
			'descuento':
				required: 'Por favor ingrese un descuento del 0 al 100'
				number: 'Por favor solo ingrese numeros'
			'cp':
				required: 'Por favor ingrese un codigo postal'
				number: 'Por favor ingrese  solo numeros'
				minlenght: 'Ingrese 5 numeros'
				maxlenght: 'Ingrese solo 5 numeros'
			'calle':
				required: 'Por favor ingrese una calle'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'sucursal_id':
				required: 'Por favor ingrese una sucursal'
			'numero':
				required: 'Por favor ingrece un numero de vivienda'
				number: 'Por favor solo ingrese numeros'
			'urgencia':
				required: 'Por favor ingrese si/no'
	validator = $('#form_pedidos').validate
		rules:
			'pedido[cliente_id]':
				required: true
			'pedido[total]':
				required: true
				number: true
			'pedido[descuento]':
				required: true
				number: true
			'pedido[cp]':
				required: true
				number: true
				minlenght: 5
				maxlenght: 5
			'pedido[calle]':
				required: true
				rangelength: [3, 50]
			'pedido[numero]':
				required: true
				number: true
			'pedido[sucursal_id]':
				required: true
			'pedido[urgencia]':
				required: true
		messages:
			'pedido[cliente_id]':
				required: 'Por favor ingrese un cliente'
			'pedido[total]':
				required: 'Por favor ingrese el total'
				number: 'Por favor ingrese solo numeros'
			'pedido[descuento]':
				required: 'Por favor ingrese un descuento del 0 al 100'
				number: 'Por favor solo ingrese numeros'
			'pedido[cp]':
				required: 'Por favor ingrese un codigo postal'
				number: 'Por favor ingrese  solo numeros'
				minlenght: 'Ingrese 5 numeros'
				maxlenght: 'Ingrese solo 5 numeros'
			'pedido[calle]':
				required: 'Por favor ingrese una calle'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'pedido[sucursal_id]':
				required: 'Por favor ingrese una sucursal'
			'pedido[numero]':
				required: 'Por favor ingrece un numero de vivienda'
				number: 'Por favor solo ingrese numeros'
			'pedido[urgencia]':
				required: 'Por favor ingrese si/no'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
