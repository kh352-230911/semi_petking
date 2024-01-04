package com.sh.petking.camp.model.service;

import com.sh.petking.camp.model.dao.CampDao;
import com.sh.petking.camp.model.entity.*;
import com.sh.petking.camp.model.vo.CampVo;
import org.apache.commons.fileupload.FileItem;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.sh.petking.common.SqlSessionTemplate.getSqlSession;

public class CampService {
    private CampDao campDao = new CampDao();
    
    // 캠핑장 전체 조회
    public List<Camp> findAll() {
        SqlSession session = getSqlSession();
        List<Camp> camps = campDao.findAll(session);
        session.close();
        return camps;
    }
    // 캠핑장 1개 조회 - id
    public CampVo findById(long id) {
        SqlSession session = getSqlSession();
        CampVo camp = campDao.findById(session, id);
        session.close();
        return camp;
    }

    public int insertCamp(Camp camp) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = campDao.insertCamp(session, camp);
            session.commit();
        } catch (Exception e){
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int updateCamp(Camp camp) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = campDao.updateCamp(session, camp);
            session.commit();
        } catch (Exception e){
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int deleteCamp(Long id) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = campDao.deleteCamp(session, id);
            session.commit();
        } catch (Exception e){
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int getTotalCount(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = campDao.getTotalCount(session, param);
        session.close();
        return totalCount;
    }

    public List<CampVo> findAll(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<CampVo> camps = campDao.findAll(session, param);
        session.close();
        return camps;
    }

    public List<_CampService> findAllCampService() {
        SqlSession session = getSqlSession();
        List<_CampService> campServices = campDao.findAllCampService(session);
        session.close();
        return campServices;
    }

    public List<CampTag> findAllCampTag() {
        SqlSession session = getSqlSession();
        List<CampTag> campTags = campDao.findAllCampTag(session);
        return campTags;
    }

    public int updateCampDetail(Map<String, Object> param) {
        System.out.println("나오나요");
        SqlSession session = getSqlSession();
        int result = 0;
        Long campId = (Long) param.get("campId");
        List<CampWithTag> campWithTags = (List<CampWithTag>) param.get("campWithTags");
        List<CampWithService> campWithServices = (List<CampWithService>) param.get("campWithServices");
        List<CampAttach> campAttaches = (List<CampAttach>) param.get("campAttaches");
        System.out.println(campAttaches);

        try {
            // 태그 전체 삭제
            if (campWithTags != null && campWithTags.size() > 0) {
                result = campDao.deleteCampTag(session, campId);
                System.out.println("삭제된 태그 수 " + result);
                // 태그 다시 삽입
                for (int i = 0; i < campWithTags.size(); i++) {
                    result = campDao.insertCampWithTag(session, campWithTags.get(i));
                    System.out.println("태그 반복문: " + i);
                }
            }

            if (campWithServices != null && campWithServices.size() > 0) {
                // 서비스 전체 삭제
                result = campDao.deleteCampService(session, campId);
                System.out.println("삭제된 서비스 수 " + result);
                // 서비스 다시 삽입
                for (int i = 0; i < campWithServices.size(); i++) {
                    result = campDao.insertCampWithService(session, campWithServices.get(i));
                    System.out.println("서비스 반복문: " + i);
                }
            }

            if (campAttaches != null && !campAttaches.isEmpty()) {
                for (int i = 0; i < campAttaches.size(); i++) {
                    System.out.println("================ service attach ============");
                    System.out.println(campAttaches.get(i).getCampId());
                    System.out.println(campAttaches.get(i).getCampAttachRenamedName());
                    System.out.println(campAttaches.get(i).getCampAttachOriginalName());
                    result = campDao.insertCampAttach(session, campAttaches.get(i));
                }
            }
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int updateCampConfirm(Long id) {
        SqlSession session = getSqlSession();
        int result = 0;
        try{
        result = campDao.updateCampConfirm(session, id);
        session.commit();
        } catch (Exception e){
        }finally {
            session.close();
        }
    return result;
    }
}