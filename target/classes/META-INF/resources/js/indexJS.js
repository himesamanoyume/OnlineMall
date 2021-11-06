
window.onload=function(){
    $('#searchButton').click(function(){

        location.href="?searchType=" + $('#searchType').val() +
            "&keyword=" + $('#keyword').val() + "&currentPage=1"
    })
    $('#topLoginAfter').hover(function (){
        $('#topLoginInfo').css('top','60px');
        $('#topLoginInfo').css('height','150px');
        $('#topLoginInfo').css('box-shadow','0 0 0 1px #66ccff');
        // $('#topLoginInfo').css('display','block');
    })
    $('#topLoginInfo').mouseleave(function (){
        $('#topLoginInfo').css('top','-50px');
        $('#topLoginInfo').css('height','0')
        $('#topLoginInfo').css('box-shadow','0 0 0 0 rgba(0,0,0,0)');
        // $('#topLoginInfo').css('display','none');
    })
    $('#topLoginInfoLogout').click(function (){
        $.post('/user/logout',{
        },function (res){
            if (res){
                location.href = "/"
            }
        })
    })

    $('#prePage').click(function(){

        location.href="/?searchType=" + $('#searchType').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) - 1)

    })

    $('#nextPage').click(function(){

        location.href="/?searchType=" + $('#searchType').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) + 1)
    })
}