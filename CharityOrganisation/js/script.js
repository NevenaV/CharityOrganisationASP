$(document).ready(function () {
    $('#ContentPlaceHolder1_btnVote').click(function (e) {
        e.preventDefault();
        //alert("funkcija1");
        var idChosen = "";
        $('input[name="ctl00$ContentPlaceHolder1$pollRadio"]').each(function () {
            if ($(this).is(':checked')) {
                idChosen = $(this).val();
                //alert(idChosen);
            }
        });
        if (idChosen == "") {
            $('#pollErrors').html("You must choose one answer!");
            return; return;
        }
        else {
            $('#hidePoll').hide(500);
            $.ajax({
                type: "POST",
                url: "WebServiceAjax.asmx/pollVote",
                data: { idAnswer: idChosen },
                success: function (data) {
                    if (data) {
                        //alert(data);
                        $('#pollResults').html(data);
                        $('#pollResults').show(500);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.responseText);
                    alert(thrownError);
                }
            });
        }
    });
});


$(document).ready(function () {

    var docHeight = $(window).height();
    var footerHeight = $('.footer-div').height();
    var footerTop = $('.footer-div').position().top + footerHeight;

    if (footerTop < docHeight) {
        $('.footer-div').css('margin-top', 10 + (docHeight - footerTop) + 'px');
    }
});


function getTopDonations() {
    var filter = document.getElementById("ddlTopDonations").value;
    //alert(filter);
    document.getElementById("topDonations").innerHTML = "";

    $.ajax({
        type: "POST",
        url: "WebServiceAjax.asmx/donationsFilter",
        data: { valFilter: filter },
        success: function (data) {
            if (data) {
                //alert(data);
                document.getElementById("topDonations").innerHTML += data;
                
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.responseText);
            alert(thrownError);
        }
    });
}

$(document).ready(function () {
    $('#slider').unslider({
        animation: 'horizontal',
        autoplay: true,
        arrows: false,
        nav: false,
        delay: 3500
    });
});