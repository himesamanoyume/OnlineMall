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

<div class="post-page">
    <div class="post-page-container">
        <c:if test="${totalPages==0}">
            <div class="post-page-container-nullSearch">找不到任何东西哦</div>
        </c:if>
        <c:if test="${totalPages!=0}">
            <div class="post-page-container-content-left">
                <c:if test="${currentPage>1}">
                    <div class="post-page-container-button" id="prePage" title="上一页">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                            <path fill="none" stroke="var(--page-button-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M328 112L184 256l144 144"/>
                        </svg>
                    </div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage-4)>0}">
                    <div class="post-page-container-button" id="firstPage">1</div>
                    <div class="post-page-container-currentPage">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                            <title>省略</title>
                            <circle fill="var(--page-current-color)" cx="256" cy="256" r="48"/>
                            <circle fill="var(--page-current-color)" cx="416" cy="256" r="48"/>
                            <circle fill="var(--page-current-color)" cx="96" cy="256" r="48"/>
                        </svg>
                    </div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage-3)>0 and (currentPage-4)!=1}">
                    <div class="post-page-container-button" id="currentPre3Page">${currentPage-3}</div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage-2)>0}">
                    <div class="post-page-container-button" id="currentPre2Page">${currentPage-2}</div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage-1)>0}">
                    <div class="post-page-container-button" id="currentPrePage">${currentPage-1}</div>
                </c:if>
            </div>
            <c:if test="${currentPage!=null}">
                <div class="post-page-container-currentPage" id="currentPage">${currentPage}</div>
            </c:if>
            <div class="post-page-container-content-right">
                <c:if test="${currentPage!=null and (currentPage+1)<=totalPages}">
                    <div class="post-page-container-button" id="currentNextPage">${currentPage+1}</div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage+2)<=totalPages}">
                    <div class="post-page-container-button" id="currentNext2Page">${currentPage+2}</div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage+3)<=totalPages and (currentPage+4)!=totalPages}">
                    <div class="post-page-container-button" id="currentNext3Page">${currentPage+3}</div>
                </c:if>
                <c:if test="${currentPage!=null and (currentPage+4)<=totalPages}">
                    <div class="post-page-container-currentPage">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                            <title>省略</title>
                            <circle fill="var(--page-current-color)" cx="256" cy="256" r="48"/>
                            <circle fill="var(--page-current-color)" cx="416" cy="256" r="48"/>
                            <circle fill="var(--page-current-color)" cx="96" cy="256" r="48"/>
                        </svg>
                    </div>
                    <div class="post-page-container-button" id="lastPage">${totalPages}</div>
                </c:if>
                <c:if test="${currentPage<totalPages}">
                    <div class="post-page-container-button" id="nextPage" title="下一页">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25px" height="40px">
                            <path fill="none" stroke="var(--page-button-color)" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M184 112l144 144-144 144"/>
                        </svg>
                    </div>
                </c:if>
            </div>
        </c:if>

    </div>
</div>