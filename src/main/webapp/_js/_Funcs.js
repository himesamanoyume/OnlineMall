
function InitFunc(){
    if (getCookie("input-keyword")){
        $('.main').attr("data-keyword",getCookie("input-keyword"))
        $('#keyword').attr("value",getCookie("input-keyword"))
        delCookie("input-keyword")
    }
    var nowUrl = $('.main').attr("data-url")
    if (nowUrl=='post') {
        $('#nav-post').css("color", "#66ccff")
    }else if (nowUrl=='project') {
        $('#nav-project').css("color", "#66ccff")
    }else if (nowUrl=='note') {
        $('#nav-note').css("color","#66ccff")
    }else if (nowUrl=='tools') {
        $('#nav-tools').css("color", "#66ccff")
    }else if (nowUrl=='dynamic') {
        $('#nav-dynamic').css("color", "#66ccff")
    }else if (nowUrl=='resume') {
        $('#nav-resume').css("color", "#66ccff")
    }else if (nowUrl=='console'){
        $('#nav-console').css("color", "#66ccff")
    }


    $('.lazy').Lazy({
        effect: "fadeIn",
        effectTime: 500,
        threshold: 0,
        onError: function(element) {
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
            delCookie("input-keyword")
        }
        location.href="/"
    })
    $('#topTitle-index').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/"
    })
    $('#nav-post').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/post?type=1"
    })
    $('#nav-project').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/project?type=2"
    })
    $('#nav-note').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/note?type=3"
    })
    $('#nav-tools').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/tools?type=4"
    })
    $('#nav-dynamic').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/dynamic?type=5"
    })
    $('#nav-resume').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        location.href="/resume"
    })
    $('#info-console').click(function(){
        if (getCookie("input-keyword")){
            delCookie("input-keyword")
        }
        if (getCookie('console-type')){
            delCookie('console-type')
        }
        location.href="/console"
    })
}

function PostOpenDetailFunc(){
    $('.post').click(function (){
        location.href="/postDetail?postId=" + $(this).attr('data-postId')
    })
}

function ConsolePostOpenEditFunc(){

    $('body').on('click', '.console-container-edit-button', function (){
        location.href="/editPost?postId=" + $(this).parent().parent().parent().attr('data-postId')
    })
}

function ConsolePostOpenDetailFunc(){

    $('body').on('click', '.console-container-detail-button', function (){
        location.href="/postDetail?postId=" + $(this).parent().parent().parent().attr('data-postId')
    })
}

