package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

@Repository
public class HouseDaoImpl implements HouseDao {

	@Autowired
	private SqlSession sqlSession;

	public void loadData() {
//		houseInfo = new HashMap<String, HouseInfo>();
//		houseInfoDao = new HouseInfoDaoImpl();
//		try {
//			allHouseInfo = houseInfoDao.searchAllHouseInfo();
//			for (HouseInfo info : allHouseInfo) {
//				String key = info.getDong() + info.getAptName();
//				houseInfo.put(key, info);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

	@Override
	public List<HouseDeal> searchAll() throws SQLException {
		
		return sqlSession.selectList("house.houseList");
	}

	@Override
	public HouseDeal search(int no) throws SQLException {
	
		return sqlSession.selectOne("house.houseDetail", no);
	}

//	@Override
//	public int getTotalCount(String key, String word) throws SQLException {
//		
//		return intsqlSession.selectList("house.houseSearch", key,word);
//	}

	
}
