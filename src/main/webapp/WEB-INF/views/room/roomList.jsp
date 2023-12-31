<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2023-12-29
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
  객실 리스트 페이지 일단 고객입장에서 보이는 페이지로 출력하기.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container mx-auto my-6">
    <div class="flex justify-start">
        <h1 class="m-4 text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
            객실 리스트
        </h1>
    </div>
    <div class="flex justify-end">
        <button type="button"
                onClick="location.href='${pageContext.request.contextPath}/room/roomCreate';"
                class="text-white bg-gradient-to-r from-rose-200 via-rose-300 to-rose-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-rose-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">객실 추가</button>
    </div>
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3">번호</th>
                <th scope="col" class="px-6 py-3">섬네일</th>
                <th scope="col" class="px-6 py-3">객실 이름</th>
                <th scope="col" class="px-6 py-3">객실 타입</th>
                <th scope="col" class="px-6 py-3">객실 설명</th>
                <th scope="col" class="px-6 py-3">기준인원</th>
                <th scope="col" class="px-6 py-3">최대인원</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${rooms}" var="room" varStatus="vs">
                <div class="odd:bg-white even:bg-gray-50 border-b ">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${room.id}</th>
                    <c:if test="${empty room.roomRenamedImg}">
                    <td class="px-6 py-4"><img class="w-[300px] h-[200px]" src="../images/room/room_default_img.jpg" alt=""></td>
                    </c:if>
                    <c:if test="${!empty room.roomRenamedImg}">
                        <td class="px-6 py-4"><img class="w-[300px] h-[200px]"
                          src="${pageContext.request.contextPath}/upload/room/${room.roomRenamedImg}" alt=""></td>
                    </c:if>
                    <td class="px-6 py-4">
                        <a href="${pageContext.request.contextPath}/room/roomDetail?id=${room.id}"
                           class="hover:underline">${fn:escapeXml(room.roomName)}</a>
                            <%--  1221 해당 게시글에 달린 댓글 갯수 보여주기 select count(*) from board_comment where board_id=97; --%>
                    </td>
                    <td class="px-6 py-4">
                            ${room.roomType == 1 ? '오토캠핑' :
                                    room.roomType == 2 ? '글램핑' :
                                            room.roomType == 3 ? '카라반' :
                                                    room.roomType == 4 ? '룸' : 'Invalid Type'}</td>
                    <td class="px-6 py-4">${room.roomIntro}</td>
                    <td class="px-6 py-4">${room.roomDefaultPerson}</td>
                    <td class="px-6 py-4">${room.roomMaximumPerson}</td>
                    <td class="px-6 py-4">
                        <div class="flex justify-end">
                    <button type="button"
                            onclick="location.href = '${pageContext.request.contextPath}/room/roomUpdate?id=${room.id}'"
                            class="px-5 py-2.5 mt-4 mr-4 sm:mt-6 text-sm font-medium text-center text-black bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200">
                        수정
                    </button>
                        <button type="button"
                                onClick="confirm('${room.id} 번 객실을 삭제하시겠습니까?') &&
                                        document.roomDeleteFrm${room.id}.submit();"
                                class="px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-black bg-red-700 rounded-lg focus:ring-4 focus:ring-primary-200">
                            삭제
                        </button>
                        </div>
                    </td>
                </div>
                </tr>
                <form
                        name="roomDeleteFrm${room.id}"
                        action="${pageContext.request.contextPath}/room/roomDelete"
                      method="post" >
                    <input type = "hidden" name="id" value="${room.id}">
                    <input type = "hidden" name="campId" value="${room.campId}">
                </form>
            </c:forEach>


            </tbody>
        </table>
    </div>
</div>


<div class="flex justify-center mt-6">
    <nav aria-label="Page navigation example">
        <ul class="flex items-center -space-x-px h-8 text-sm">
            ${pagebar}
        </ul>
    </nav>
</div>

<script src="${pageContext.request.contextPath}/js/room/roomList.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>