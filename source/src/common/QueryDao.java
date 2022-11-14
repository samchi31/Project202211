package common;

import java.util.Collections;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import utils.BatisUtil;

public class QueryDao {	
	public <T> T selectOne(String statement, Object parameter) {
		SqlSession sqlSession = BatisUtil.getSqlSession();
		T obj = null;
		try {
			obj = sqlSession.selectOne(statement, parameter);
		} catch (PersistenceException e) {
			throw new RuntimeException("selectOne 에러", e);
		} finally {
			sqlSession.close();
		}
		return obj;
	}
	
	public <T> List<T> selectList(String statement, Object parameter) {
		SqlSession sqlSession = BatisUtil.getSqlSession();
		List<T> list = Collections.emptyList();
		try {
			if (parameter == null) {
				list = sqlSession.selectList(statement);
			} else {
				list = sqlSession.selectList(statement, parameter);
			}

		} catch (PersistenceException e) {
			throw new RuntimeException("selectList 에러", e);
		} finally {
			sqlSession.close();
		}
		return list;
	}

	public int insert(String statement, Object parameter) {
		SqlSession sqlSession = BatisUtil.getSqlSession();

		int cnt = 0;
		try {
			cnt = sqlSession.insert(statement, parameter);
			sqlSession.commit();
		} catch (PersistenceException e) {
			throw new RuntimeException("insert 에러", e);
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	public int update(String statement, Object parameter) {
		SqlSession sqlSession = BatisUtil.getSqlSession();

		int cnt = 0;
		try {
			cnt = sqlSession.update(statement, parameter);
			sqlSession.commit();
		} catch (PersistenceException e) {
			throw new RuntimeException("update 에러", e);
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	public int delete(String statement, Object parameter) {
		SqlSession sqlSession = BatisUtil.getSqlSession();

		int cnt = 0;
		try {
			cnt = sqlSession.delete(statement, parameter);
			sqlSession.commit();
		} catch (PersistenceException e) {
			throw new RuntimeException("delete 에러", e);
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
	
	public int countList(String statement) {
		SqlSession sqlSession = BatisUtil.getSqlSession();
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne(statement);
		} catch (PersistenceException e) {
			throw new RuntimeException("selectList 에러", e);
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
}
