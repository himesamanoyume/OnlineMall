<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/10/23
  Time: 20:41:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    <title>编辑 | HimeBlog</title>

    <style>
        <%@include file="../_component/_style.jsp" %>
        @import "/_css/postDetail.css";
        @import "/_css/editPost.css";
    </style>
    <script src="/_js/jquery.js" type="text/javascript"></script>
    <script src="/_js/jquery.lazy.min.js" type="text/javascript"></script>
    <script src="/_js/_Funcs.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            InitFunc();
            SaveThemeCookie();
            ThemeSetFunc();
            NavFunc();
            editPostFunc();
            EditAndDetailFunc();
            queryImgFunc();
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
                    var keyword = "${post.keyword}"
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
                        typeId = ${post.typeId}
                    }
                    if (topImg==''){
                        $.post('/post/editPost',{
                            postId:${post.postId},
                            keyword:keyword,
                            title:title,
                            introduction:introduction,
                            publishTime:publishTime,
                            typeId:typeId,
                            article:article
                        },function (res){
                            if (res && res.postId){
                                alert("编辑文章成功")
                                location.href="/postDetail?postId="+${post.postId};
                            }
                        }).fail(function (res){
                            alert(res.responseJSON.message)
                        })
                    }else {
                        $.post('/post/editPost',{
                            postId:${post.postId},
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
                                location.href="/postDetail?postId="+${post.postId};
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

        })

    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="editPost"/>
    <main class="main" data-url="editPost">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <%@include file="../_component/_post.jsp" %>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>

