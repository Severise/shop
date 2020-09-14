$(document).ready(function() {
    $('#addUser').click(function() {
        $('#addU').css('display', 'block');
        $('.hide').css('display', 'block');

    });
    $('#addGood').click(function() {
        $('#addG').css('display', 'block');
        $('.hide').css('display', 'block');

    });

    $('#addService').click(function() {
        $('#addS').css('display', 'block');
        $('.hide').css('display', 'block');

    });


    $('#over').click(function() {
        $('#addU').css('display', 'none');
        $('#addS').css('display', 'none');
        $('#addG').css('display', 'none');
        $('.hide').css('display', 'none');
        console.log('aaaaaaa');

    });


});