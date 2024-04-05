# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_estados').validate
		rules:
			'estado[nombre]':
				required: true
				rangelength: [3, 50]
			'estado[descripcion]':
				required: true
				rangelength: [3, 50]
			'estado[pais_id]':
				required: true
		messages:
			'estado[nombre]':
				required: 'Por favor ingrese un estado'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'estado[descripcion]':
				required: 'Por favor ingrese una descripcion'
				rangelength: 'Por favor ingrese una descripcion de al menos 3 y maximo 50 caracteres'
			'estado[pais_id]':
				required: 'seleccione un pais'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)

