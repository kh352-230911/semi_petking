<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<c:forEach items="${camps}" var="camp" varStatus="vs">
    <div class="flex justify-between items-center mx-auto max-w-6xl border border-2 border-gray2 rounded-lg bg-gray1 mt-20 mb-20">
        <div class="w-full flex m-8">
            <img class="w-80" src="${pageContext.request.contextPath}/images/camp/${camp.campImg}" />
            <div class="w-full ml-10">
                <span class="inline-flex items-center rounded-full bg-pink px-2 py-1 text-xs font-medium text-white ring-1 ring-inset ring-gray-500/10">리뷰수</span>
                <span class="inline-flex items-center rounded-full bg-green px-2 py-1 text-xs font-medium text-white ring-1 ring-inset ring-gray-500/10">찜</span>
                <div class="w- text-black font-semibold text-2xl mt-5">${camp.campName}</div>
                <div class="text-black text-base font-normal mt-5">${camp.campIntro}</div>
                <div class="text-black text-base font-normal mt-5">${camp.campAddr}</div>
                <div class="text-black text-base font-normal mt-5">
                    <i class="p-1 fa-solid fa-phone bg-gray3"></i>
                    <fmt:formatNumber pattern="000-000-000" value="${camp.campPhone}" var="campPhone" />
                    ${campPhone}
                </div>
                <div class="tag-section bg-salmon w-full h-10">

                </div>
<%--                <div class="pt-2 pb-2 w-40 bg-neutral-500 rounded-2xl text-center text-white text-base font-semibold mt-5">상세보기</div>--%>
            </div>
        </div>
    </div>
</c:forEach>

<div class="flex justify-center mt-6">
    <nav aria-label="Page navigation example">
        <ul class="flex items-center -space-x-px h-8 text-sm">
            ${pagebar}
        </ul>
    </nav>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>