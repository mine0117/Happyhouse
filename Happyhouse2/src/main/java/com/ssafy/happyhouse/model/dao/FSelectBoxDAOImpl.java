package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.happyhouse.model.dto.HouseInfoDTO;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;



public class FSelectBoxDAOImpl implements FSelectBoxDAO {

	@Override
	public ArrayList<SidoCodeDTO> selectSido() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SidoCodeDTO> selectGugun(String sido) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<HouseInfoDTO> selectDong(String gugun) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<HouseInfoDTO> selectApt(String dong) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	


}