function queryImgFunc(){
    $('#queryKeywordImg').click(function (){
        var data = new FormData()
        var imgURL = window.location.host;
        var keyword = $('#postKeyword').val()
        keyword = keyword.trim()
        if (!keyword){
            alert("keyword不能为空")
            return
        }

        data.append("keyword",keyword)
        $.ajax({
            url:'/searchImg',
            data:data,
            type:'POST',
            processData: false,
            contentType: false,
            success: function(res){
                for (var i=0;i<res.length;i++){
                    console.log("keyword:"+res[i].keyword+",name:"+res[i].name+",url:http://"+imgURL+"/Img/"+res[i].keyword+"/"+res[i].name)
                }
                // alert("控制台已打印出图片信息")
            },
            error:function (res){
                alert(res)
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
        location.href="/postDetail?postId=" + $('.post').attr('data-postId')
    })

    $('#goEdit').click(function (){
        location.href="/editPost?postId=" + $('.post').attr('data-postId')
    })
}

function InfoPrompt(str){
    var prompt = "<div id='tempPrompt' class=\"info-link\"><div class=\"permi-info\">"+ str +"</div></div>"
    $('#info-container-inner').append(prompt)
}

function RemoveInfoPrompt(){
    document.getElementById("tempPrompt").remove()
}

function SearchButtonFunc(){
    $('#search').click(function (){
        setCookie("input-keyword",$('#keyword').val())
        if ( $('.main').attr('data-url')=='index'){

            location.href="/?type=&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage=1"
        }else if($('.main').attr('data-url')=='console'){
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
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
            alert("密码不能为空");
            return;
        }

        $.post('/permi/login',{
            password:password
        },function(res){
            if(res && res.permiId){
                alert('获取权限成功，导航栏简历按钮已开放')
                if ($('.main').attr('data-url')=='index'){
                    location.href = "/";
                }else {
                    location.href = "/"+$('.main').attr('data-url')+"?type="+$('.main').attr('data-type');
                }

            }else{
                alert('获取权限失败')
            }
        }).fail(function(res){
            alert(res.responseJSON.message)
        })
    })
}

function ConsoleAddPostFunc(){
    $('#addPost').click(function (){
        location.href="/addPost"
    })
}

const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)')//dark

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

function IndexPageFunc(){
    $('#prePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage - 1;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage + 1;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = 1;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = totalPages;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-2;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-1;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+1;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+2;
        location.href="/?type="
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
}

function PageFunc(){
    $('#prePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage - 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage + 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = totalPages;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + getCookie("input-keyword")
            // + $('#keyword').val()
            + "&currentPage="
            + page;
    });
}

function NoSearchPageFunc(){
    $('#prePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage - 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage + 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = 1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = totalPages;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+1;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+2;
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + "&currentPage="
            + page;
    });
}

function editPostFunc(){
    $('#copyCodeBlock').click(function (){
        var text = "<div class=\"code\"><p></p></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // 选中文本
        document.execCommand("copy"); // 执行浏览器复制命令
        InfoPrompt("复制成功")
        setTimeout(RemoveInfoPrompt,2000)
    })

    $('#copyImgBlock').click(function (){
        var keyword = post_keyword
        var text = "<img class='lazy' data-src='../Img/"
            + keyword
            + "/NAME.TYPE'>"
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // 选中文本
        document.execCommand("copy"); // 执行浏览器复制命令
        InfoPrompt("复制成功")
        setTimeout(RemoveInfoPrompt,2000)
    })

    $('#copyReferenceBlock').click(function (){
        var text = "<div class=\"reference\"><p></p></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // 选中文本
        document.execCommand("copy"); // 执行浏览器复制命令
        InfoPrompt("复制成功")
        setTimeout(RemoveInfoPrompt,1100)
    })

    $('#saveEdit').click(function (){
        var topImg = $('#topImg').val()
        var keyword = $('#postKeyword').val()
        var title = $('#title').val()
        var introduction = $('#introduction').val()
        var publishTime = $('#publishTime').val()
        var typeId = $('#typeId').val()
        var article = $('#article').val()

        topImg = topImg.trim()
        keyword = keyword.trim()
        title = title.trim()
        introduction = introduction.trim()
        publishTime = publishTime.trim()
        typeId = typeId.trim()
        article = article.trim()

        if(!title){
            alert("标题不能为空")
            return
        }
        if(!keyword){
            alert("关键字不能为空")
            return
        }
        if(typeId == null){
            typeId = post_typeId
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
                    alert("编辑文章成功")
                    location.href="/postDetail?postId="+post_postId;
                }
            }).fail(function (res){
                alert(res.responseJSON.message)
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
                    alert("新增文章成功")
                    location.href="/postDetail?postId="+post_postId;
                }
            }).fail(function (res){
                alert(res.responseJSON.message)
            })
        }

    });

    var data;
    $('#file').change(function (){
        var file = $(this)[0].files[0];
        data = new FormData()
        data.append("file",file)
    });

    $('#uploadImg').click(function (){
        var keyword = $('#postKeyword').val()
        var name = $('#imgName').val()

        keyword = keyword.trim();
        name = name.trim();

        if (!keyword){
            alert("keyword不能为空")
            return
        }
        if (!name){
            alert("name不能为空")
            return;
        }
        data.append("keyword",keyword)
        data.append("name",name)
        $.ajax({
            url:'/uploadImg',
            data:data,
            type:'POST',
            processData: false,
            contentType: false,
            success: function(res){
                alert("上传成功")
            }
        })
    });
}

