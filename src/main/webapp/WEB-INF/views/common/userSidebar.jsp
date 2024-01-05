<%--
  Created by IntelliJ IDEA.
  User: min_j
  Date: 2024-01-05
  Time: PM 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<button data-drawer-target="sidebar-multi-level-sidebar" data-drawer-toggle="sidebar-multi-level-sidebar" aria-controls="sidebar-multi-level-sidebar" type="button" class="inline-flex items-center p-2 mt-2 ms-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
    <span class="sr-only">Open sidebar</span>
    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
    </svg>
</button>

<aside class="absolute mt-12 ml-64 z-40 w-64 h-3/5 " aria-label="Sidebar">
    <div class="h-full px-3 py-4 overflow-y-auto bg-salmon dark:bg-gray-800 text-center text-black rounded-lg border border-gray2">
        <ul class="space-y-2 font-medium">
            <li class="flex justify-center">
                <a href="#" class="w-[150px] h-[150px] flex items-center bg-light-pink p-2 rounded-full group">
                    <img class="flex-1 whitespace-nowrap" src="${pageContext.request.contextPath}/upload/user/${loginUser.renamedProfileName}">
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center text-center text-black bg-light-pink p-2 hover:bg-white rounded-full group">
                    <span class="flex-1 whitespace-nowrap">포인트 000점</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center p-2 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <span class="flex-1 whitespace-nowrap">내 정보보기</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center p-2 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <span class="flex-1 whitespace-nowrap">찜 목록</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center p-2 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <span class="flex-1 whitespace-nowrap">예약 내역</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center p-2 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <span class="flex-1 whitespace-nowrap">리뷰 내역</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex items-center p-2 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <span class="flex-1 whitespace-nowrap">문의 내역</span>
                </a>
            </li>
            <li>
                <a href="#" class="flex mt-10 items-center p-2 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                    <span class="flex-1 whitespace-nowrap text-sm font-regular">회원탈퇴</span>
                </a>
            </li>
        </ul>
    </div>
</aside>
