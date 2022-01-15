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
    <div id="info-container-inner" class="info-container-inner">
        <c:if test="${urlWhere!='editPost' and urlWhere!='addPost' and urlWhere!='console'}">
            <div class="info">
                <img src="/_jsp/usericon.webp" class="info-icon">
                <div class="info-name">姫様の夢</div>
                <div class="info-txt">Princess Dreamland</div>
                <div class="info-txt">"Who care?"</div>
            </div>
        </c:if>
        <c:if test="${urlWhere !='postDetail' and urlWhere!='resume' and urlWhere!='editPost' and urlWhere!='dynamic' and urlWhere!='index' and urlWhere!='error'}">
        <div class="info-link">
            <input type="text" class="searchBar" id="keyword" placeholder="模糊搜索标题" value="${keyword}"/>
            <div id="search" title="搜索" class="searchButton">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="20px" height="40px">
                    <path d="M221.09 64a157.09 157.09 0 10157.09 157.09A157.1 157.1 0 00221.09 64z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                    <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-miterlimit="10" stroke-width="32" d="M338.29 338.29L448 448"/>
                </svg>
            </div>
        </div>
        </c:if>
        <div class="info-link">
            <div id="info-theme" title="深色/浅色主题切换" class="link-button">
                <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512" width="20px" height="40px">
                    <circle cx="256" cy="256" r="208" fill="none" stroke="var(--text-color)" stroke-linejoin="round" stroke-width="32"/>
                    <path d="M256 464c-114.88 0-208-93.12-208-208S141.12 48 256 48z" fill="var(--text-color)" stroke="--text-color"/>
                </svg>
            </div>
            <c:if test="${urlWhere!='resume'}">
            <div id="info-github" title="博主Github" class="link-button" onclick="window.open('https://github.com/himesamanoyume')">
                <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512" width="20px" height="40px">
                    <path fill="var(--text-color)" d="M256 32C132.3 32 32 134.9 32 261.7c0 101.5 64.2 187.5 153.2 217.9a17.56 17.56 0 003.8.4c8.3 0 11.5-6.1 11.5-11.4 0-5.5-.2-19.9-.3-39.1a102.4 102.4 0 01-22.6 2.7c-43.1 0-52.9-33.5-52.9-33.5-10.2-26.5-24.9-33.6-24.9-33.6-19.5-13.7-.1-14.1 1.4-14.1h.1c22.5 2 34.3 23.8 34.3 23.8 11.2 19.6 26.2 25.1 39.6 25.1a63 63 0 0025.6-6c2-14.8 7.8-24.9 14.2-30.7-49.7-5.8-102-25.5-102-113.5 0-25.1 8.7-45.6 23-61.6-2.3-5.8-10-29.2 2.2-60.8a18.64 18.64 0 015-.5c8.1 0 26.4 3.1 56.6 24.1a208.21 208.21 0 01112.2 0c30.2-21 48.5-24.1 56.6-24.1a18.64 18.64 0 015 .5c12.2 31.6 4.5 55 2.2 60.8 14.3 16.1 23 36.6 23 61.6 0 88.2-52.4 107.6-102.3 113.3 8 7.1 15.2 21.1 15.2 42.5 0 30.7-.3 55.5-.3 63 0 5.4 3.1 11.5 11.4 11.5a19.35 19.35 0 004-.4C415.9 449.2 480 363.1 480 261.7 480 134.9 379.7 32 256 32z"/>
                </svg>
            </div>
            <div id="info-bilibili" title="博主B站空间" class="link-button" onclick="window.open('https://space.bilibili.com/2256304')">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="40px">
                    <g>
                    <path fill="none" d="M0 0h24v24H0z"/>
                    <path fill="#2fa0fc" d="M7.172 2.757L10.414 6h3.171l3.243-3.242a1 1 0 0 1 1.415 1.415l-1.829 1.827L18.5 6A3.5 3.5 0 0 1 22 9.5v8a3.5 3.5 0 0 1-3.5 3.5h-13A3.5 3.5 0 0 1 2 17.5v-8A3.5 3.5 0 0 1 5.5 6h2.085L5.757 4.171a1 1 0 0 1 1.415-1.415zM18.5 8h-13a1.5 1.5 0 0 0-1.493 1.356L4 9.5v8a1.5 1.5 0 0 0 1.356 1.493L5.5 19h13a1.5 1.5 0 0 0 1.493-1.356L20 17.5v-8A1.5 1.5 0 0 0 18.5 8zM8 11a1 1 0 0 1 1 1v2a1 1 0 0 1-2 0v-2a1 1 0 0 1 1-1zm8 0a1 1 0 0 1 1 1v2a1 1 0 0 1-2 0v-2a1 1 0 0 1 1-1z"/>
                    </g>
                </svg>
            </div>
            <div id="info-steam" title="博主Steam主页" class="link-button" onclick="window.open('https://steamcommunity.com/id/141gk/')">
                <svg width="18px" height="40px" viewBox="0 0 256 259" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMidYMid">
                    <g>
                        <path d="M127.778579,0 C60.4203546,0 5.24030561,52.412282 0,119.013983 L68.7236558,147.68805 C74.5451924,143.665561 81.5845466,141.322185 89.1497766,141.322185 C89.8324924,141.322185 90.5059824,141.340637 91.1702465,141.377541 L121.735621,96.668877 L121.735621,96.0415165 C121.735621,69.1388208 143.425688,47.2457835 170.088511,47.2457835 C196.751333,47.2457835 218.441401,69.1388208 218.441401,96.0415165 C218.441401,122.944212 196.751333,144.846475 170.088511,144.846475 C169.719475,144.846475 169.359666,144.83725 168.99063,144.828024 L125.398299,176.205276 C125.425977,176.786507 125.444428,177.367738 125.444428,177.939743 C125.444428,198.144443 109.160732,214.575753 89.1497766,214.575753 C71.5836817,214.575753 56.8868387,201.917832 53.5655182,185.163615 L4.40997549,164.654462 C19.6326942,218.967277 69.0834655,258.786219 127.778579,258.786219 C198.596511,258.786219 256,200.847629 256,129.393109 C256,57.9293643 198.596511,0 127.778579,0 Z M80.3519677,196.332478 L64.6033732,189.763644 C67.389592,195.63131 72.2239585,200.539484 78.6359521,203.233444 C92.4932392,209.064206 108.472481,202.430791 114.247888,188.435116 C117.043333,181.663313 117.061785,174.190342 114.294018,167.400086 C111.526251,160.609831 106.295171,155.31417 99.5879487,152.491048 C92.9176301,149.695603 85.7767911,149.797088 79.5031858,152.186594 L95.777656,158.976849 C105.999942,163.276114 110.834309,175.122157 106.571948,185.436702 C102.318812,195.751247 90.574254,200.631743 80.3519677,196.332478 Z M202.30901,96.0424391 C202.30901,78.1165345 187.85204,63.5211763 170.092201,63.5211763 C152.323137,63.5211763 137.866167,78.1165345 137.866167,96.0424391 C137.866167,113.968344 152.323137,128.554476 170.092201,128.554476 C187.85204,128.554476 202.30901,113.968344 202.30901,96.0424391 Z M145.938821,95.9870838 C145.938821,82.4988323 156.779242,71.5661525 170.138331,71.5661525 C183.506646,71.5661525 194.347066,82.4988323 194.347066,95.9870838 C194.347066,109.475335 183.506646,120.408015 170.138331,120.408015 C156.779242,120.408015 145.938821,109.475335 145.938821,95.9870838 Z" fill="var(--text-color)"/>
                    </g>
                </svg>
            </div>
            </c:if>
            <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2}">
                <div id="info-console" title="后台" class="link-button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="21px" height="40px">
                        <path d="M436.67 184.11a27.17 27.17 0 01-38.3 0l-22.48-22.49a27.15 27.15 0 010-38.29l50.89-50.89a.85.85 0 00-.26-1.38C393.68 57 351.09 64.15 324.05 91c-25.88 25.69-27.35 64.27-17.87 98a27 27 0 01-7.67 27.14l-173 160.76a40.76 40.76 0 1057.57 57.54l162.15-173.3a27 27 0 0126.77-7.7c33.46 8.94 71.49 7.26 97.07-17.94 27.49-27.08 33.42-74.94 20.1-102.33a.85.85 0 00-1.36-.22z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-miterlimit="10" stroke-width="32"/>
                        <path d="M224 284c-17.48-17-25.49-24.91-31-30.29a18.24 18.24 0 01-3.33-21.35 20.76 20.76 0 013.5-4.62l15.68-15.29a18.66 18.66 0 015.63-3.87 18.11 18.11 0 0120 3.62c5.45 5.29 15.43 15 33.41 32.52M317.07 291.3c40.95 38.1 90.62 83.27 110 99.41a13.46 13.46 0 01.94 19.92L394.63 444a14 14 0 01-20.29-.76c-16.53-19.18-61.09-67.11-99.27-107" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/><path d="M17.34 193.5l29.41-28.74a4.71 4.71 0 013.41-1.35 4.85 4.85 0 013.41 1.35h0a9.86 9.86 0 008.19 2.77c3.83-.42 7.92-1.6 10.57-4.12 6-5.8-.94-17.23 4.34-24.54a207 207 0 0119.78-22.6c6-5.88 29.84-28.32 69.9-44.45A107.31 107.31 0 01206.67 64c22.59 0 40 10 46.26 15.67a89.54 89.54 0 0110.28 11.64 78.92 78.92 0 00-9.21-2.77 68.82 68.82 0 00-20-1.26c-13.33 1.09-29.41 7.26-38 14-13.9 11-19.87 25.72-20.81 44.71-.68 14.12 2.72 22.1 36.1 55.49a6.6 6.6 0 01-.34 9.16l-18.22 18a6.88 6.88 0 01-9.54.09c-21.94-21.94-36.65-33.09-45-38.16s-15.07-6.5-18.3-6.85a30.85 30.85 0 00-18.27 3.87 11.39 11.39 0 00-2.64 2 14.14 14.14 0 00.42 20.08l1.71 1.6a4.63 4.63 0 010 6.64L71.73 246.6a4.71 4.71 0 01-3.41 1.4 4.86 4.86 0 01-3.41-1.35l-47.57-46.43a4.88 4.88 0 010-6.72z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
            </c:if>
        </div>
        <c:if test="${urlWhere !='postDetail' and urlWhere !='console' and urlWhere!='editPost' and urlWhere!='addPost'}">
            <div class="info-link">
                <input type="password" class="searchBar" name="password" placeholder="输入密码获取权限" value="${password}"/>
                <div id="permiSubmit" title="提交" class="searchButton">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M176 249.38L256 170l80 79.38M256 181.03V342"/>
                        <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                    </svg>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi==null}">
            <div class="info-link">
                <div class="permi-info">
                    当前权限:游客
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
        <c:if test="${sessionScope.permi!=null and urlWhere=='resume'}">
            <div class="info" style="height: 100%">
                <img src="/_jsp/qrcode.webp" class="info-icon">
                <div class="info-resume"><span class="highlight">princessdreamland.design</span></div>
                <div class="info-resume">欢迎来到我的个人博客</div>
                <div class="info-resume">在右侧侧边栏输入权限密码</div>
                <div class="info-resume"><span class="highlight">lzp19990510</span></div>
                <div class="info-resume">即可解锁简历页面</div>
                <div class="info-resume">可以查看项目的更详细信息哦！</div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2 and urlWhere=='console'}">
            <div class="info-link">
                <div class="link-button" title="新增文章" id="addPost">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M256 176v160M336 256H176"/>
                    </svg>
                </div>
                <div class="link-button" title="回到顶部" id="backTop">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M112 244l144-144 144 144M256 120v292"/>
                    </svg>
                </div>
            </div>
        </c:if>
        <c:if test="${urlWhere=='postDetail'}">
            <div class="info-link">
                <div class="link-button" title="回到顶部" id="backTop">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M112 244l144-144 144 144M256 120v292"/>
                    </svg>
                </div>
                <c:if test="${(sessionScope.permi!=null and sessionScope.permi.type == 2)}">
                <div class="link-button" title="编辑该文章" id="goEdit">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path d="M384 224v184a40 40 0 01-40 40H104a40 40 0 01-40-40V168a40 40 0 0140-40h167.48" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                        <path fill="var(--text-color)" d="M459.94 53.25a16.06 16.06 0 00-23.22-.56L424.35 65a8 8 0 000 11.31l11.34 11.32a8 8 0 0011.34 0l12.06-12c6.1-6.09 6.67-16.01.85-22.38zM399.34 90L218.82 270.2a9 9 0 00-2.31 3.93L208.16 299a3.91 3.91 0 004.86 4.86l24.85-8.35a9 9 0 003.93-2.31L422 112.66a9 9 0 000-12.66l-9.95-10a9 9 0 00-12.71 0z"/>
                    </svg>
                </div>
                </c:if>
            </div>
        </c:if>
        <c:if test="${(sessionScope.permi!=null and sessionScope.permi.type == 2)and (urlWhere=='addPost' or urlWhere=='editPost')}">
            <div class="info-link">
                <div class="link-button" title="保存" <c:if test="${urlWhere=='addPost'}">id="savePost"</c:if><c:if test="${urlWhere=='editPost'}">id="saveEdit"</c:if>>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path d="M380.93 57.37A32 32 0 00358.3 48H94.22A46.21 46.21 0 0048 94.22v323.56A46.21 46.21 0 0094.22 464h323.56A46.36 46.36 0 00464 417.78V153.7a32 32 0 00-9.37-22.63zM256 416a64 64 0 1164-64 63.92 63.92 0 01-64 64zm48-224H112a16 16 0 01-16-16v-64a16 16 0 0116-16h192a16 16 0 0116 16v64a16 16 0 01-16 16z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
            </div>
            <div class="info-link">
                <input id="imgName" type="text" class="nameBar" placeholder="输入图片名"/>
                <input id="file" type="file" class="fileButton" accept="image/*" multiple="multiple"/>
                <div id="uploadImg" title="图片上传" class="searchButton">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M176 249.38L256 170l80 79.38M256 181.03V342"/>
                        <path d="M448 256c0-106-86-192-192-192S64 150 64 256s86 192 192 192 192-86 192-192z" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                    </svg>
                </div>
            </div>
            <div class="info-link">
                <div class="link-button" title="复制图片块" id="copyImgBlock">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <rect x="48" y="80" width="416" height="352" rx="48" ry="48" fill="none" stroke="var(--text-color)" stroke-linejoin="round" stroke-width="32"/>
                        <circle cx="336" cy="176" r="32" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                        <path d="M304 335.79l-90.66-90.49a32 32 0 00-43.87-1.3L48 352M224 432l123.34-123.34a32 32 0 0143.11-2L464 368" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
                <div class="link-button" title="复制代码块" id="copyCodeBlock">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M160 368L32 256l128-112M352 368l128-112-128-112"/>
                    </svg>
                </div>
                <div class="link-button" title="复制引用块" id="copyReferenceBlock">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path d="M256 160c16-63.16 76.43-95.41 208-96a15.94 15.94 0 0116 16v288a16 16 0 01-16 16c-128 0-177.45 25.81-208 64-30.37-38-80-64-208-64-9.88 0-16-8.05-16-17.93V80a15.94 15.94 0 0116-16c131.57.59 192 32.84 208 96zM256 160v288" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
                <div class="link-button" title="查询本关键字已有图片" id="queryKeywordImg">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path d="M440 432H72a40 40 0 01-40-40V120a40 40 0 0140-40h75.89a40 40 0 0122.19 6.72l27.84 18.56a40 40 0 0022.19 6.72H440a40 40 0 0140 40v240a40 40 0 01-40 40zM32 192h448" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                    </svg>
                </div>
                <div class="link-button" title="查看详细" id="goDetail">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                        <path d="M255.66 112c-77.94 0-157.89 45.11-220.83 135.33a16 16 0 00-.27 17.77C82.92 340.8 161.8 400 255.66 400c92.84 0 173.34-59.38 221.79-135.25a16.14 16.14 0 000-17.47C428.89 172.28 347.8 112 255.66 112z" fill="none" stroke="var(--text-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                        <circle cx="256" cy="256" r="80" fill="none" stroke="var(--text-color)" stroke-miterlimit="10" stroke-width="32"/>
                    </svg>
                </div>
            </div>
        </c:if>

    </div>

</aside>