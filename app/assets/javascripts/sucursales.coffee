# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_sucursales').validate
		rules:
			'sucursal[no_identificador]':
				required: true
				number: true
				remote:
					url: '/validar_no_sucursal'
					type: 'GET'
					data: 
						sucursal_id: ->
							return $('#sucursal_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'sucursal[calle]':
				required: true
				rangelength: [3, 30]
			'sucursal[numero]':
				required: true
				number: true
			'sucursal[nombre]':
				required: true
				rangelength: [3, 50]
			'sucursal[estado_id]':
				required: true
		messages:
			'sucursal[no_identificador]':
				required: 'ingrese un identificador'
				number: 'ingrese solo numeros'
				remote: 'el identificador ya existe'
			'sucursal[calle]':
				required: 'ingrese una calle'
				rangelength: 'ingrese entre 3 y 30 caracteres'
			'sucursal[numero]':
				required: 'ingrese un numero'
				number: 'ingrese solo numeros'
			'sucursal[nombre]':
				required: 'ingrese un nombre'
				rangelength: 'ingrese un nombre de sucursal de 3 a 50 caracteres'
			'sucursal[estado_id]':
				required: 'ingrese un estado'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
