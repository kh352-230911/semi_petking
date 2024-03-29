<%--
  Created by IntelliJ IDEA.
  User: 82104
  Date: 2024-01-03
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
    <h2 class="mb-4 text-xl font-bold text-gray-900">새 게시글</h2>
    <form name="boardCreateFrm" method="post" enctype="multipart/form-data">
        <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
            <div class="sm:col-span-2">
                <label>카테고리</label>
                <select name="boardType" required class="BOARD-boardType bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                    <option value="" disabled selected>선택</option>
                    <option value="Q" ${board.boardType eq BoardType.Q ? 'selected' : ''}>아-나-바-다</option>
                    <option value="F" ${board.boardType eq BoardType.F ? 'selected' : ''}>슬.캠.생</option>
                    <c:if test="${loginUser != null && loginUserClubRole == 'A'}">
                    <option value="C" ${board.boardType eq BoardType.C ? 'selected' : ''}>동아리 모집</option>
                    </c:if>
                </select>
            </div>
            <div class="sm:col-span-2">
                <label for="title" class="block mb-2 text-sm font-medium text-gray-900">제목</label>
                <input type="text" name="title" id="title" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="제목을 작성하세요." required>
            </div>
            <div class="sm:col-span-2">
                <label for="userId" class="block mb-2 text-sm font-medium text-gray-900">작성자</label>
                <input type="text" name="userId" id="userId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" value="${loginUser.id}" required readonly>
            </div>
            <div class="sm:col-span-2">
                <label for="content" class="block mb-2 text-sm font-medium text-gray-900">내용</label>
                <textarea name="content" id="content" rows="8" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500" placeholder="내용을 작성하세요." required></textarea>
            </div>
        </div>
        <button type="submit" class=" py-2.5 px-4 text-xs font-medium text-sky-600 hover:bg-blue-200 ms-30">
            저장
        </button>
    </form>
</div>
<script src="${pageContext.request.contextPath}/js/board/boardCreate.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>