function NavFunc(){
    $('#nav-index').click(function(){
        location.href="/index"
    })
    $('#nav-post').click(function(){
        location.href="/post?type=1"
        // location.href="/post?type=1&currentPage=1"
    })
    $('#nav-project').click(function(){
        // location.href="/project?type=2&currentPage=1"
        location.href="/project?type=2"
    })
    $('#nav-note').click(function(){
        // location.href="/note?type=3&currentPage=1"
        location.href="/note?type=3"
    })
    $('#nav-tools').click(function(){
        // location.href="/tools?type=4&currentPage=1"
        location.href="/tools?type=4"
    })
    $('#nav-tags').click(function(){
        // location.href="/tags?type=5&currentPage=1"
        location.href="/tags?type=5"
    })
    $('#nav-resume').click(function(){
        location.href="/resume"
    })
}

function PostOpenDetailFunc(){
    $('.post').click(function (){
        location.href="/postDetail?postId=" + $(this).attr('data-postId')
    })
}

function SearchButtonFunc(){
    $('.searchButton').click(function (){
        location.href="/"
            + $('.main').attr('data-url')
            + "?type="
            + $('.main').attr('data-type')
            + "&keyword="
            + $('#keyword').val()
            + "&currentPage=1"
    })
}
const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)')//dark

function ThemeSetFunc(){

    $('#nav-theme').click(function (){
        $('*').css('transition-duration','0.2s');
        if (mediaQuery.matches) {
            if (getCookie('prefer-theme')){
                if (getCookie('prefer-theme')=='auto'){
                    $('#body').attr('data-theme','light');
                    console.log(1)
                }else{
                    $('#body').attr('data-theme','auto');
                    console.log(2)
                }
            }else{
                if ($('#body').attr('data-theme')=='auto'){
                    $('#body').attr('data-theme','light');
                    console.log(3)
                }else{
                    $('#body').attr('data-theme','auto');
                    console.log(4)
                }
            }

        }else{
            if (getCookie('prefer-theme')){
                if (getCookie('prefer-theme')=='auto'){
                    $('#body').attr('data-theme','dark');
                    console.log(5)
                }else{
                    $('#body').attr('data-theme','auto');
                    console.log(6)
                }
            }else {
                if ($('#body').attr('data-theme')=='auto'){
                    $('#body').attr('data-theme','dark');
                    console.log(7)
                }else{
                    $('#body').attr('data-theme','auto');
                    console.log(8)
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