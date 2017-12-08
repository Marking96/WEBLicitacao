
$(document).ready(function () {
	$('#btnsalva').click(function (e){
		e.preventDefault();
		$('#formFun').ajaxSubmit({
			success: function(form){
				$('#id02').fadeOut();
				location.reload();
			}
		})
		
	});
});

$(document).ready(function () {
	$('#brnSetor').click(function (e){
		e.preventDefault();
		$('#FormSetor').ajaxSubmit({
			success: function(form){
				$('#id01').fadeOut();
				location.reload();
			}
		})
		
	});
});
//Script do menu
function menu() {
    $('.nav-toggle').click(function () {
        if ($(".nav").hasClass("side-fechado")) {
            $('.nav').animate({
                left: "0px",
            }, 100, function () {
                $(".nav").removeClass("side-fechado");
            });
        }
        else {
            $('.nav').animate({
                left: "-175px",
            }, 100, function () {
                $(".nav").addClass("side-fechado");
            });
        }
    });
}

//Menu Sidebar
$(window).resize(function () {
    var tamanhoJanela = $(window).width();
    $(".nav-toggle").remove();

    if (tamanhoJanela < 640) {
        $('.nav').css('left', '-175px').addClass('side-fechado');
        $('.nav').append("<div class='nav-toggle'><i class='material-icons'>menu</i></div>");
    } else {
        $('.nav').css('left', '0px').addClass('side-fechado');
    }

    menu();
});

$(document).ready(function () {
    var tamanhoJanela = $(window).width();
    $(".nav-toggle").remove();

    if (tamanhoJanela < 640) {
        $('.nav').css('left', '-175px').addClass('side-fechado');
        $('.nav').append("<div class='nav-toggle'><i class='material-icons'>menu</i></div>");
    } else {
        $('.nav').css('left', '0px').addClass('side-fechado');
    }

    menu();
});
//Fim do script do menu

//Script da Paginação tabela
function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;

    this.showRecords = function (from, to) {
        var rows = document.getElementById(tableName).rows;
        // i starts from 1 to skip table header row
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
    }

    this.showPage = function (pageNumber) {
        if (!this.inited) {
            alert("not inited");
            return;
        }

        var oldPageAnchor = document.getElementById('pg' + this.currentPage);
        oldPageAnchor.className = 'pg-normal';

        this.currentPage = pageNumber;
        var newPageAnchor = document.getElementById('pg' + this.currentPage);
        newPageAnchor.className = 'pg-selected';

        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
        this.showRecords(from, to);
    }

    this.prev = function () {
        if (this.currentPage > 1)
            this.showPage(this.currentPage - 1);
    }

    this.next = function () {
        if (this.currentPage < this.pages) {
            this.showPage(this.currentPage + 1);
        }
    }

    this.init = function () {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length - 1);
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }

    this.showPageNav = function (pagerName, positionId) {
        if (!this.inited) {
            alert("not inited");
            return;
        }
        var element = document.getElementById(positionId);

        var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-ctrl"> &#171 </span>';
        for (var page = 1; page <= this.pages; page++)
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span>';
        pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-ctrl"> &#187;</span>';

        element.innerHTML = pagerHtml;
    }
}

//Fim do script de paginação tabela

//Script de busca na tabela
$('#filtro_tabela').on('keyup', function () {
    var nomeFiltro = $(this).val().toLowerCase();
    $(".tb-licitacao tbody" ).find('tr').each(function () {
        var conteudoCelula = $(this).find('td').text();
        var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro) >= 0;
        $(this).css('display', corresponde ? '' : 'none');
    });
});

//Fim do script de busca na tabela


