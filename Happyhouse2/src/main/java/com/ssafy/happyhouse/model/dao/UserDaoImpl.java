package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.MemberDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void join(MemberDto memberDto) throws SQLException {
		sqlSession.insert("userInfo.join", memberDto);
	}

	@Override
	public MemberDto login(MemberDto memberDto) throws SQLException {
		return sqlSession.selectOne("userInfo.login", memberDto);
	}

	@Override
	public MemberDto modify(MemberDto memberDto) throws SQLException {
		return sqlSession.selectOne("userInfo.update", memberDto);
	}

	@Override
	public MemberDto search(String userid) throws SQLException {
		return sqlSession.selectOne("userInfo.search", userid);
	}

	@Override
	public void deleteUser(String userid) throws Exception {
		sqlSession.delete("userInfo.delete", userid);
	}

	@Override
	public List<MemberDto> listUser() throws Exception {
		return sqlSession.selectList("userInfo.list");
	}

}
