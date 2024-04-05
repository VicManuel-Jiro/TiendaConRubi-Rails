# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_proveedores').validate
		rules:
			'proveedor[rfc]':
				required: true
				minlength: 13
				maxlength: 13
				regex: "^(([A-ZÑ&]{4})([0-9]{2})([0][13578]|[1][02])(([0][1-9]|[12][\\d])|[3][01])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([0-9]{2})([0][13456789]|[1][012])(([0][1-9]|[12][\\d])|[3][0])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([02468][048]|[13579][26])[0][2]([0][1-9]|[12][\\d])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([0-9]{2})[0][2]([0][1-9]|[1][0-9]|[2][0-8])([A-Z0-9]{3}))$"
				remote:
					url: '/validar_rfc_proveedor'
					type: 'GET'
					data: 
						proveedor_id: ->
							return $('#proveedor_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'proveedor[nombre]':
				required: true
				rangelength: [3, 50]
			'proveedor[paterno]':
				required: true
				rangelength: [3, 50]
			'proveedor[materno]':
				required: true
				rangelength: [3, 50]
			'proveedor[telefono]':
				required: true
				number: true
				minlength: 10
				maxlength: 10
			'proveedor[correo]':
				required: true
				email: true
			'proveedor[direccion]':
				required: true
				rangelength: [3, 50]
			'proveedor[comision]':
				required: true
				number: true
		messages:
			'proveedor[rfc]':
				required: 'Por favor ingrese un RFC'
				minlength: 'Por favor ingrese un RFC valido de 13 caracteres'
				maxlength: 'Por favor ingrese un RFC valido de 13 caracteres'
				regex: 'Ingrese un RFC valido'
				remote: 'El RFC ya existe'
			'proveedor[nombre]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'proveedor[paterno]':
				required: 'Por favor ingrese un apellido'
				rangelength: 'Por favor ingrese un apellido de 3 a 50 caracteres'
			'proveedor[materno]':
				required: 'Por favor ingrese un apellido'
				rangelength: 'Por favor ingrese un apellido de 3 a 50 caracteres'
			'proveedor[telefono]':
				required: 'Por favor ingrese un telefono'
				number: 'Por favor ingrese solo numeros'
				minlength: 'Por favor ingrese un telefono valido a 10 caracteres'
				maxlength: 'Por favor ingrese un telefono valido a 10 caracteres'
			'proveedor[correo]':
				required: 'Por favor ingrese un correo'
				email: 'Por favor ingrese un correo valido'
			'proveedor[direccion]':
				required: 'Por favor ingrese un nombre de proveedor'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'proveedor[comision]':
				required: 'Requerido'
				number: 'Por favor ingrese solo numeros'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
