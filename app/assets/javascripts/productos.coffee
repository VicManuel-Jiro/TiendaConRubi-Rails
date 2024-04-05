# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_productos').validate
		rules:
			'producto[codigo_barras]':
				required: true
				minlength: 11
				maxlength: 14
				number: true
				remote:
					url: '/validar_codigo_producto'
					type: 'GET'
					data: 
						producto_id: ->
							return $('#producto_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'producto[nombre]':
				required: true
				rangelength: [3, 50]
			'producto[descripcion]':
				required: true
				rangelength: [3, 50]
			'producto[categoria]':
				required: true
				rangelength: [3, 30]
			'producto[color]':
				required: true
				rangelength: [3, 20]
			'producto[proveedor_id]':
				required: true
			'producto[existencia]':
				required: true
				number: true
			'producto[descuento]':
				required: true
				number: true
			'producto[precio]':
				required: true
				number: true
		messages:
			'producto[codigo_barras]':
				required: 'Por favor ingrese un codigo de barras'
				number: 'Por favor ingrese solo numeros'
				minlength: 'Por favor ingrese un codigo valido de minimo 11 caracteres'
				maxlength: 'Por favor ingrese un codigo valido de maximo 14 caracteres'
				remote: 'El codigo ya existe'
			'producto[nombre]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese un titulo de 3 a 50 caracteres'
			'producto[descripcion]':
				required: 'Por favor ingrese una descripcion'
				rangelength: 'Por favor ingrese una descripcion de 3 a 50 caracteres'
			'producto[categoria]':
				required: 'Por favor ingrese una categoria(ej. tecnologia)'
				rangelength: 'Por favor ingrese un nombre de 3 a 30 caracteres'
			'producto[color]':
				required: 'Por favor ingrese un color'
				rangelength: 'Por favor ingrese una edicion de 3 a 20 caracteres'
			'producto[existencia]':
				required: 'Por favor ingrece la existencia'
				number: 'Por favor solo ingrese numeros'
			'producto[precio]':
				required: 'Por favor ingrece un precio'
				number: 'Por favor solo ingrese numeros'
			'producto[descuento]':
				required: 'Por favor ingrece un descuento del 0 al 100 (ej. 0)'
				number: 'Por favor solo ingrese numeros'
			'producto[proveedor_id]':
				required: 'Por favor ingrese un proveedor'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)