// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require activestorage
//= require turbolinks
//= require_tree .


function obtenerTiempo(){
        var hoy = new Date(); 
        var h = hoy.getDate();
        var m = hoy.getMonth()+1;
        var s = hoy.getFullYear();
        document.getElementById("fecha").innerHTML = h+"-"+m+"-"+s;
        //Ejecuta la función f cada 600 ms
        var t = setTimeout(function(){obtenerTiempo()},600);
}

$.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            if (regexp.constructor != RegExp)
                regexp = new RegExp(regexp);
            else if (regexp.global)
                regexp.lastIndex = 0;
            return this.optional(element) || regexp.test(value);
        },
        "Please check your input."
);