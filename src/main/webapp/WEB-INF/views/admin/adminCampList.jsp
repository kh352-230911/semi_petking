<%--
  Created by IntelliJ IDEA.
  User: cksgm
  Date: 2024-01-02
  Time: AM 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="w-52 h-96 relative">
    <div class="w-52 h-96 left-5 top-10 absolute flex-col justify-center items-center inline-flex">
        <div class="w-52 h-96 bg-white rounded-2xl border border-neutral-200"></div>
    </div>
    <div class="left-[70px] top-[42px] absolute text-stone-900 text-xl font-bold font-['Inter']">캠핑장 관리</div>
    <div class="left-[70px] top-[82px] absolute text-neutral-600 text-sm font-normal font-['Inter']">캠핑장 전체 보기</div>
    <div class="left-[70px] top-[109px] absolute text-black text-opacity-80 text-sm font-normal font-['Inter']">캠핑장 등록 관리</div>
    <div class="left-[70px] top-[136px] absolute text-black text-opacity-80 text-sm font-normal font-['Inter']">캠핑장 홍보 관리</div>
    <div class="left-[70px] top-[213px] absolute text-stone-900 text-xl font-bold font-['Inter']">회원 관리</div>
    <div class="left-[70px] top-[252.77px] absolute text-black text-opacity-80 text-sm font-['Inter'] ">회원 전체 보기</div>
    <div class="left-[70px] top-[330px] absolute text-stone-900 text-xl font-bold font-['Inter']">게시판 관리</div>
    <div>
        <button type="submit" class="left-[70px] top-[370px] absolute text-black text-opacity-80 text-sm font-normal font-semibold font-['Inter'] underline">리뷰 관리</button>
    </div>
    <div class="left-[70px] top-[397px] absolute text-black text-opacity-80 text-sm font-normal font-['Inter']">포인트 관리</div>
</div>
<div class="relative overflow-x-auto">
    <table class="w-62 text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="px-6 py-3">
                번호
            </th>
            <th scope="col" class="px-6 py-3">
                사업자 아이디
            </th>
            <th scope="col" class="px-6 py-3">
                사업자 이름
            </th>
            <th scope="col" class="px-6 py-3">
                캠핑장 이름
            </th>
            <th scope="col" class="px-6 py-3">
                캠핑장 정보
            </th>
            <th scope="col" class="px-6 py-3">
                캠핑장 전화번호
            </th>
            <th scope="col" class="px-6 py-3">
                캠핑장 주소
            </th>
            <th scope="col" class="px-6 py-3">
                사업자번호
            </th>
            <th scope="col" class="px-6 py-3">
                리뷰수
            </th>
            <th scope="col" class="px-6 py-3">
                좋아요수
            </th>
            <th scope="col" class="px-6 py-3">
                가입일
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${campVos}" var="camp" varStatus="vs">

            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${vs.index + 1}
                </th>
                <td class="px-6 py-4">
                        ${camp.businessId}
                </td>
                <td class="px-6 py-4">
                        ${camp.businessName}
                </td>
                <td class="px-6 py-4">
                    <a href="${pageContext.request.contextPath}/camp/campDetail?id=${camp.id}">
                        ${camp.campName}
                    </a>
                </td>
                <td class="px-6 py-4">
                        ${camp.campIntro}
                </td>
                <td class="px-6 py-4">
                        ${camp.campPhone}
                </td>
                <td class="px-6 py-4">
                        ${camp.campAddr}
                </td>
                <td class="px-6 py-4">
                        ${camp.businessNumber}
                </td>
                <td class="px-6 py-4">
                        ${camp.reviewCount}
                </td>
                <td class="px-6 py-4">
                        ${camp.wishCount}
                </td>
                <td class="px-6 py-4">
                    <fmt:parseDate value="${camp.regDate}" pattern="yyyy-MM-dd" var="regDate"/>
                    <fmt:formatDate value="${regDate}" pattern="yy/MM/dd"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="flex justify-center mt-6">
        <nav aria-label="Page navigation example">
            <ul class="flex items-center -space-x-px h-8 text-sm">
                ${pagebar}
            </ul>
        </nav>
    </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>    