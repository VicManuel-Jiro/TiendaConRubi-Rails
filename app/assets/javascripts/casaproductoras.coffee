# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_casaproductoras').validate
		rules:
			'casaproductora[nombre]':
				required: true
				rangelength: [3, 50]
			'casaproductora[fundador]':
				required: true
				rangelength: [3, 50]
			'casaproductora[ceo]':
				required: true
				rangelength: [3, 50]
			'casaproductora[sitio]':
				required: true
				regex: /^(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$/
				rangelength: [3, 50]
			'casaproductora[telefono]':
				required: true
				number: true
				minlength: 10
				maxlength: 10
			'casaproductora[atencion_clientes]':
				required: true
				rangelength: [3, 50]
			'casaproductora[sede]':
				required: true
				rangelength: [3, 50]
			'casaproductora[twitter]':
				required: true
				regex: /@([A-Za-z0-9_]{1,15})/
				rangelength: [3, 50]
		messages:
			'casaproductora[nombre]':
				required: 'Por favor ingrese una casa productora'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'casaproductora[fundador]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'casaproductora[ceo]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'casaproductora[sitio]':
				required: 'Por favor ingrese un sitio web'
				regex: 'Por favor ingrese un sitio web valido'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'casaproductora[telefono]':
				required: 'Por favor ingrese un telefono'
				number: 'Por favor ingrese solo numeros'
				minlength: 'Por favor ingrese 10 caracteres'
				maxlength: 'Por favor ingrese 10 caracteres'
			'casaproductora[atencion_clientes]':
				required: 'Por favor ingrese un contacto'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'casaproductora[sede]':
				required: 'Por favor ingrese una sede'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
			'casaproductora[twitter]':
				required: 'Por favor ingrese un twitter'
				regex: 'Por favor ingrese un twitter valido (@algo)'
				rangelength: 'Por favor ingrese al menos 3 y maximo 50 caracteres'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)