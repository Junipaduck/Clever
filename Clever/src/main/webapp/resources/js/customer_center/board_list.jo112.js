jQuery(document).ready(function(){
    jQuery(".bbs-sch input").each(function(){
        if ( jQuery(this).prop("checked") == true ) {
            jQuery(this).parent().addClass("check");
        }
    });
    bbs_sch_input();
});

function bbs_sch_input(){
    jQuery(".bbs-sch input").change(function(){
        jQuery(".bbs-sch input").parent().removeClass("check");
        jQuery(this).parent().addClass("check");
    });
}
