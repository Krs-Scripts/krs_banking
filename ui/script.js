window.addEventListener('message', function(event) {
    if (event.data.type === 'apriBanca') {
        $('#Tutto').fadeTo(10, 1.0);
        $('#depositaImporto').val('');
        $('#ritiraImporto').val('');
        $('.nome_giocatore').html('<i class="fa-solid fa-user"></i>' + ' ' + event.data.namePlayer)
        $('.importo').html(' ' + ' ' + event.data.money)
    } else if (event.data.type === 'chiudiTutto') {
        $('#Tutto').fadeTo(10, 0.0);
    }
});

document.onkeyup = function(data) {
	if (data.key == 'Escape') {
		$('#Tutto').fadeTo(10, 0.0);
		$.post(`https://${GetParentResourceName()}/chiudiBanca`, JSON.stringify({}));
	};
};

$('.close').click(function() {
	$('Tutto').hide();
	$.post(`https://${GetParentResourceName()}/chiudiBanca`, JSON.stringify({}));
});

$('#trasferimento').click(function() {
    var idGiocatore = $('#idGiocatore').val();
    var trasferisci = $('#trasferireImporto').val();
    $.post(`https://${GetParentResourceName()}/trasferire`, JSON.stringify({
        id: idGiocatore,
        importo: trasferisci
    }));
    $('#idGiocatore').val('');
    $('#trasferireImporto').val('');
});

$('#withdraw').click(function() {
    var ritira = $('#ritiraImporto').val();
    $.post(`https://${GetParentResourceName()}/ritira`, JSON.stringify({
        importo: ritira
    }));
    $('#ritiraImporto').val('');
});

$('#deposit').click(function() {
    var deposita = $('#depositaImporto').val();
    $.post(`https://${GetParentResourceName()}/deposita`, JSON.stringify({
        importo: deposita
    }));
    $('#depositaImporto').val('');
});

$('#preleva-1000').click(function() {
	$.post(`https://${GetParentResourceName()}/ritira`, JSON.stringify({
		importo: 1000
	}));
});

$('#preleva-2000').click(function() {
	$.post(`https://${GetParentResourceName()}/ritira`, JSON.stringify({
		importo: 2000
	}));
});

$('#preleva-3000').click(function() {
	$.post(`https://${GetParentResourceName()}/ritira`, JSON.stringify({
		importo: 3000
	}));
});

// ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
// ██ █▀▄██ ▄▄▀██ ▄▄▄ 
// ██ ▄▀███ ▀▀▄██▄▄▄▀▀
// ██ ██ ██ ██ ██ ▀▀▀ 
// ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