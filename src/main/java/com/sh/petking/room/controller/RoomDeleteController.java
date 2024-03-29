package com.sh.petking.room.controller;

import com.sh.petking.reservation.model.entity.Reservation;
import com.sh.petking.room.model.entity.Room;
import com.sh.petking.room.model.service.RoomService;
import com.sh.petking.room.model.vo.RoomVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 0103 객실 삭제 서블릿
 */
@WebServlet("/room/roomDelete")
public class RoomDeleteController extends HttpServlet {
    private RoomService roomService = new RoomService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("roomDelete - doGet.....");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("roomDelete - doPost.....");
        // 1. 사용자입력값 처리
        String[] ids = req.getParameterValues("id");
        System.out.println(ids.toString());
        System.out.println("ids 길이:"+ids.length);
        System.out.println("id 값:"+  ids[0]);
        long id = Long.parseLong(req.getParameter("id"));
        long campId = Long.parseLong(req.getParameter("campId"));
        System.out.println("id:"+id+"/campId:"+campId);

        RoomVo room = new RoomVo();
        room.setId(id);
        room.setCampId(campId);
        System.out.println("내가 삭제할 객실 정보:"+room);
        // 2. 업무로직


        /*
           만약 객실 삭제 할 때 예약이 있는 객실이라면..?
        */
        List<Reservation> checkReservation = roomService.deleteRoomBeforeCheck(id);
        if( checkReservation.size()>0)
        {
            req.getSession().setAttribute("msg", "예약이 존재하는 객실입니다. ");
        }
        else {
            int result = roomService.deleteRoom(room);
            req.getSession().setAttribute("msg", "객실을 성공적으로 삭제했습니다.");
            // 3. 리다이렉트
        }
        resp.sendRedirect(req.getContextPath() + "/camp/campRoomList?id=" + campId);
    }
}