function Center(){
    $('#center-blog').click(function(){
        location.href = "/blog";
        }
    );
    $('#center-pan').click(function(){
            location.href = "/pan";
        }
    );
}
function InitFunc(){
    if (getCookie("input-keyword")){
        $('.main').attr("data-keyword",getCookie("input-keyword"));
        $('#keyword').attr("value",getCookie("input-keyword"));
        delCookie("input-keyword");
    }
    var nowUrl = $('.main').attr("data-url");
    if (nowUrl=='post') {
        $('#nav-post').css("color", "var(--tianyi-color)");
    }else if (nowUrl=='dynamic') {
        $('#nav-dynamic').css("color", "var(--tianyi-color)");
    }else if (nowUrl=='resume') {
        $('#nav-resume').css("color", "var(--tianyi-color)");
    }

    $('.lazy').Lazy({
        effect: "fadeIn",
        effectTime: 500,
        threshold: 0,
        onError: function(element){
            console.log(element);
        }
        // scrollDirection: 'vertical',
        // effect: 'fadeIn',
        // visibleOnly: true,
        // effectTime: 500,
        // threshold: 0
    });

}
function NavFunc(){
    $('#nav-index').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword");
        }
        location.href="/blog";
    });
    $('#topTitle-index').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword");
        }
        location.href="/blog";
    });
    $('#nav-post').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword");
        }
        location.href="/post"
    });
    $('#nav-dynamic').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword");
        }
        location.href="/dynamic";
    });
    $('#nav-resume').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword");
        }
        location.href="/resume";
    });
    $('#info-console').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword");
        }
        if (getCookie('console-type')){
            delCookie('console-type');
        }
        location.href="/console";
    });
}

function PostOpenDetailFunc(){
    $('.post').click(function (){
        location.href="/postDetail?postId=" + $(this).attr('data-postId');
    })
}

function ConsolePostOpenEditFunc(){
    $('body').on('click', '.console-container-edit-button', function (){
        location.href="/editPost?postId=" + $(this).parent().parent().parent().attr('data-postId');
    })
}

function ConsolePostOpenDetailFunc(){
    $('body').on('click', '.console-container-detail-button', function (){
        location.href="/postDetail?postId=" + $(this).parent().parent().parent().attr('data-postId');
    })
}

function queryImgFunc(){
    $('#queryKeywordImg').click(function (){
        var data = new FormData();
        var imgURL = window.location.host;
        var keyword = $('#postKeyword').val();
        keyword = keyword.trim();
        if (!keyword){
            alert("keyword????????????");
            return;
        };

        data.append("keyword",keyword);
        $.ajax({
            url:'/searchImg',
            data:data,
            type:'POST',
            processData: false,
            contentType: false,
            success: function(res){
                for (var i=0;i<res.length;i++){
                    console.log("keyword:"+res[i].keyword+",name:"+res[i].name+",url:http://"+imgURL+"/Img/"+res[i].keyword+"/"+res[i].name);
                }
                // alert("?????????????????????????????????")
            },
            error:function (res){
                alert(res);
            }
        })
    })
}

function BackTopFunc(){
    $('#backTop').click(function (){
        $("html,body").animate({scrollTop:"0px"},400);
    })
}

function EditAndDetailFunc(){
    $('#goDetail').click(function (){
        location.href="/postDetail?postId=" + $('.post').attr('data-postId');
    });

    $('#goEdit').click(function (){
        location.href="/editPost?postId=" + $('.post').attr('data-postId');
    });
}

function InfoPrompt(str){
    var prompt = "<div id='tempPrompt' class=\"info-link\"><div class=\"permi-info\">"+ str +"</div></div>";
    $('#info-container-inner').append(prompt);
}

function RemoveInfoPrompt(){
    document.getElementById("tempPrompt").remove();
}

