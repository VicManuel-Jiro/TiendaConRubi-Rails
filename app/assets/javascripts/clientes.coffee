ready = ->
	validator = $('#formulario_clientes').validate
		rules:
			'cliente[rfc]':
				required: true
				minlength: 13
				maxlength: 13
				regex: "^(([A-ZÑ&]{4})([0-9]{2})([0][13578]|[1][02])(([0][1-9]|[12][\\d])|[3][01])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([0-9]{2})([0][13456789]|[1][012])(([0][1-9]|[12][\\d])|[3][0])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([02468][048]|[13579][26])[0][2]([0][1-9]|[12][\\d])([A-Z0-9]{3}))|" +"(([A-ZÑ&]{4})([0-9]{2})[0][2]([0][1-9]|[1][0-9]|[2][0-8])([A-Z0-9]{3}))$"
				remote:
					url: '/validar_rfc_cliente'
					type: 'GET'
					data: 
						cliente_id: ->
							return $('#cliente_id').val()
					datatype: 'json'
					dataFilter: (txtResponse) ->
						resultado = $.parseJSON(txtResponse)
						if resultado.validar
							return true
						else
							return false
			'cliente[nombre]':
				required: true
				rangelength: [3, 50]
			'cliente[paterno]':
				required: true
				rangelength: [3, 50]
			'cliente[materno]':
				required: true
				rangelength: [3, 50]
			'cliente[telefono]':
				required: true
				number: true
				minlength: 10
				maxlength: 10
			'cliente[correo]':
				required: true
				email: true
			'cliente[estado_id]':
				required: true
			'cliente[cp]':
				required: true
				number: true
				minlength: 5
				maxlength: 5
			'cliente[calle]':
				required: true
				rangelength: [3, 50]
			'cliente[numero]':
				required: true
				number: true
		messages:
			'cliente[rfc]':
				required: 'Por favor ingrese un RFC'
				minlength: 'Por favor ingrese un RFC valido de 13 caracteres'
				maxlength: 'Por favor ingrese un RFC valido de 13 caracteres'
				regex: 'Ingrese un RFC valido'
				remote: 'El RFC ya existe'
			'cliente[nombre]':
				required: 'Por favor ingrese un nombre'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'cliente[paterno]':
				required: 'Por favor ingrese un apellido'
				rangelength: 'Por favor ingrese un apellido de 3 a 50 caracteres'
			'cliente[materno]':
				required: 'Por favor ingrese un apellido'
				rangelength: 'Por favor ingrese un apellido de 3 a 50 caracteres'
			'cliente[telefono]':
				required: 'Por favor ingrese un telefono'
				number: 'Por favor ingrese solo numeros'
				minlength: 'Por favor ingrese 10 numeros'
				maxlength: 'Por favor ingrese solo 10 numeros'
			'cliente[correo]':
				required: 'Por favor ingrese un correo'
				email: 'Por favor ingrese un correo valido'
			'cliente[estado_id]':
				required: 'Seleccione un estado'
			'cliente[cp]':
				required: 'Por favor ingrese un codigo postal'
				number: 'Por favor ingrese solo numeros'
				minlength: 'Por favor ingrese 5 numeros'
				maxlength: 'Por favor ingrese solo 5 numeros'
			'cliente[calle]':
				required: 'Por favor ingrese una calle'
				rangelength: 'Por favor ingrese un nombre de 3 a 50 caracteres'
			'cliente[numero]':
				required: 'Por favor ingrese un numero'
				number: 'Por favor ingrese solo numeros'
$(document).ready(ready)
$(document).on('turbolinks:load',ready)