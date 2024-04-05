# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	validator = $('#formulario_usuarios').validate
		rules:
			'usuario[rfc]':
				required: true
				minlength: 13
				maxlength: 13
				regex: "^(([A-ZÑ&]{4})([0-9]{2})([0][13578]|[1][02])(([0][1-9]|[12][\\d])|[3][01])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([0-9]{2})([0][13456789]|[1][012])(([0][1-9]|[12][\\d])|[3][0])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([02468][048]|[13579][26])[0][2]([0][1-9]|[12][\\d])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([0-9]{2})[0][2]([0][1-9]|[1][0-9]|[2][0-8])([A-Z0-9]{3}))$"
				remote:
					url: '/validar_rfc'
					type: 'GET'
					data: 
						usuario_id: ->
							return $('#usuario_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'usuario[curp]':
				required: true
				minlength: 18
				maxlength: 18
				regex: /^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$/
				remote:
					url: '/validar_curp'
					type: 'GET'
					data: 
						usuario_id: ->
							return $('#usuario_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'usuario[nombre]':
				required: true
				rangelength: [3, 50]
			'usuario[paterno]':
				required: true
				rangelength: [3, 50]
			'usuario[telefono]':
				required: true
				number: true
				minlength: 10
				maxlength: 10
			'usuario[correo]':
				required: true
				email: true
			'usuario[login]':
				required: true
				rangelength: [4, 8]
				remote:
					url: '/validar_login'
					type: 'GET'
					data: 
						usuario_id: ->
							return $('#usuario_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'usuario[password]':
				required: true
				rangelength: [5, 8]
				regex: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){5,8}$/
			'usuario[estado_id]':
				required: true
		messages:
			'usuario[rfc]':
				required: 'Por favor ingrese un RFC'
				minlength: 'Por favor ingrese un RFC valido de 13 caracteres'
				maxlength: 'Por favor ingrese un RFC valido de 13 caracteres'
				regex: 'Ingrese un RFC valido'
				remote: 'El RFC ya existe'
			'usuario[curp]':
				required: 'Por favor ingrese un CURP'
				minlength: 'Por favor ingrese un CURP valido de 18 caracteres'
				maxlength: 'Por favor ingrese un CURP valido de 18 caracteres'
				regex: 'Ingrese un CURP valido'
				remote: 'El CURP ya existe'
			'usuario[nombre]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'usuario[paterno]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese un apellido de 3 a 50 caracteres'
			'usuario[telefono]':
				required: 'Por favor ingrese un telefono'
				number: 'Por favor ingrese solo numeros'
				minlength: 'Por favor ingrese un telefono valido a 10 caracteres'
				maxlength: 'Por favor ingrese un telefono valido a 10 caracteres'
			'usuario[correo]':
				required: 'Por favor ingrese un correo'
				email: 'Por favor ingrese un correo valido'
			'usuario[login]':
				required: 'Por favor ingrese un nombre de usuario'
				rangelength: 'Por favor ingrese un nombre de usuario de 4 a 8 caracteres'
				remote: 'El usuario ya existe, ingrese otro'
			'usuario[password]':
				required: 'Requerido'
				rangelength: 'Ingrese un password de 5 a 8 caracteres'
				regex: 'Ingrese un password valido, al menos 1 numero, al menos 1 caracter especial, al menos 1 letra mayuscula, al menos 5 caracteres y maximo 8'
			'usuario[estado_id]':
				required: 'Seleccione un estado'
	validator = $('#formulario_login').validate
		rules:
			usuario:
				required: true
			password:
				required: true
		messages:
			usuario:
				required: 'Ingrese un usuario'
			password:
				required: 'Ingrese un password'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
