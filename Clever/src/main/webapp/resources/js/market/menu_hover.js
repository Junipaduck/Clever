
/* 햄버거에 마우스 호버 시 */
$(document).ready(function(){
    $(".hamburger").hover(function(){
        $('#menu').attr('src', 'resources/images/market/ch_hamburger.png');
        $('#test_cates').css('display', 'block');
    })
/* 햄버거에서 마우스 떠날 시 */
    $(".hamburger").mouseleave(function(){
        $('#menu').attr('src', 'resources/images/market/hamburger.png');
        $('#test_cates').css('display', 'none');
    })


/* 대분류 메뉴 호버 시*/
    $("#test_cates").hover(function(){
        $('#test_cates').css('display', 'block');
    })
/* 대분류 메뉴 떠날 시 */
    $("#test_cates").mouseleave(function(){
        $('#test_cates').css('display', 'none');
    })


/* 대분류 */
/* 의류에 호버 시 */
    $("#clothes").hover(function(){
        $('#test_clos').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
/* 의류에서 떠날 시 */
    $("#clothes").mouseleave(function(){
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
/* 악세서리에 호버 시 */
    $("#acc").hover(function(){
        $('#test_accs').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
/* 악세서리에서 떠날 시 */
    $("#acc").mouseleave(function(){
        $('#test_accs').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })


/* 소분류 표시 */
    $("#test_clos").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'block');

        $('#test_accs').css('display', 'none');

        $('#test_cates > h2 > span').css('display', 'block');
    })
    $("#test_clos").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');

        $('#test_accs').css('display', 'none');
    })


    $("#test_accs").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#test_accs').css('display', 'block');

        $('#test_clos').css('display', 'none');

        $('#test_cates > h2 > span').css('display', 'block');
    })
    $("#test_accs").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');

        $('#test_accs').css('display', 'none');
    })
})