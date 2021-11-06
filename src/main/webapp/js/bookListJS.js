window.onload=function(){
    $('#searchButton').click(function(){
        location.href="/view/sellerBookList?searchType=" + $('#searchType').val() +
            "&keyword=" + $('#keyword').val() + "&currentPage=1" + "&status=" + $('#searchStatus').val()
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

        location.href="/view/sellerBookList/?searchType=" + $('#searchType').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) - 1)

    })

    $('#nextPage').click(function(){

        location.href="/view/sellerBookList/?searchType=" + $('#searchType').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) + 1)
    })
}

window.onscroll=function(){

    var topScroll = get_scrollTop_of_body();//滚动的距离,距离顶部的距离

    if($('#divSpace').length>0){
        var divSpace = document.getElementById("divSpace");//获取到导航栏id
        if(topScroll > 360){
            divSpace.style.top = '0px';
            divSpace.style.width = '100%';
            divSpace.style.zIndex = '9999';
            // divSpace.style.position = 'sticky';
            divSpace.style.boxShadow = '0px 3px 7px Gainsboro';
        }else{
            divSpace.style.boxShadow = '0px 0px 0px Gainsboro';
        }

    }

    function get_scrollTop_of_body(){
        var scrollTop;
        if(typeof window.pageYOffset != 'undefined'){//pageYOffset指的是滚动条顶部到网页顶部的距离
            scrollTop = window.pageYOffset;
        }else if(typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat')        {
            scrollTop = document.documentElement.scrollTop;
        }else if(typeof document.body != 'undefined'){
            scrollTop = document.body.scrollTop;
        }
        return scrollTop;
    }
}

window.onresize = function(){
    changeFontSize();
    // changeMaxWidth();
}

function changeFontSize(){
    if($('.divSpaceButton').length>0){
        if(document.body.clientWidth>=600){

            $(".divSpaceButton").css("font-size",30);
        }else{
            // alert("2");
            $(".divSpaceButton").css("font-size",20);
        }
    }
}