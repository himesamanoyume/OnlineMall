<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/6
  Time: 1:44:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="info-container">
    <div class="info-container-inner">
        <div class="info">
            <img src="/_jsp/usericon.png" class="info-icon">
            <div class="info-name">姫様の夢</div>
            <div class="info-txt">Princess Dreamland</div>
        </div>
        <c:if test="${urlWhere !='index' and urlWhere !='postDetail' and urlWhere!='resume' and urlWhere!='editPost'}">
        <div class="info-link">
            <input type="text" class="searchBar" id="keyword"placeholder="模糊搜索标题" value="${keyword}"/>
            <div id="search" class="searchButton">搜索</div>
        </div>
        </c:if>
        <div class="info-link">
            <div id="info-theme" class="link-button">
                <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512" width="20px" height="40px">
                    <title>深色/浅色主题切换</title>
                    <circle cx="256" cy="256" r="208" fill="none" stroke="var(--text-color)" stroke-linejoin="round" stroke-width="32"/>
                    <path d="M256 464c-114.88 0-208-93.12-208-208S141.12 48 256 48z" fill="var(--text-color)" stroke="--text-color"/>
                </svg>
            </div>
        </div>
        <c:if test="${urlWhere !='postDetail' and urlWhere !='console' and urlWhere!='editPost'}">
            <div class="info-link">
                <input type="password" class="searchBar" name="password" placeholder="输入密码获取权限" value="${password}"/>
                <div id="permiSubmit" class="searchButton">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>提交</title>
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M176 249.38L256 170l80 79.38M256 181.03V342"/>
                        <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/></svg>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 1}">
            <div class="info-link">
                <div class="permi-info">
                    当前权限:低级
                </div>

            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2}">
            <div class="info-link">
                <div class="permi-info">
                    当前权限:站长
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2 and urlWhere=='console'}">
            <div class="info-link">
                <div class="link-button" id="addPost">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>新增文章</title>
                        <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M256 176v160M336 256H176"/>
                    </svg>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2 and urlWhere=='addPost'}">
            <div class="info-link">
                <div class="link-button" id="savePost">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>保存</title>
                        <path d="M380.93 57.37A32 32 0 00358.3 48H94.22A46.21 46.21 0 0048 94.22v323.56A46.21 46.21 0 0094.22 464h323.56A46.36 46.36 0 00464 417.78V153.7a32 32 0 00-9.37-22.63zM256 416a64 64 0 1164-64 63.92 63.92 0 01-64 64zm48-224H112a16 16 0 01-16-16v-64a16 16 0 0116-16h192a16 16 0 0116 16v64a16 16 0 01-16 16z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2 and urlWhere=='editPost'}">
            <div class="info-link">
                <div class="link-button" id="saveEdit">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>保存</title>
                        <path d="M380.93 57.37A32 32 0 00358.3 48H94.22A46.21 46.21 0 0048 94.22v323.56A46.21 46.21 0 0094.22 464h323.56A46.36 46.36 0 00464 417.78V153.7a32 32 0 00-9.37-22.63zM256 416a64 64 0 1164-64 63.92 63.92 0 01-64 64zm48-224H112a16 16 0 01-16-16v-64a16 16 0 0116-16h192a16 16 0 0116 16v64a16 16 0 01-16 16z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
            </div>
            <div class="info-link">
                <div class="link-button" id="copyImgBlock">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>复制图片块</title>
                        <rect x="48" y="80" width="416" height="352" rx="48" ry="48" fill="none" stroke="var(--text-color)" stroke-linejoin="round" stroke-width="32"/>
                        <circle cx="336" cy="176" r="32" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                        <path d="M304 335.79l-90.66-90.49a32 32 0 00-43.87-1.3L48 352M224 432l123.34-123.34a32 32 0 0143.11-2L464 368" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
                <div class="link-button" id="copyCodeBlock">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>复制代码块</title>
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M160 368L32 256l128-112M352 368l128-112-128-112"/>
                    </svg>
                </div>
                <div class="link-button" id="copyReferenceBlock">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <title>复制引用块</title>
                        <path d="M256 160c16-63.16 76.43-95.41 208-96a15.94 15.94 0 0116 16v288a16 16 0 01-16 16c-128 0-177.45 25.81-208 64-30.37-38-80-64-208-64-9.88 0-16-8.05-16-17.93V80a15.94 15.94 0 0116-16c131.57.59 192 32.84 208 96zM256 160v288" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
            </div>
        </c:if>
    </div>

</aside>