function addPostFunc(){

    $('#copyCodeBlock').click(function (){
        var text = "<div class=\"code\"><p></p></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // 选中文本
        document.execCommand("copy"); // 执行浏览器复制命令
        InfoPrompt("复制成功")
        setTimeout(RemoveInfoPrompt,1100)
    })
    $('#copyImgBlock').click(function (){
        var keyword = "${post.keyword}"
        var text = "<img class='lazy' data-src='../Img/"
            + keyword
            + "/NAME.TYPE'>"
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // 选中文本
        document.execCommand("copy"); // 执行浏览器复制命令
        InfoPrompt("复制成功")
        setTimeout(RemoveInfoPrompt,1100)
    })
    $('#copyReferenceBlock').click(function (){
        var text = "<div class=\"reference\"><p></p></div>";
        var input = document.getElementById("tempInput");
        input.value = text;
        input.select(); // 选中文本
        document.execCommand("copy"); // 执行浏览器复制命令
        InfoPrompt("复制成功")
        setTimeout(RemoveInfoPrompt,1100)
    })

    $('#savePost').click(function (){
        var topImg = $('#topImg').val()
        var keyword = $('#postKeyword').val()
        var title = $('#title').val()
        var introduction = $('#introduction').val()
        var publishTime = $('#publishTime').val()
        var typeId = $('#typeId').val()
        var article = $('#article').val()
        topImg = topImg.trim()
        keyword = keyword.trim()
        title = title.trim()
        introduction = introduction.trim()
        publishTime = publishTime.trim()
        typeId = typeId.trim()
        article = article.trim()
        if(!title){
            alert("标题不能为空")
            return
        }
        if(!keyword){
            alert("关键字不能为空")
            return
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
                    alert("新增文章成功")
                    location.href="/console";
                }
            }).fail(function (res){
                alert(res.responseJSON.message)
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
                    alert("新增文章成功")
                    location.href="/console";
                }
            }).fail(function (res){
                alert(res.responseJSON.message)
            })
        }
    });
    var data;

    $('#file').change(function (){
        var file = $(this)[0].files[0];
        data = new FormData()
        data.append("file",file)
    });

    $('#uploadImg').click(function (){
        var keyword = $('#postKeyword').val()
        var name = $('#imgName').val()
        keyword = keyword.trim();
        name = name.trim();
        if (!keyword){
            alert("keyword不能为空")
            return
        }
        if (!name){
            alert("name不能为空")
            return;
        }
        data.append("keyword",keyword)
        data.append("name",name)
        $.ajax({
            url:'/uploadImg',
            data:data,
            type:'POST',
            processData: false,
            contentType: false,
            success: function(res){
                alert("上传成功")
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
                alert("状态改变成功")
                location.reload();
            }else{
                alert("失败")
            }
        }).fail(function (res){
            alert(res.responseJSON.message)
        })
    });
    $('body').on('click', '.console-container-delete-button', function (){
        $.post('/post/deletePost',{
            postId:$(this).parent().parent().parent().attr('data-postId')
        },function (res){
            if (res&&res.postId){
                alert("删除文章成功")
                location.reload();
            }else{
                alert("失败")
            }
        }).fail(function (res){
            alert(res.responseJSON.message)
        })
    });
}

function ConsoleTypeFunc(){
    $('#type0').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        $('.main').attr('data-type','')
        setCookie("console-type",$('.main').attr('data-type'))
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
        setCookie("input-keyword",$('#keyword').val())
        $('.main').attr('data-type','1')
        setCookie("console-type",$('.main').attr('data-type'))
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
        setCookie("input-keyword",$('#keyword').val())
        $('.main').attr('data-type','2')
        setCookie("console-type",$('.main').attr('data-type'))
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
        setCookie("input-keyword",$('#keyword').val())
        $('.main').attr('data-type','3')
        setCookie("console-type",$('.main').attr('data-type'))
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
        setCookie("input-keyword",$('#keyword').val())
        $('.main').attr('data-type','4')
        setCookie("console-type",$('.main').attr('data-type'))
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
        setCookie("input-keyword",$('#keyword').val())
        $('.main').attr('data-type','5')
        setCookie("console-type",$('.main').attr('data-type'))
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
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage - 1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
    $('#nextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage + 1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
    $('#firstPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = 1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
    $('#lastPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = totalPages;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
    $('#currentPre2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-2;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
    $('#currentPrePage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage-1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
    $('#currentNextPage').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+1;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }

    });
    $('#currentNext2Page').click(function(){
        setCookie("input-keyword",$('#keyword').val())
        var page = currentPage+2;
        if (getCookie("console-type")){
            $('.main').attr('data-type',getCookie("console-type"))
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + $('.main').attr('data-type')
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }else{
            location.href="/"
                + $('.main').attr('data-url')
                + "?type="
                + "&keyword="
                + getCookie("input-keyword")
                // + $('#keyword').val()
                + "&currentPage="
                + page;
        }
    });
}

/**
 * 写入cookie
 * @param name  cookie 名
 * @param value  cookie 值
 */
function setCookie(name, value) {
    var Days = 30; //此 cookie 将被保存 30 天
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}
/**
 * 删除cookie
 * @param name
 */
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
/**
 * 读取cookie
 * @param name
 * @returns
 */
function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null)
        return unescape(arr[2]);
    return null;
}