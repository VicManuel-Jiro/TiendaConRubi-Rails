# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_juegos').validate
		rules:
			'juego[titulo]':
				required: true
				rangelength: [3, 50]
			'juego[plataforma_id]':
				required: true
			'juego[juego_id]':
				required: true
			'juego[edicion]':
				required: true
				rangelength: [3, 50]
			'juego[genero]':
				required: true
				rangelength: [3, 50]
			'juego[clasificacion]':
				required: true
				maxlength: 3
			'juego[casa_productora_id]':
				required: true
			'juego[existencia]':
				required: true
				number: true
			'juego[precio]':
				required: true
				number: true
			'juego[descuento]':
				required: true
				number: true
			'juego[codigo_barras]':
				required: true
				number: true
				rangelength: [11, 14]
				remote:
					url: '/validar_codigo'
					type: 'GET'
					data: 
						juego_id: ->
							return $('#juego_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
		messages:
			'juego[titulo]':
				required: 'Por favor ingrese un titulo'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'juego[plataforma_id]':
				required: 'Por favor ingrese una plataforma'
			'juego[juego_id]':
				required: 'Por favor seleccione una opcion'
			'juego[edicion]':
				required: 'ingrese una edicion'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'juego[genero]':
				required: 'Por favor ingrese un genero'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'juego[clasificacion]':
				required: 'Por favor ingrese una clasificacion (ej. M)'
				maxlength: 'Ingrese maximo 3 caracteres'
			'juego[casa_productora_id]':
				required: 'Por favor seleccione una casa productora'
			'juego[existencia]':
				required: 'Por favor ingrese una existencia'
				number: 'por favor ingrese solo numeros'
			'juego[precio]':
				required: 'Por favor ingrese el precio unitario'
				number: 'Por favor ingrese solo numeros'
			'juego[descuento]':
				required: 'Por favor ingrese un descuento del 0 a 100 (ej. 0)'
				number: 'Por favor ingrese solo numeros'
			'juego[codigo_barras]':
				required: 'Por favor ingrese el codigo de barras'
				number: 'Por favor ingrese solo numeros'
				rangelength: 'Por favor ingrese al menos 11 y maximo 14 caracteres'
				remote: 'El codigo de barras ya existe'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
