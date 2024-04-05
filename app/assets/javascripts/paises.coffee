ready = ->
	validator = $('#formulario_paises').validate
		rules:
			'pais[nombre]':
				required: true
				rangelength: [3, 50]
			'pais[descripcion]':
				required: true
				rangelength: [2, 4]
		messages:
			'pais[nombre]':
				required: 'Por favor ingrese un pais'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'pais[descripcion]':
				required: 'Por favor ingrese una descripcion'
				rangelength: 'Por favor ingrese una descripcion de 2 a 4 caracteres'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)