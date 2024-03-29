package com.sh.petking.room.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.sh.petking.room.model.entity.RoomAttach;
import com.sh.petking.room.model.service.RoomService;
import com.sh.petking.room.model.vo.RoomVo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

/**
 * 0102 객실 추가 servlet
 * 폼은 객실 수정과 동일하게.
 */

@WebServlet("/room/roomCreate")
public class RoomCreateController extends HttpServlet
{
    private RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("RoomCreateController do get");
        long campId = Long.parseLong(req.getParameter("camp_id"));
        System.out.println("RoomCreateController campId: "+campId);
        req.setAttribute("campId",campId);
        req.getRequestDispatcher("/WEB-INF/views/room/roomCreate.jsp").forward(req,resp);
    }

    /**
     * 파일 업로드 처리..
     * 1.commons-io,commons-fileupload 의존성 추가(pom.xml)
     * 2.form[method=post][enctype=multipart/form-data]
     * 3.DiskFileItemFacroty / ServletFileUpload 요청처리
     *  - 저장경로
     *  - 파일 최대 크기
     *
     *
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        System.out.println("RoomCreateController do post");
        //1.사용자 입력값 처리 및 파일 업로드
        //"C:\\Users\\min_j\\Dropbox\\Workspaces\\semi_petking\\target\\semi_petking\\upload\\camp"
        File repository = new File("C:\\Users\\min_j\\Dropbox\\Workspaces\\semi_petking\\target\\semi_petking\\upload\\room");
        int sizeThreshold = 10 * 1024 * 1024; //10MB

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(repository);
        factory.setSizeThreshold(sizeThreshold);

        RoomVo room = new RoomVo();

       // 실제 요청을 핸들링할 객체..
        ServletFileUpload s = new ServletFileUpload(factory);
        try {
            //전송된 값을 하나의 FileItem으로 처리
            List<FileItem> fileItemList = s.parseRequest(req);
            for(FileItem item: fileItemList)
            {
                String name = item.getFieldName();//input의 name
                if(item.isFormField())
                {
                    System.out.println("일반필드");
                    //일반 텍스트 : room 객체에 설정
                    String value = item.getString("utf-8");
                    System.out.println(name+"///"+value);
                    room.setValue(name,value);

                }
                else {
                    //파일 : 서버 컴에 저장 파일정보를 attachment 객체로 만들어서 db에 저장
                    if(item.getSize() > 0) {
                        System.out.println(name);
                        String originalFileName = item.getName();
                        System.out.println("원본 파일명: " + originalFileName);
                        System.out.println("파일크기: " + item.getSize() + "byte");

                        int dotIndex = originalFileName.lastIndexOf(".");
                        String ext = dotIndex >- 1? originalFileName.substring(dotIndex) : "";
                        System.out.println("extextextextextext: " + ext ); //.png

                        UUID uuid = UUID.randomUUID();//랜덤 uuid 발급 b9c2bc5f-9a0c-4e7f-9d87-7d6feb70e244
                        String renamedFileName = uuid+ext; //저장된 파일명(덮어쓰기방지,인코딩이슈방지) 위에 발급된 uuid에 원본의 확장자명을 붙여서 새 파일명만든다.
                        System.out.println("새 파일명 : "+renamedFileName);

                        //서버 컴퓨터 파일 저장
                        File upFile = new File(repository,renamedFileName);
                        item.write(upFile);

                        //Attachment 객체 생성
                        RoomAttach attach = new RoomAttach();
                        //현재 할 수 있는건 원본명과, 새이름 set.

                        attach.setRoomAttachOriginalName(originalFileName);
                        attach.setRoomAttachRenamedName(renamedFileName);
                        if(renamedFileName == null || renamedFileName.isEmpty()) {
                            room.setRoomRenamedImg("room_default_img.jpg"); //대표를 설정하지 않았다면 기본사진으로 지정
                        }
                        room.setRoomRenamedImg(renamedFileName); //0105 혜진 임시 대표사진 설정
                        room.addAttachment(attach);
                    }
                }
            }
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        System.out.println("room+attach : " +room);//room,attach객체 모두 확인되어야함.


        //2.업무로직
        int result = roomService.insertRoom(room);
        req.getSession().setAttribute("msg","새로운 객실을 성공적으로 등록하였습니다");

        //3.게시판 목록페이지로 redirect
        // resp.sendRedirect(req.getContextPath()+"/room/roomList");
        //기존의 room경로가 아닌 캠핑장 경로로
        resp.sendRedirect(req.getContextPath() + "/camp/campRoomList?id=" + room.getCampId());
    }
}