
function ScrollFunc(){
    if($('#divSpace').length>0){
        var scrollTop;
        if(typeof window.pageYOffset != 'undefined'){//pageYOffset指的是滚动条顶部到网页顶部的距离
            scrollTop = window.pageYOffset;
        }else if(typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat'){
            scrollTop = document.documentElement.scrollTop;
        }else if(typeof document.body != 'undefined'){
            scrollTop = document.body.scrollTop;
        }
        var topScroll = scrollTop;//滚动的距离,距离顶部的距离


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
function LoginInfoFunc(){

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

}
function PageIndexFunc(){
    $('#prePage').click(function(){
        location.href="/view/index/?searchStatus=" + $('#searchStatus').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) - 1)
    })

    $('#nextPage').click(function(){

        location.href="/view/index/?searchStatus=" + $('#searchStatus').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) + 1)
    })
}
function PageSellerBookListFunc(){
    $('#prePage').click(function(){
        location.href="/view/sellerBookList/?searchStatus=" + $('#searchStatus').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) - 1) +
            "&status=" + $('#searchStatus').val()

    })

    $('#nextPage').click(function(){

        location.href="/view/sellerBookList/?searchStatus=" + $('#searchStatus').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) + 1) +
            "&status=" + $('#searchStatus').val()
    })
}
function PageAdminBookListFunc(){
    $('#prePage').click(function(){
        location.href="/view/adminBookList/?searchStatus=" + $('#searchStatus').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) - 1) +
            "&status=" + $('#searchStatus').val()

    })

    $('#nextPage').click(function(){

        location.href="/view/adminBookList/?searchStatus=" + $('#searchStatus').val() +
            "&keyword=" + $('#keyword').val() +
            "&currentPage=" + (parseInt($('#currentPage').text()) + 1) +
            "&status=" + $('#searchStatus').val()
    })
}
function PageUserListFunc(){
    $('#prePage').click(function(){
        var current = parseInt($('#currentPage').text()) - 1
        UserListQueryData(current)
    })

    $('#nextPage').click(function(){
        var current = parseInt($('#currentPage').text()) + 1
        UserListQueryData(current)
    })

}
function SubmitFunc(){
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

            var imgList = $('.preview_img')
            var srcList = []
            for( var i=0; i<imgList.length; i++ ){
                srcList.push(imgList.eq(i).attr('src'))
            }

            $.post('/book/createBook',{
                name: name,
                price:price,
                author:author,
                amount:amount,
                txt:txt,
                publisher:publisher,
                publishTime:publishTime,
                stock:stock,
                srcList:srcList
            },function(res){
                if(res && res.bookId){
                    alert('新增成功')
                    location.href="/view/createBook"
                }
            }).fail(function(res){
                alert(res.responseJSON.message)
            })

        })
    }
}
function FileUploadFunc(){
    $('#file').change(function(){
        //获取到的是一个数组，所以要检索第一个元素
        // console.log($(this)[0].files)
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
function LoginPageFunc(){
    $('#submit').click(function(){
        var account = $('input[name=account]').val();
        var password = $('input[name=password]').val();

        account = account.trim();
        password = password.trim();

        if(account == ''){
            alert("手机号不能为空");
            return;
        }
        if(!(/^1([3|4|5|7|8|9])\d{9}$/.test(account))){
            alert('手机号不正确');
            return
        }
        if(password == ''){
            alert("密码不能为空");
            return;
        }

        $.post('/user/login',{
            account:account,
            password:password
        },function(res){
            if(res && res.userId){
                location.href = "/view/index"
            }else{
                alert('登录失败')
            }
        }).fail(function(res){
            alert(res.responseJSON.message)
        })
    })
}
function RegPageFunc(){
    $('#submit').click(function (){
        var type = $('input[name=type]:checked').val();
        var account = $('input[name=account]').val();
        var password = $('input[name=password]').val();
        var confirmPassword = $('input[name=confirmPassword]').val();

        account = account.trim();
        password = password.trim();
        confirmPassword = confirmPassword.trim();

        if(account == ''){
            alert("手机号不能为空");
            return;
        }
        if(!(/^1([3|4|5|7|8|9])\d{9}$/.test(account))){
            alert('手机号不正确');
            return
        }
        if(password == ''){
            alert("密码不能为空");
            return;
        }
        if (password.length < 6){
            alert("密码强度不够");
            return;
        }
        if(confirmPassword == ''){
            alert("确认密码不能为空");
            return;
        }

        $.post('/user/reg',{
            type:type,
            account:account,
            password:password
        },function(res){
            if(res && res.userId){
                alert('注册成功')
                location.href = "/view/login"
            }else{
                alert('注册失败')
            }
        }).fail(function(res){
            alert(res.responseJSON.message)
        })
    })

}
function SellerBookListSearchButtonFunc(){
    $('#searchButton').click(function(){
        location.href="/view/sellerBookList?searchStatus="
            + $('#searchStatus').val()
            + "&keyword="
            + $('#keyword').val()
            + "&currentPage=1"
            + "&status="
            + $('#searchStatus').val()
    })
}
function AdminBookListSearchButtonFunc(){
    $('#searchButton').click(function(){
        location.href="/view/adminBookList?searchStatus="
            + $('#searchStatus').val()
            + "&keyword="
            + $('#keyword').val()
            + "&currentPage=1"
            + "&status="
            + $('#searchStatus').val()
    })
}
function UserListSearchButtonFunc(){
    $('#searchButton').click(function(){
        UserListQueryData(1);
        // location.href="/view/userList?searchStatus="
        //     + $('#searchStatus').val()
        //     + "&keyword="
        //     + $('#keyword').val()
        //     + "&currentPage=1"
    })
}
function IndexSearchButtonFunc(){
    $('#searchButton').click(function(){
        location.href="/view/index?searchStatus="
            + $('#searchStatus').val()
            + "&keyword="
            + $('#keyword').val()
            + "&currentPage=1"
    })
}
function TipsOpenDetailFunc(){
    $('.divTips').click(function (){
        location.href="/view/bookDetail?bookId=" + $(this).attr('data-bookId')
    })
}
function StockFunc(){
    $('#count').change(function(){
        var count = $(this).val();
        var stock = $('#stock').text();
        var price = parseFloat($('#price').text());
        if (count<1){
            $('#count').val(1);
        }else if (count>parseInt(stock)){
            $('#count').val(stock);
        }else{
            $('#money').text((count*price).toFixed(2))
        }
    })
}

// function UserListQueryData(pageNumber){
//     var type = $('#searchStatus').val()
//     var keyword = $('#keyword').val().trim()
//
//     var account = ""
//     var name = ""
//
//     if(type == 1){
//         account = keyword
//     }else{
//         name = keyword
//     }
//     $.post('/user/queryPage',{
//         account:account,
//         name: name,
//         'page.current': pageNumber,
//         'page.size': 12,
//
//     },function (res){
//         var index =0;
//         for(var item of res.records){
//             index++
//             var ele = '<tr><td>'+ index+'</td>'+
//                 '<td>'+item.account+'</td>'+
//                 '<td>'+(item.name ? item.name : '')+'</td>'+
//                 '<td>'+typeDic(item.type)+'</td>'+
//                 '<td>'+item.balance.toFixed(2)+'</td>'+
//                 '<td>'+(item.address?item.address:'')+'</td>'+
//                 '<td>'+'<button class="usuallyButton">充值</button>'+'</td></tr>'
//
//             $('#table').append($(ele));
//         }
//     })
// }
// function typeDic(type){
//     if(type == 0){
//         return "买家"
//     }else if(type == 1){
//         return "卖家"
//     }else if(type == 2){
//         return "管理员"
//     }
// }









