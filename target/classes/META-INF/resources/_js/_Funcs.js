function NavFunc(){
    $('#nav-index').click(function(){
        location.href="/index"
    })
    $('#topTitle-index').click(function(){
        location.href="/index"
    })
    $('#nav-post').click(function(){
        location.href="/post?type=1"
    })
    $('#nav-project').click(function(){
        location.href="/project?type=2"
    })
    $('#nav-note').click(function(){
        location.href="/note?type=3"
    })
    $('#nav-tools').click(function(){
        location.href="/tools?type=4"
    })
    $('#nav-tags').click(function(){
        location.href="/tags?type=5"
    })
    $('#nav-resume').click(function(){
        location.href="/resume"
    })
    $('#nav-console').click(function(){
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

function ConsoleBackTopFunc(){
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
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + $('#keyword').val()
            + "&currentPage=1"
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
                location.href = "/"+$('.main').attr('data-url');
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