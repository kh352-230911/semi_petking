<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=378fbb0293da7feaa0ce71d64debff24"></script>
<div id="campDiv" data-campId=${camp.id}></div>

<div class="flex flex-wrap justify-between items-center mx-auto max-w-6xl rounded-xl bg-gray1 mt-10 mb-10">
    <div>
        <div class="py-5 px-5">
            <div class="px-4 sm:px-0">
                <h3 class="text-2xl font-semibold leading-7 text-black">${camp.campName}</h3>
                <%--<p class="mt-1 max-w-2xl text-md leading-6 text-gray-500">캠핑장 소개</p>--%>
            </div>
            <div class="">
                <div class="px-4 py-6 sm:grid sm:grid-cols-2 sm:gap-10 sm:px-0 items-center">
                    <img src="${pageContext.request.contextPath}/upload/camp/${camp.campRenamedImg}" alt="">
                    <dl class="divide-y divide-gray-100">
                        <div class="px-4 py-6 sm:grid sm:grid-cols-4 sm:gap-4 sm:px-0">
                            <dt class="text-sm font-medium leading-6 text-gray-900">주소</dt>
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-3 sm:mt-0">${camp.campAddr}</dd>
                        </div>
                        <div class="px-4 py-6 sm:grid sm:grid-cols-4 sm:gap-4 sm:px-0">
                            <dt class="text-sm font-medium leading-6 text-gray-900">전화번호</dt>
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-3 sm:mt-0">${camp.campPhone}</dd>
                        </div>
                        <div class="px-4 py-6 sm:grid sm:grid-cols-4 sm:gap-4 sm:px-0">
                            <dt class="text-sm font-medium leading-6 text-gray-900">캠핑존</dt>
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-3 sm:mt-0">
                                <c:if test="${empty camp.rooms}">
                                    등록된 캠핑존이 없습니다
                                </c:if>
                                <c:if test="${not empty camp.rooms}">
                                    <c:forEach items="${camp.rooms}" var="room" varStatus="vs">
                                        ${room.roomName}
                                        <c:if test="${!(vs.last)}">, </c:if>
                                    </c:forEach>
                                </c:if>
                            </dd>
                        </div>
                        <div class="px-4 py-6 sm:grid sm:grid-cols-1 sm:gap-4 sm:px-0">
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-1 sm:mt-0 flex flex-wrap">
                                <c:forEach items="${camp.campWithTags}" var="campTag">
                                    <span class="bg-green text-white text-m me-1 px-2.5 py-0.5 rounded mb-1"> #${campTag.tagName}</span>
                                </c:forEach>
                            </dd>
                        </div>
                        <div class="px-4 py-6 sm:grid sm:grid-cols-2 sm:gap-4 sm:px-0">
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-1 sm:mt-0 mx-auto relative">

                                <%--<i class="fa-solid fa-heart text-right"></i>--%>
                                <%-- ajax wish insert/delete -> loginUser 기능 완성되면 data-user-id 하드코딩 부분 수정 필요 --%>
                                <c:if test="${loginUser != null}">
                                    <button type="button"
                                            class="wish-btn hover:text-white bg-white text-black border border-gray2 hover:bg-black font-medium rounded-full text-sm px-20 py-2.5 text-center me-2 mb-2">
                                        찜하기
                                    </button>
                                    <c:if test="${wishes != null}">
                                        <i data-camp-id="${camp.id}" data-user-id="${loginUser.id}"
                                           class="fa-solid fa-heart absolute z-50 text-xl top-[7px] right-12 text-red cursor-pointer"></i>
                                    </c:if>
                                    <c:if test="${wishes == null}">
                                        <i data-camp-id="${camp.id}" data-user-id="${loginUser.id}"
                                           class="fa-regular fa-heart absolute text-xl top-[7px] right-12 text-gray2 cursor-pointer"></i>
                                    </c:if>
                                </c:if>
                                <c:if test="${loginUser == null}">
                                    <button type="button"
                                            class="cursor-not-allowed bg-gray2 text-gray3 border border-gray2 font-medium rounded-full text-sm px-20 py-2.5 text-center me-2 mb-2">
                                        찜하기
                                    </button>
                                </c:if>
                            </dd>
                            <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-1 sm:mt-0 mx-auto">
                                <c:if test="${loginUser != null}">
                                <button type="button" id="btn-campToRoom"
                                        class="hover:text-white bg-white text-black border border-gray2 hover:bg-black font-medium rounded-full text-sm px-20 py-2.5 text-center me-2 mb-2">
                                    예약하기
                                </button>
                                </c:if>
                                <c:if test="${loginUser == null}">
                                    <button type="button"
                                            class="cursor-not-allowed bg-gray2 text-gray3 border border-gray2 font-medium rounded-full text-sm px-20 py-2.5 text-center me-2 mb-2">
                                        예약하기
                                    </button>
                                </c:if>
                                <%-- 임시 수정폼 --%>