//Script de mascara e vaçidação de campos
function maskIt(w,e,m,r,a){



	// Cancela se o evento for Backspace

	if (!e) var e = window.event

	if (e.keyCode) code = e.keyCode;

	else if (e.which) code = e.which;



	// Variáveis da função

	var txt = (!r) ? w.value.replace(/[^\d]+/gi,'') : w.value.replace(/[^\d]+/gi,'').reverse();

	var mask = (!r) ? m : m.reverse();

	var pre = (a ) ? a.pre : "";

	var pos = (a ) ? a.pos : "";

	var ret = "";



	if(code == 9 || code == 8 || txt.length == mask.replace(/[^#]+/g,'').length) return false;



	// Loop na máscara para aplicar os caracteres

	for(var x=0,y=0, z=mask.length;x<z && y<txt.length;){

	if(mask.charAt(x)!='#'){

	ret += mask.charAt(x); x++;

	} else{

	ret += txt.charAt(y); y++; x++;

	}

	}



	// Retorno da função

	ret = (!r) ? ret : ret.reverse()

	w.value = pre+ret+pos;

	};



	// Novo método para o objeto 'String'

	String.prototype.reverse = function(){

		return this.split('').reverse().join('');

	};
	
	//Fim do Script de validação de campos
	/*function Apenas_Numeros(caracter){
	  var nTecla = 0;
	  if (document.all) {
		  nTecla = caracter.keyCode;
	  } else {
		  nTecla = caracter.which;
	  }
	  if ((nTecla> 47 && nTecla <58)
	  || nTecla == 8 || nTecla == 127
	  || nTecla == 0 || nTecla == 9  // 0 == Tab
	  || nTecla == 13) { // 13 == Enter
		  return true;
	  } else {
		  return false;
	  }
	}*/
	
	function validaCPF(cpf) 
	 {
	   erro = new String;
	 
	 	if (cpf.value.length == 11)
	 	{	
	 			cpf.value = cpf.value.replace('.', '');
	 			cpf.value = cpf.value.replace('.', '');
	 			cpf.value = cpf.value.replace('-', '');
	 
	 			var nonNumbers = /\D/;
	 	
	 			if (nonNumbers.test(cpf.value)) 
	 			{
	 					erro = "A verificacao de CPF suporta apenas números!"; 
	 			}
	 			else
	 			{
	 					if (cpf.value == "00000000000" || 
	 							cpf.value == "11111111111" || 
	 							cpf.value == "22222222222" || 
	 							cpf.value == "33333333333" || 
	 							cpf.value == "44444444444" || 
	 							cpf.value == "55555555555" || 
	 							cpf.value == "66666666666" || 
	 							cpf.value == "77777777777" || 
	 							cpf.value == "88888888888" || 
	 							cpf.value == "99999999999") {
	 							
	 							erro = "Número de CPF inválido!"
	 					}
	 	
	 					var a = [];
	 					var b = new Number;
	 					var c = 11;
	 
	 					for (i=0; i<11; i++){
	 							a[i] = cpf.value.charAt(i);
	 							if (i < 9) b += (a[i] * --c);
	 					}
	 	
	 					if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
	 					b = 0;
	 					c = 11;
	 	
	 					for (y=0; y<10; y++) b += (a[y] * c--); 
	 	
	 					if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }
	 	
	 					if ((cpf.value.charAt(9) != a[9]) || (cpf.value.charAt(10) != a[10])) {
	 						erro = "Número de CPF inválido.";
							
	 					}
	 			}
	 	}
	 	else
	 	{
	 		if(cpf.value.length == 0)
	 			return false
	 		else
	 			erro = "Número de CPF inválido.";
	 	}
	 	if (erro.length > 0) {
	 			alert(erro);
	 			cpf.focus();
	 			return false;
	 	} 	
	 	return true;	
	 }
	
	function validacaoEmail(field) {
		usuario = field.value.substring(0, field.value.indexOf("@"));
		dominio = field.value.substring(field.value.indexOf("@")+ 1, field.value.length);

		if ((usuario.length >=1) &&
		    (dominio.length >=3) && 
		    (usuario.search("@")==-1) && 
		    (dominio.search("@")==-1) &&
		    (usuario.search(" ")==-1) && 
		    (dominio.search(" ")==-1) &&
		    (dominio.search(".")!=-1) &&      
		    (dominio.indexOf(".") >=1)&& 
		    (dominio.lastIndexOf(".") < dominio.length - 1)) {
		document.getElementById("msgemail").innerHTML="<font color='green'><i class="+"material-icons"+">check</i></font>";
		}
		else{
		document.getElementById("msgemail").innerHTML="<font color='red'><i class="+"material-icons"+">clear</i></font>";
		}
		}
	