function SearchButtonFunc(){
    $('#search').click(function (){
        setCookie("input-keyword",$('#keyword').val());
        if ( $('.main').attr('data-url')=='index'){
            location.href="/?keyword="
                + getCookie("input-keyword")
                + "&currentPage=1"
        }else if($('.main').attr('data-url')=='console'){
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage=1"
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage=1"
        }
    })
}

function PermissionButtonFunc(){
    $('#permiSubmit').click(function(){
        var password = $('input[name=password]').val();
        password = password.trim();
        if(password == ''){
            alert("??????????????????");
            return;
        }

        $.post('/permi/login',{
            password:password
        },function(res){
            if(res && res.permiId){
                alert('???????????????????????????????????????????????????');
                if ($('.main').attr('data-url')=='index'){
                    location.href = "/";
                }else {
                    location.href = "/"+$('.main').attr('data-url')+"?type="+$('.main').attr('data-type');
                }

            }else{
                alert('??????????????????');
            }
        }).fail(function(res){
            alert(res.responseJSON.message);
        })
    })
}

function ConsoleAddPostFunc(){
    $('#addPost').click(function (){
        location.href="/addPost";
    })
}

const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');//dark

function ThemeSetFunc(){
    $('#info-theme').click(function (){
        if (mediaQuery.matches) {
            if (getCookie('prefer-theme')){
                if (getCookie('prefer-theme')=='auto'){
                    $('#body').attr('data-theme','light');
                }else{
                    $('#body').attr('data-theme','auto');
                }
            }else{
                if ($('#body').attr('data-theme')=='auto'){
                    $('#body').attr('data-theme','light');
                }else{
                    $('#body').attr('data-theme','auto');
                }
            }
        }else{
            if (getCookie('prefer-theme')){
                if (getCookie('prefer-theme')=='auto'){
                    $('#body').attr('data-theme','dark');
                }else{
                    $('#body').attr('data-theme','auto');
                }
            }else {
                if ($('#body').attr('data-theme')=='auto'){
                    $('#body').attr('data-theme','dark');
                }else{
                    $('#body').attr('data-theme','auto');
                }
            }
        }
        setCookie('prefer-theme',$('#body').attr('data-theme'));
    })
}

function SaveThemeCookie(){
    if (getCookie('prefer-theme')){
        if (getCookie('prefer-theme')=='light'){
            $('#body').attr('data-theme','light');
        }else if ((getCookie('prefer-theme')=='dark')){
            $('#body').attr('data-theme','dark');
        }else{
            $('#body').attr('data-theme','auto');
        }
    }
    setCookie('prefer-theme',$('#body').attr('data-theme'));
}

function PageFunc(){
    $('#prePage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage - 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage + 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = totalPages;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#currentPre3Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-3;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
    $('#currentNext3Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+3;
        location.href="/"
            + $('.main').attr('data-url')
            + "?keyword="
            + getCookie("input-keyword")
            + "&currentPage="
            + page;
    });
}

function NoSearchPageFunc(){
    $('#prePage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage - 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage + 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = totalPages;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#currentPre3Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-3;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
    $('#currentNext3Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+3;
        location.href="/"
            + $('.main').attr('data-url')
            + "?currentPage="
            + page;
    });
}

