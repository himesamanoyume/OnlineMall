/*
 * @Author: your name
 * @Date: 2021-10-23 09:49:25
 * @LastEditTime: 2021-10-23 13:57:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \static\generalJS.js
 */

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

function changeMaxWidth(){
    var indexBackground = document.getElementById("indexBackground");
    var webWidth = document.body.clientWidth;

    // console.log(webWidth);
    if(webWidth>=1680){
        indexBackground.style.maxWidth = 1680 +'px';
        // console.log(1);
    }else if(webWidth>=1260 && webWidth <1680){
        indexBackground.style.maxWidth = 1260 +'px';
        // console.log(2);
    }else if(webWidth>=840 && webWidth <1260){
        indexBackground.style.maxWidth = 840 +'px';
        // console.log(3);
    }else if(webWidth>=420 && webWidth <840){
        indexBackground.style.maxWidth = 420 +'px';
        // $(".divSpaceButton").style.fontSize = 20+'px';
        // console.log(4);
    }
}

window.onload=function(){

    if ($('#submit').length>0){

        $('#submit').click(function(){

            var name = $('#name').val()
            var price = $('#price').val()
            var author = $('#author').val()
            var amount = $('#amount').val()
            var txt = $('#txt').val()
            var publisher = $('#publisher').val()
            var publishTime = $('#publishTime').val()
            var stock = $('#stock').val()

            name= name.trim()
            price=parseFloat(price).toFixed(2)
            author=author.trim()
            amount=parseInt(amount)
            txt=txt.trim()
            publisher=publisher.trim()
            publishTime=publishTime.trim()
            stock=parseInt(stock)


            if(!name){
                alert('商品名不能为空')
                return
            }
            if(price <= 0){
                alert('价格必须为正数')
                return
            }


            // var imgList = $('.preview_img')
            // var srcList = []
            // for( var i=0; i<imgList.length; i++ ){
            //     srcList.push(imgList.eq(i).attr('src'))
            // }

            $.post('/book/createBook',{
                name: name,
                price:price,
                author:author,
                amount:amount,
                txt:txt,
                publisher:publisher,
                publishTime:publishTime,
                stock:stock
            },function(res){
                if(res && res.bookId){
                    alert('新增成功')
                }
            }).fail(function(res){
                alert(res.responseJSON.message)
            })

        })
    }

    changeFontSize();

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

    $('#file').change(function(){
        //获取到的是一个数组，所以要检索第一个元素
        console.log($(this)[0].files)
        var file = $(this)[0].files[0];
        var data = new FormData()
        data.append("file", file)
        $.ajax({
            url:'/uploadFile',
            data: data,
            type: 'POST',
            processData: false,
            contentType: false,
            success: function(res){
                // console.log(res)
                var img = $(`<div class="img_box">` +
                    `<img alt="" class="preview_img" src="` + res + `" />` +
                    `<div class="del_img">x</div>` +
                    `</div>`)
                $('#show_box').append(img)
            }
        })
    })

    $('body').on('mouseover', '.img_box', function(){
        // alert('hello')
        $(this).find('.del_img').css('display','block')

    })

    $('body').on('mouseleave', '.img_box', function(){
        // alert('hello')
        $(this).find('.del_img').css('display','none')

    })

    $('body').on('click', '.del_img', function(){
        // alert('hello')
        $(this).parent().remove()

    })
}
