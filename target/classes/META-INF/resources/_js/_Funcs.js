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