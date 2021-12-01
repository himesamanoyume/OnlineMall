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
    <title>简历 | HimeBlog</title>
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    <style>
        <%@include file="../_component/_style.jsp" %>
        @import "../_css/resume.css";
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
            SearchButtonFunc();
            PermissionButtonFunc();
        })

    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="resume"/>
    <main class="main" data-url="resume">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <div class="post-important">
                    <h1>个人简历</h1>
                </div>
                <div class="post-noblue">
                    <div class="post-resume-content">
                        <h4>电话：18934899580</h4>
                    </div>
                    <div class="post-resume-content">
                        <h4>邮箱：285835609@qq.com</h4>
                    </div>
                    <div class="post-resume-content">
                        <h4>教育经历：2018.9.1 - 2022.6.1</h4>
                    </div>
                    <div class="post-resume-content">
                        <h4>软件工程(虚拟现实与系统工程方向)专业</h4>
                    </div>
                </div>
                <div class="post-important">
                    <h2>求职目标：U3D开发工程师</h2>
                </div>
                <div class="post-noblue">
                    <h2>项目经历</h2>
                </div>
                <div class="post">
                    <h3>1on1BattleRoyal(2D双人单挑王) - PC端</h3>
                    <div class="post-resume-container">
                        <div class="post-resume-content">项目时间：2021.6 – 2021.7</div>
                        <div class="post-resume-content">
                            <div class="svg-content">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                    <path d="M344 144c-3.92 52.87-44 96-88 96s-84.15-43.12-88-96c-4-55 35-96 88-96s92 42 88 96z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                                    <path d="M256 304c-87 0-175.3 48-191.64 138.6C62.39 453.52 68.57 464 80 464h352c11.44 0 17.62-10.48 15.65-21.4C431.3 352 343 304 256 304z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                </svg>
                            </div>
                            项目角色：全栈
                        </div>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>使用Unity3D开发，使用了NGUI制作UI</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>项目包含了楼层场景自动生成，由射线检测和随机选取预制物实现的无误差间隔生成时间</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>实现基础人物操作外还由射线检测实现了判定是否落地才可进行跳跃</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>随机道具生成由随机数匹配对应位置产生预制物，与角色通过碰撞检测激活如子弹时间、武器升级、生命恢复效果</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>健壮的人物动作Animation，没有任何突兀的过渡</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>项目代码耦合性低，简洁美观，注释完善</p>
                    </div>
                    <div class="post-resume-link-container">
                        <a class="link" href="/postDetail?postId=20">查看详细</a>
                    </div>
                </div>
                <div class="post">
                    <h3>Easy Chat (简易聊天室) - PC端</h3>
                    <div class="post-resume-container">
                        <div class="post-resume-content">项目时间：2021.5</div>
                        <div class="post-resume-content">
                            <div class="svg-content">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                    <path d="M344 144c-3.92 52.87-44 96-88 96s-84.15-43.12-88-96c-4-55 35-96 88-96s92 42 88 96z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                                    <path d="M256 304c-87 0-175.3 48-191.64 138.6C62.39 453.52 68.57 464 80 464h352c11.44 0 17.62-10.48 15.65-21.4C431.3 352 343 304 256 304z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                </svg>
                            </div>
                            项目角色：全栈
                        </div>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>客户端使用Unity3D开发，UGUI制作UI，服务端使用Visual Studio开发为cmd命令行程序</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>用阿里云服务器架设服务端，与客户端通过HTTP协议进行文字通信</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>允许服务端与多个客户端进行连接，客户端可任意进出聊天室，聊天者发送消息用名称区分，聊天消息可为所有进入聊天室的客户端所见</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>通过算法解决了HTTP通信特性导致的消息内容缺失</p>
                    </div>
                    <div class="post-resume-link-container">
                        <a class="link" href="/postDetail?postId=21">查看详细</a>
                    </div>
                </div>
                <div class="post">
                    <h3>Tower Defender (塔防) - PC端</h3>
                    <div class="post-resume-container">
                        <div class="post-resume-content">项目时间：2020.11</div>
                        <div class="post-resume-content">
                            <div class="svg-content">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                    <path d="M344 144c-3.92 52.87-44 96-88 96s-84.15-43.12-88-96c-4-55 35-96 88-96s92 42 88 96z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                                    <path d="M256 304c-87 0-175.3 48-191.64 138.6C62.39 453.52 68.57 464 80 464h352c11.44 0 17.62-10.48 15.65-21.4C431.3 352 343 304 256 304z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                </svg>
                            </div>
                            项目角色：全栈
                        </div>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>使用Unity3D开发，UGUI制作UI</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>实现了防御塔花费金币升级，自动攻击范围内最靠前的敌人等功能</p>
                    </div>
                    <div class="post-resume-link-container">
                        <a class="link" href="/postDetail?postId=22">查看详细</a>
                    </div>
                </div>
                <div class="post">
                    <h3>其他项目</h3>
                    <div class="post-resume-content-txt">
                        <p>简易音游(处女作)、飞机大战、消消乐、简易TPS射击、NGUI背包系统、简易FPS射击、VR全景视频(皆为PC端)</p>
                    </div>
                </div>
                <div class="post-noblue">
                    <h2>About Me</h2>
                </div>
                <div class="post">
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>熟悉Unity3D及其各种系统和生命周期、C#、NGUI插件的使用</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>熟悉git版本管理系统的使用</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>了解Lua及xLua的基本用法，有简单热更新的经验</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>了解数据结构，算法，设计模式和计算机网络</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>通读Unity2018中文文档，能够查阅国外英文开发文档，善于使用搜索引擎，自学能力较强，待人团结友善</p>
                    </div>
                    <div class="post-resume-content-txt">
                        <div class="svg-content">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24px" height="24px">
                                <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                                <circle fill="var(--text-color)" cx="256" cy="256" r="144"/>
                            </svg>
                        </div>
                        <p>了解HTML5,CSS3,Javascript,Java,C++,MySQL,有相关开发经历</p>
                    </div>
                </div>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>