<%--                                <form name="campUpdateFrm" action="${pageContext.request.contextPath}/camp/campUpdate">--%>
<%--                                    <input type="hidden" name="id" value="${camp.id}">--%>
<%--                                </form>--%>
                            </dd>
                        </div>
                    </dl>
                </div>
                <div class="h-[300px] font-medium leading-6 text-gray-900 mt-20 my-4 text-center">
                    <h1 class="mb-4 text-3xl font-extrabold leading-none tracking-tight text-gray-900"><span
                            class="underline underline-offset-3 decoration-8 decoration-green">캠핑장 소개</span></h1>
                    <p class="text-lg font-normal text-gray3 lg:text-xl mt-10">${camp.campIntro}</p>
                </div>


                <%--img slider--%>
                <div class="mb-5">
                    <div class="font-medium leading-6 text-gray-900 my-4 text-center">
                        <h1 class="mb-4 text-3xl font-extrabold leading-none tracking-tight text-gray-900"><span
                                class="underline underline-offset-3 decoration-8 decoration-green">캠핑장 전경</span></h1>
                    </div>
                    <c:if test="${camp.campAttaches.size() == 0}">
                        <li class="splide__slide">
                            <p class="w-full text-center py-24 border border-gray2">등록된 사진이 없습니다.</p>
                        </li>
                    </c:if>
                    <c:if test="${camp.campAttaches.size() != 0}">
                    <div id="main-slider" class="splide mx-auto">
                        <div class="splide__track">
                            <ul class="splide__list">
                                    <c:forEach items="${camp.campAttaches}" var="attach" varStatus="vs">
                                        <li class="splide__slide"><img class="w-full"
                                                                       src="${pageContext.request.contextPath}/upload/camp/${attach.campAttachRenamedName}"
                                                                       alt="" /></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    </c:if>
                    <ul id="thumbnails" class="thumbnails flex mt-1 mx-auto mb-0 p-0 justify-center">
                        <c:if test="${camp.campAttaches.size() != 0}">
                        <c:forEach items="${camp.campAttaches}" var="attach" varStatus="vs">
                            <li class="thumbnail w-[70px] h-[70px] overflow-hidden my-0 mx-[0.2rem] cursor-pointer"><img class="w-full h-auto"
                                                                                                                         src="${pageContext.request.contextPath}/upload/camp/${attach.campAttachRenamedName}"
                                                                                                                         alt="" /></li>
                        </c:forEach>
                        </c:if>
                        <c:if test="${camp.campAttaches.size() == 0}">
                        </c:if>
                    </ul>
                </div>


                <%-- 부가서비스 --%>
                <div class="text-xl font-medium leading-6 text-gray-900 mt-20 my-4 text-center">
                    <h1 class="mb-4 text-3xl font-extrabold leading-none tracking-tight text-gray-900"><span
                            class="underline underline-offset-3 decoration-8 decoration-green">캠핑장 부가서비스 안내</span></h1>
                </div>
                <c:if test="${empty camp.campWithServices}">
                    <div class="max-w-ful grid grid-cols-1 relative items-center justify-items-center">
                        <p class="text-lg font-normal text-gray3 lg:text-xl mt-10">등록된 부가서비스가 없습니다.</p>
                    </div>
                </c:if>
                <div class="mt-10 mb-100 grid grid-cols-2 md:grid-cols-${camp.campWithServices.size()} gap-4 justify-items-center">
                    <c:forEach items="${camp.campWithServices}" var="service">
                        <div class="w-[100px] h-[100px] max-w-full rounded-full bg-gray2 grid grid-cols-1 relative items-center justify-items-center">
                            <img class="w-[60px]"
                                 src="${pageContext.request.contextPath}/images/camp/${service.serviceImg}" alt="">
                            <div class="text-center absolute top-full my-3">${service.serviceName}</div>
                        </div>
                    </c:forEach>
                </div>

            <%-- 카카오지도 --%>
                <div class="mt-[150px]">
                    <h1 class="mb-10 text-3xl font-extrabold leading-none tracking-tight text-gray-900 text-center">
                    <span
                        class="underline underline-offset-3 decoration-8 decoration-green">찾아오는 길 </span></h1>
                    <div id="map" class="h-[500px]">
                        <div class="mx-4 my-6">
                            <input type="hidden" value="${camp.campLcLa}" name="campLcLa" id="campLcLa">
                            <input type="hidden" value="${camp.campLcLo}" name="campLcLo" id="campLcLo">
                        </div>
                    </div>
                </div>
        </div>
        </div>

    </div>
</div>
<%-- 리뷰 --%>
<div class="max-w-6xl bg-white mx-auto">
    <div class="container mx-auto my-6">
        <div class="flex justify-start">
            <h1 class="m-4 text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
                캠핑로그
            </h1>
        </div>
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3">번호</th>
                    <th scope="col" class="px-6 py-3">제목</th>
                    <th scope="col" class="px-6 py-3">작성자 </th>
                    <th scope="col" class="px-6 py-3">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${reviews.size() != 0}">
                    <c:forEach items="${reviews}" var="review" varStatus="vs">
                        <div class="odd:bg-white even:bg-gray-50 border-b ">
                            <tr>
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${review.id}</th>
                                <td class="px-6 py-4">
                                    <a href="${pageContext.request.contextPath}/review/reviewDetail?id=${review.id}"
                                       class="hover:underline">${fn:escapeXml(review.reviewTitle)}</a>
                                        <%-- 댓글 수 노출하기 --%>
                                        <%--                            <c:if test="${review.askCommentCount}">--%>
                                </td>
                                <td class="px-6 py-4">${review.userId}</td>
                                <td class="px-6 py-4">
                                    <fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
                                    <fmt:formatDate value="${regDate}" pattern="yy/MM/dd HH:mm"/></td>
                            </tr>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${reviews.size() == 0}">
                    <div class="odd:bg-white even:bg-gray-50 border-b ">
                        <tr >
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">등록된 리뷰가 없습니다.</th>
                        </tr>
                    </div>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <div class="flex justify-center mt-6 mb-32">
        <c:if test="${reviews.size() != 0}">
        <nav aria-label="Page navigation example">
            <ul class="flex items-center -space-x-px h-8 text-sm">
                ${pagebar}
            </ul>
        </nav>
        </c:if>
        <c:if test="${reviews.size() == 0}">
        </c:if>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/camp/campDetail.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>