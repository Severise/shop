$(document).ready(function() {
    var primSum = $('input[name=sum]').val();

    $('#openAdd').click(function() {
        if ($('.add').css('display') == 'none'){
            $('.add').css('display', 'table-cell');
            $('#openAdd').html('&gt;');
        }
        else{
            $('.add').css('display', 'none');
            $('#openAdd').html('&lt;');
        }
    });

    $('select[name="customer"]').change(function() {
        var id = $('#cust option:selected').val();
        var address = $('select[name=addr] option[value=' + id + ']').text();
        $('input[name=address').val(address);
        $('select[name=disc] option[value=' + id + ']').attr("selected", "selected");
        var disc = $('select[name=disc] option[value=' + id + ']').text();
        var sum = parseInt(primSum - primSum * disc / 100);
        $('input[name=sum]').val(sum);
        $('.text:contains(Сумма заказа)').text('Сумма заказа: ' + sum);
    });

    $('#takeGood input[type="submit"]').click(function() {
        addGoodDB('/takeGood', {
            good: $('#takeGood input[name="good"').val(),
            quantity: parseInt($('#takeGood input[name="quantity"').val())
        });


        $('.notif').css('display', 'block');
        var time = setTimeout(function() {
            $('.notif input[type="submit"]').trigger('click');
        }, 6000);
        return false;
    });

    $('#makeOrder').click(convertData);


    $('.notif input[type="submit"]').click(function() {
        var time = null;
        $('.notif').css('display', 'none');
    });

    $("#check input[name='quantity']").change(quantityControl);

    $('.orderleft').click(function() {
        addGood($(this).parent());
    });

    $('#addUser').click(function() {
        $('#addU').css('display', 'block');
        $('.hide').css('display', 'block');
    });

    $('#addGood').click(function() {
        $('#addG').css('display', 'block');
        $('.hide').css('display', 'block');
    });

    $('#addCust').click(function() {
        $('#addC').css('display', 'block');
        $('.hide').css('display', 'block');
    });

    $('tbody td:last-child:contains(Изменить):not(.orderleft)').click(function(event) {
        fillForm($(this).parent());
        $('#changeCust').css('display', 'block');
        $('#changeGood').css('display', 'block');
        $('#changeOrder').css('display', 'block');
        $('#changeUser').css('display', 'block');
        $('.hide').css('display', 'block');
    });

    $('#over').click(function() {
        $('#addU').css('display', 'none');
        $('#addG').css('display', 'none');
        $('#addC').css('display', 'none');
        $('.hide').css('display', 'none');
        $('#changeCust').css('display', 'none');
        $('#changeGood').css('display', 'none');
        $('#changeUser').css('display', 'none');
        $('#changeOrder').css('display', 'none');
    });

    var f_sl = 1;
    var f_nm = 1;
    $("thead td").click(function() {
        f_sl *= -1;
        var n = $(this).prevAll().length;
        sortTable(f_sl, n);
    });
});

function fillForm(tr) {
    var item = $('h2').text();
    if (item.toLowerCase().indexOf('клиенты') > -1) {
        $('input[name="id"]').val(tr.find('td').eq(0).html());
        $('input[name="name"]').val(tr.find('td').eq(1).html());
        $('input[name="address"]').val(tr.find('td').eq(2).html());
        $('input[name="phone"]').val(tr.find('td').eq(3).html());
        $('input[name="sum"]').val(tr.find('td').eq(4).html());
        $('input[name="disc"]').val(tr.find('td').eq(5).html());
    } else if (item.toLowerCase().indexOf('товары') > -1) {
        $('input[name="id"]').val(tr.find('td').eq(0).html());
        $('input[name="name"]').val(tr.find('td').eq(1).html());
        $('input[name="size"]').val(tr.find('td').eq(2).html());
        $('form input[name="quantity"]').val(tr.find('td').eq(3).html());
        $('input[name="art"]').val(tr.find('td').eq(4).html());
        $('input[name="price"]').val(tr.find('td').eq(5).html());
        $('input[name="img"]').val(tr.find('td img').attr('src'));
    } else if (item.toLowerCase().indexOf('пользователи') > -1) {
        $('input[name="id"]').val(tr.find('td').eq(0).html());
        $('input[name="name"]').val(tr.find('td').eq(1).html());
        $('input[name="login"]').val(tr.find('td').eq(2).html());
        $('input[name="email"]').val(tr.find('td').eq(3).html());
        $('option:contains(' + tr.find('td').eq(4).html() + ')').attr('selected', 'selected');
    } else if (item.toLowerCase().indexOf('заказы') > -1) {
        $('input[name="id"]').val(tr.find('td').eq(0).html());
        $('input[name="address"]').val(tr.find('td').eq(2).html());
        $('input[name="additional"]').val(tr.find('td').eq(8).html());
        if (tr.find('td').eq(4).html() != '0')
            $('option:contains(' + tr.find('td').eq(4).html() + ')').attr('selected', 'selected');
        $('option:contains(' + tr.find('td').eq(7).html() + ')').attr('selected', 'selected');
    } else if (item.toLowerCase().indexOf('корзины') > -1) {
        $('input[name="id"]').val(tr.find('td').eq(0).html());
        $('input[name="good"]').val(tr.find('td').eq(2).html());
        $('input[name="quantity"]').val(tr.find('td').eq(3).html());
    }
}


function sortTable(f, n) {
    var rows = $('tbody  tr').get();
    rows.sort(function(a, b) {
        var A = getVal(a);
        var B = getVal(b);

        if (A < B) {
            return -1 * f;
        }
        if (A > B) {
            return 1 * f;
        }
        return 0;
    });

    function getVal(elm) {
        var v = $(elm).children('td').eq(n).text().toUpperCase();
        if ($.isNumeric(v)) {
            v = parseInt(v, 10);
        }
        return v;
    }

    $.each(rows, function(index, row) {
        $('table').children('tbody').append(row);
    });
}



function quantityControl() {
    var max = 0;
    var cur = parseInt($(this).val());
    max = $(this).parent().parent().find('td').eq(3).html();
    if (cur > parseInt(max))
        $(this).val(max);
    if (cur < 0)
        $(this).val(1);
}

function addGood(tr) {
    $('input[name="good"]').val(tr.find('td').eq(0).html());
    $('span.name').html(' ' + tr.find('td').eq(1).html());
    $('#takeGood input[name="quantity"]').val(parseInt(tr.find('td input[name="quantity"]').val()));
    $('#changeTakenGood input[name="quantity"]').val(parseInt(tr.find('td input[name="quantity"]').val()));
    $('#changeTakenGood input[type="submit"]').trigger('click');
    $('#takeGood input[type="submit"]').trigger('click');
    $('.cart').html(parseInt($('.cart').html()) + 1);
}

function addGoodDB(url, data) {
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(data) {
            console.log('from server:', data);
        },
        error: function() {
            console.error("ERROR");
        },
        dataType: 'json'
    })
}

function convertData() {
    var data = [];
    var dataTable = $('tbody tr');
    dataTable.each(function() {
        var good = {
            'id': $(this).find('td').eq(0).html(),
            'quantity': $(this).find('td input').val(),
            'sum': parseInt($(this).find('td input').val()) * parseInt($(this).find('td').eq(3).html())
        }
        data.push(good);
    });
    $('textarea[name="data"]').val(JSON.stringify(data));
}