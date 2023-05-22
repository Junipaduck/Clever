jQuery(".box-btn-size-chart,.joinTipInfo .tright,.contMoreBtn a").click(function(){
    jQuery("body").addClass("blackhold")
})

jQuery("#couponChart .btn-close-box,.backdark,#sizeChart .btn-close-box,.layer_popCont .xi-close").click(function(){
    jQuery("body").removeClass("blackhold")
})


jQuery(".fax").text("CJ대한통운")
jQuery(".faxadd").text("경기도 김포시 고촌읍 전호리 662 CJ 대한통운 김포 중부 대리점")


    

//$(function () {
//        var $firstmenu = $('.listHover'),
//            $header = $('header');
//        $firstmenu.mouseenter(function () {
//            $header.stop().animate({ height: '420px' }, 000);
//        })
//            .mouseleave(function () {
//                $header.stop().animate({ height: '70px' }, 100);
//            })
//    });