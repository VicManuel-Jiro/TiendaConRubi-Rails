# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_plataformas').validate
		rules:
			'plataforma[nombre]':
				required: true
				rangelength: [3, 50]
				remote:
					url: '/validar_nombre_plataforma'
					type: 'GET'
					data: 
						plataforma_id: ->
							return $('#plataforma_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false

			'plataforma[empresa]':
				required: true
				rangelength: [3, 50]
			'plataforma[tipo_empresa]':
				required: true
				rangelength: [3, 50]
			'plataforma[tipo]':
				required: true
				rangelength: [3, 50]
			'plataforma[tipo_dispositivo]':
				required: true
				rangelength: [3, 10]
			'plataforma[sitio]':
				required: true
				rangelength: [3, 50]
			'plataforma[fundador]':
				required: true
				rangelength: [3, 50]
			'plataforma[sede]':
				required: true
				rangelength: [3, 50]
			'plataforma[ceo]':
				required: true
				rangelength: [3, 50]
		messages:
			'plataforma[nombre]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
				remote: 'la plataforma ya existe'
			'plataforma[empresa]':
				required: 'Por favor ingrese un nombre de empresa'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
			'plataforma[tipo_empresa]':
				required: 'Por favor ingrese el tipo de empresa (ej. sociedad anonima)'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
			'plataforma[tipo]':
				required: 'Por favor ingrese un tipo (ej. videojuegos)'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
			'plataforma[tipo_dispositivo]':
				required: 'Por favor ingrese un tipo (ej. computador)'
				rangelength: 'Por favor ingrese de 3 a 10 caracteres'
			'plataforma[sitio]':
				required: 'Por favor ingrese un sitio web'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
			'plataforma[fundador]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
			'plataforma[sede]':
				required: 'Por favor ingrese una sede'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
			'plataforma[ceo]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese de 3 a 50 caracteres'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