function EditPostFunc(){
    $('#copyCodeBlock').click(function (){
        var text = "<div class=\"code\"></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // ????????????
        document.execCommand("copy"); // ???????????????????????????
        InfoPrompt("????????????");
        setTimeout(RemoveInfoPrompt,2000);
    });

    $('#copyImgBlock').click(function (){
        var keyword = post_keyword;
        var text = "<img class='lazy' data-src='../Img/"
            + keyword
            + "/NAME.TYPE'>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // ????????????
        document.execCommand("copy"); // ???????????????????????????
        InfoPrompt("????????????");
        setTimeout(RemoveInfoPrompt,2000);
    });

    $('#copyReferenceBlock').click(function (){
        var text = "<div class=\"reference\"></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // ????????????
        document.execCommand("copy"); // ???????????????????????????
        InfoPrompt("????????????");
        setTimeout(RemoveInfoPrompt,1100);
    });

    $('#saveEdit').click(function (){
        var topImg = $('#topImg').val();
        var keyword = $('#postKeyword').val();
        var title = $('#title').val();
        var introduction = $('#introduction').val();
        var publishTime = $('#publishTime').val();
        var typeId = $('#typeId').val();
        var article = $('#article').val();

        topImg = topImg.trim();
        keyword = keyword.trim();
        title = title.trim();
        introduction = introduction.trim();
        publishTime = publishTime.trim();
        typeId = typeId.trim();
        article = article.trim();

        if(!title){
            alert("??????????????????");
            return;
        }
        if(!keyword){
            alert("?????????????????????");
            return;
        }
        if(typeId == null){
            typeId = post_typeId;
        }
        if (topImg==''){
            $.post('/post/editPost',{
                postId:post_postId,
                keyword:keyword,
                title:title,
                introduction:introduction,
                publishTime:publishTime,
                typeId:typeId,
                article:article
            },function (res){
                if (res && res.postId){
                    alert("??????????????????");
                    location.href="/postDetail?postId="+post_postId;
                }
            }).fail(function (res){
                alert(res.responseJSON.message);
            })
        }else {
            $.post('/post/editPost',{
                postId:post_postId,
                topImg:topImg,
                keyword:keyword,
                title:title,
                introduction:introduction,
                publishTime:publishTime,
                typeId:typeId,
                article:article
            },function (res){
                if (res && res.postId){
                    alert("??????????????????");
                    location.href="/postDetail?postId="+post_postId;
                }
            }).fail(function (res){
                alert(res.responseJSON.message);
            })
        }

    });

    var data;
    $('#file').change(function (){
        var file = $(this)[0].files[0];
        data = new FormData();
        data.append("file",file);
    });

    $('#uploadImg').click(function (){
        var keyword = $('#postKeyword').val();
        var name = $('#imgName').val();

        keyword = keyword.trim();
        name = name.trim();

        if (!keyword){
            alert("keyword????????????");
            return;
        }
        if (!name){
            alert("name????????????");
            return;;
        }
        data.append("keyword",keyword);
        data.append("name",name);
        $.ajax({
            url:'/uploadImg',
            data:data,
            type:'POST',
            processData: false,
            contentType: false,
            success: function(res){
                alert("????????????");
            }
        })
    });
}

function AddPostFunc(){

    $('#copyCodeBlock').click(function (){
        var text = "<div class=\"code\"></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // ????????????
        document.execCommand("copy"); // ???????????????????????????
        InfoPrompt("????????????");
        setTimeout(RemoveInfoPrompt,1100);
    });
    $('#copyImgBlock').click(function (){
        var keyword = "${post.keyword}";
        var text = "<img class='lazy' data-src='../Img/"
            + keyword
            + "/NAME.TYPE'>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // ????????????
        document.execCommand("copy"); // ???????????????????????????
        InfoPrompt("????????????");
        setTimeout(RemoveInfoPrompt,1100);
    });
    $('#copyReferenceBlock').click(function (){
        var text = "<div class=\"reference\"></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // ????????????
        document.execCommand("copy"); // ???????????????????????????
        InfoPrompt("????????????");
        setTimeout(RemoveInfoPrompt,1100);
    });

    $('#savePost').click(function (){
        var topImg = $('#topImg').val();
        var keyword = $('#postKeyword').val();
        var title = $('#title').val();
        var introduction = $('#introduction').val();
        var publishTime = $('#publishTime').val();
        var typeId = $('#typeId').val();
        var article = $('#article').val();
        topImg = topImg.trim();
        keyword = keyword.trim();
        title = title.trim();
        introduction = introduction.trim();
        publishTime = publishTime.trim();
        typeId = typeId.trim();
        article = article.trim();
        if(!title){
            alert("??????????????????");
            return;
        }
        if(!keyword){
            alert("?????????????????????");
            return;
        }
        if (topImg==''){
            // console.log("null")
            $.post('/post/addPost',{
                keyword:keyword,
                title:title,
                introduction:introduction,
                publishTime:publishTime,
                typeId:typeId,
                article:article
            },function (res){
                if (res && res.postId){
                    alert("??????????????????");
                    location.href="/console";
                }
            }).fail(function (res){
                alert(res.responseJSON.message);
            })
        }else {
            $.post('/post/addPost',{
                topImg:topImg,
                keyword:keyword,
                title:title,
                introduction:introduction,
                publishTime:publishTime,
                typeId:typeId,
                article:article
            },function (res){
                if (res && res.postId){
                    alert("??????????????????");
                    location.href="/console";
                }
            }).fail(function (res){
                alert(res.responseJSON.message);
            })
        }
    });
    var data;

    $('#file').change(function (){
        var file = $(this)[0].files[0];
        data = new FormData();
        data.append("file",file);
    });

    $('#uploadImg').click(function (){
        var keyword = $('#postKeyword').val();
        var name = $('#imgName').val();
        keyword = keyword.trim();
        name = name.trim();
        if (!keyword){
            alert("keyword????????????");
            return;
        }
        if (!name){
            alert("name????????????");
            return;;
        }
        data.append("keyword",keyword);
        data.append("name",name);
        $.ajax({
            url:'/uploadImg',
            data:data,
            type:'POST',
            processData: false,
            contentType: false,
            success: function(res){
                alert("????????????");
            }
        })
    });
}

