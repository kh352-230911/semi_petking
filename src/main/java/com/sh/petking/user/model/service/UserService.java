package com.sh.petking.user.model.service;

import com.sh.petking.user.model.dao.UserDao;
import com.sh.petking.user.model.entity.Point;
import com.sh.petking.user.model.entity.User;
import com.sh.petking.user.model.vo.UserVo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.petking.common.SqlSessionTemplate.getSqlSession;

public class UserService {
    private UserDao userDao = new UserDao();

    public User findById(String id) {
        SqlSession session = getSqlSession();
        User user = userDao.findById(session, id);
        session.close();
        return user;
    }

    public int insertUser(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.insertUser(session, user);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public List<User> findAll() {
        SqlSession session = getSqlSession();
        List<User> users = userDao.findAll(session);
        session.close();
        return users;
    }

    public List<UserVo> findAll(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<UserVo> users = userDao.findAll(session, param);
        session.close();
        return users;
    }

    public int getTotalCount() {
        SqlSession session = getSqlSession();
        int totalCount = userDao.getTotalCount(session);
        session.close();
        return totalCount;
    }


    public int updateUser(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.updateUser(session, user);
            session.commit();
            System.out.println("update commit");
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int updateUserRole(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.updateUserRole(session, user);
            System.out.println(user);
            System.out.println(result);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    /**
     * 민준씨
     *
     *
     */

    /**
     * 정효씨
     */
    public int userPasswordUpdate(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.userPasswordUpdate(session, user);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }


    public int deleteUser(String id) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.deleteUser(session, id);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public User findByEmail(String email) {
        SqlSession session = getSqlSession();
        User user = userDao.findByEmail(session, email);
        session.close();
        return user;
    }

    public UserVo findGradeId(String id) {
        SqlSession session = getSqlSession();
        UserVo userVo = userDao.findGradeId(session, id);
        session.close();
        return userVo;
    }

    public List<Point> findPointAll(String id) {
        SqlSession session = getSqlSession();
        List<Point> points = userDao.findPointAll(session, id);
        System.out.println(points);
        session.close();
        return points;
    }


    public int updateUserProfile(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.updateUserProfile(session, user);
            session.commit();
        } catch (Exception e){
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public UserVo findUserWithClubById(String id) {
        SqlSession session = getSqlSession();
        UserVo user = userDao.findUserWithClubById(session, id);
        session.close();
        return user;
    }
}
