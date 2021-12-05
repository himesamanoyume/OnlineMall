
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
    $('#nav-console').click(function(){
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

function ConsolePostOpenDetailFunc(){

    $('body').on('click', '.console-container-edit-button', function (){
        location.href="/editPost?postId=" + $(this).parent().parent().parent().attr('data-postId')
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