function ConsoleControlPostFunc(){
    $('body').on('click', '.console-container-set-status-button', function (){
        $.post('/post/setStatus',{
            postId:$(this).parent().parent().parent().attr('data-postId')
        },function (res){
            if (res&&res.postId){
                alert("??????????????????");
                location.reload();
            }else{
                alert("??????");
            }
        }).fail(function (res){
            alert(res.responseJSON.message);
        })
    });
    $('body').on('click', '.console-container-delete-button', function (){
        $.post('/post/deletePost',{
            postId:$(this).parent().parent().parent().attr('data-postId')
        },function (res){
            if (res&&res.postId){
                alert("??????????????????");
                location.reload();
            }else{
                alert("??????");
            }
        }).fail(function (res){
            alert(res.responseJSON.message);
        })
    });
}

function ConsoleTypeFunc(){
    $('#type0').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        $('.main').attr('data-type','');
        setCookie("console-type",$('.main').attr('data-type'));
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage=1"
    });
    $('#type1').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        $('.main').attr('data-type','1');
        setCookie("console-type",$('.main').attr('data-type'));
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage=1"
    });
    $('#type2').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        $('.main').attr('data-type','2');
        setCookie("console-type",$('.main').attr('data-type'));
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage=1"
    });
    $('#type3').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        $('.main').attr('data-type','3');
        setCookie("console-type",$('.main').attr('data-type'));
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage=1"
    });
    $('#type4').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        $('.main').attr('data-type','4');
        setCookie("console-type",$('.main').attr('data-type'));
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage=1"
    });
    $('#type5').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        $('.main').attr('data-type','5');
        setCookie("console-type",$('.main').attr('data-type'));
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage=1"
    });
}

function ConsolePageFunc(){
    $('#prePage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage - 1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage + 1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = 1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = totalPages;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#currentPre3Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-3;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-2;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage-1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }

    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+2;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
    $('#currentNext3Page').click(function(){
        setCookie("input-keyword",$('#keyword').val());
        var page = currentPage+3;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"));
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                + "&currentPage="
                + page;
        }
    });
}

/**
 * ??????cookie
 * @param name  cookie ???
 * @param value  cookie ???
 */
function setCookie(name, value) {
    var Days = 30; //??? cookie ???????????? 30 ???
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
/**
 * ??????cookie
 * @param name
 */
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
/**
 * ??????cookie
 * @param name
 * @returns
 */
function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null)
        return unescape(arr[2]);
    return null;
}