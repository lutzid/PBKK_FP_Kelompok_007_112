function readKTP(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#preview_ktp').attr('src', e.target.result);
            $('#temp_ktp').prop('hidden', true);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#foto_ktp").change(function() {
    readKTP(this);
});

function readProfil(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#preview_profil').attr('src', e.target.result);
            $('#temp_profil').prop('hidden', true);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#foto_profil").change(function() {
    readProfil(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#preview_kost').attr('src', e.target.result);
            $('#def').prop('hidden', true);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#img_kost").change(function() {
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#preview_kamar').attr('src', e.target.result);
            $('#def').prop('hidden', true);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#img_kamar").change(function() {
    readURL(this);
});

$(document).ready(function() {

    $('#admin').val(5000).number(true, 0, ',', '.');
    var selectPeriode = $("#per");
    var selectNumber = $("#num");

    selectPeriode.on("change", adjustNum);

    function adjustNum() {
        var periode = selectPeriode.val();
        if (periode == 1) {
            selectNumber.empty();
            for (var d = 1; d <= 29; d++) {
                var numElem = document.createElement("option");
                numElem.value = d;
                numElem.textContent = d;
                selectNumber.append(numElem);
            }
        }
        if (periode == 2) {
            selectNumber.empty();
            for (var d = 1; d <= 3; d++) {
                var numElem = document.createElement("option");
                numElem.value = d;
                numElem.textContent = d;
                selectNumber.append(numElem);
            }
        }
        if (periode == 3) {
            selectNumber.empty();
            for (var d = 1; d <= 11; d++) {
                var numElem = document.createElement("option");
                numElem.value = d;
                numElem.textContent = d;
                selectNumber.append(numElem);
            }
        }
        if (periode == 4) {
            selectNumber.empty();
            for (var d = 1; d <= 5; d++) {
                var numElem = document.createElement("option");
                numElem.value = d;
                numElem.textContent = d;
                selectNumber.append(numElem);
            }
        }
    }

    selectPeriode.on("change", adjustTot);
    selectNumber.on("change", adjustTot);

    function adjustTot() {
        var pric = parseFloat($('#price').val());
        var admin = parseFloat($('#admin').val());
        var period = selectPeriode.val();
        var numb = selectNumber.val();
        if (period == 1) {
            pric = (pric * 1.5) / 30;
            var sub_total = pric * numb;
        }
        if (period == 2) {
            pric = (pric * 1.3) / 4;
            var sub_total = pric * numb;
        }
        if (period == 3) {
            pric = pric * 1;
            var sub_total = pric * numb;
        }
        if (period == 4) {
            pric = pric * 12;
            var sub_total = pric * numb;
        }
        $('#sub_total').val(sub_total).number(true, 0, ',', '.');
        $('#total').val(sub_total + admin).number(true, 0, ',', '.');;
    }
});