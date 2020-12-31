package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dao.UserDao;
import com.ssafy.happyhouse.model.dao.UserDaoImpl;
import com.ssafy.happyhouse.model.dto.MemberDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public void join(MemberDto memberDto) throws SQLException {
//		if (memberDto.getUserid() != null && memberDto.getUserpwd() != null && memberDto.getUsername() != null
//				&& memberDto.getAddress() != null && memberDto.getPhone() != null) {
		System.out.println("12321");
		userDao.join(memberDto);
//		}
	}

	@Override
	public MemberDto login(MemberDto memberDto) throws SQLException {
		if (memberDto.getUserid() == null || memberDto.getUserpwd() == null)
			return null;
		return userDao.login(memberDto);
	}

	@Override
	public MemberDto modify(MemberDto memberDto) throws SQLException {
		
		return userDao.modify(memberDto);
	}

	@Override
	public MemberDto search(String userid) throws SQLException {
		if (userid == null) {
			return null;
		}
		return userDao.search(userid);
	}

	@Override
	public void deleteUser(String userid) throws Exception {
		userDao.deleteUser(userid);
	}

	@Override
	public List<MemberDto> listUser() throws Exception {
		return userDao.listUser();
	}

}
