$(document).ready(function(){
    InitFunc();
    SaveThemeCookie();
    ThemeSetFunc();
    NavFunc();
    EditAndDetailFunc();
    BackTopFunc();
    $('.lazy').click(function (){
        window.open($(this).attr('src'))
    })
})