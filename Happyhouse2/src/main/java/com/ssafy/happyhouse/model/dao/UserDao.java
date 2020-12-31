package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.MemberDto;

public interface UserDao {
	public void join(MemberDto memberDto) throws SQLException;

	public MemberDto login(MemberDto memberDto) throws SQLException;

	public MemberDto modify(MemberDto memberDto) throws SQLException;

	public MemberDto search(String userid) throws SQLException;

	public void deleteUser(String userid) throws Exception;

	public List<MemberDto> listUser() throws Exception;

}
