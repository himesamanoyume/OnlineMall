function changeClientWidth(){
    if(document.body.clientWidth<=975){
        $('.info-container').css('position','inherit');
        $('#topTitle').removeClass('topTitleClose').addClass('topTitleOpen');
        $('#blogName').removeClass('blogName').addClass('blogName2');
        $('#nav-container').removeClass('nav-container').addClass('nav-container2');
    }else{
        $('.info-container').css('position','sticky');
        $('#topTitle').removeClass('topTitleOpen').addClass('topTitleClose');
        $('#blogName').removeClass('blogName2').addClass('blogName');
        $('#nav-container').removeClass('nav-container2').addClass('nav-container');
    }
}