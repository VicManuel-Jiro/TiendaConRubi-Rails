# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_consolas').validate
		rules:
			'consola[nombre]':
				required: true
				rangelength: [3, 50]
			'consola[plataforma_id]':
				required: true
			'consola[color]':
				required: true
				rangelength: [3, 20]
			'consola[edicion]':
				required: true
				rangelength: [3, 50]
			'consola[capacidad]':
				required: true
				number: true
			'consola[existencia]':
				required: true
				number: true
			'consola[precio]':
				required: true
				number: true
			'consola[descuento]':
				required: true
				number: true
			'consola[codigo_barras]':
				required: true
				number: true
				rangelength: [11, 14]
				remote:
					url: '/validar_codigo_consola'
					type: 'GET'
					data: 
						consola_id: ->
							return $('#consola_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
		messages:
			'consola[nombre]':
				required: 'Por favor ingrese un consola'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'consola[plataforma_id]':
				required: 'Por favor ingrese una plataforma'
			'consola[color]':
				required: 'ingrese un color'
				rangelength: 'Por favor ingrese al menos 3 y maximo 20 caracteres'
			'consola[edicion]':
				required: 'Por favor ingrese un consola'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'consola[capacidad]':
				required: 'Por favor ingrese una capacidad en GB'
				number: 'Por favor ingrese solo numeros'
			'consola[existencia]':
				required: 'Por favor ingrese la cantidad en existencia'
				number: 'Por favor ingrese solo numeros'
			'consola[precio]':
				required: 'Por favor ingrese el precio unitario'
				number: 'Por favor ingrese solo numeros'
			'consola[descuento]':
				required: 'Por favor ingrese un descuento del 0 a 100 (ej. 0)'
				number: 'Por favor ingrese solo numeros'
			'consola[codigo_barras]':
				required: 'Por favor ingrese el codigo de barras'
				number: 'Por favor ingrese solo numeros'
				rangelength: 'Por favor ingrese al menos 11 y maximo 14 caracteres'
				remote: 'El codigo de barras ya existe'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
