/*
 * @Author: your name
 * @Date: 2021-10-23 09:49:25
 * @LastEditTime: 2021-10-23 13:57:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \static\MyIndexJS.js
 */
window.onscroll=function(){
    
    var topScroll = get_scrollTop_of_body();//滚动的距离,距离顶部的距离
    var divSpace = document.getElementById("divSpace");//获取到导航栏id
    if(topScroll > 350){
        divSpace.style.top = '0px';
        divSpace.style.width = '100%';
        divSpace.style.zIndex = '9999';
        divSpace.style.boxShadow = '0px 3px 7px Gainsboro';
    }else{
        divSpace.style.boxShadow = '0px 0px 0px Gainsboro';
    }
}
window.onload = function(){
    changeMaxWidth();
}
window.onresize = function(){
    changeMaxWidth();
}
function changeMaxWidth(){
    var indexBackground = document.getElementById("indexBackground");
    var webWidth = document.body.clientWidth;
    // console.log(webWidth);
    if(webWidth>=1680){
        indexBackground.style.maxWidth = 1680 +"px";
        // console.log(1);
    }else if(webWidth>=1260 && webWidth <1680){
        indexBackground.style.maxWidth = 1260 +"px";
        // console.log(2);
    }else if(webWidth>=840 && webWidth <1260){
        indexBackground.style.maxWidth = 840 +"px";
        // console.log(3);
    }else if(webWidth>=420 && webWidth <840){
        indexBackground.style.maxWidth = 420 +"px";
        // console.log(4);
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