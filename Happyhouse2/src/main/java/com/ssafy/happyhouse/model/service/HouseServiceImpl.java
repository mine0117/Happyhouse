package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.controller.HappyHouseException;
import com.ssafy.happyhouse.model.dao.HouseDao;
import com.ssafy.happyhouse.model.dao.HouseDaoImpl;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.util.PageNavigation;
@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseDao housedao;

	@Override
	@Transactional
	public List<HouseDeal> searchAll() throws SQLException {
		return housedao.searchAll();
	
	}

	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환.
	 * 
	 * @param no 검색할 아파트 식별 번호
	 * @return 아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	
	@Override
	public HouseDeal search(int no) {
		try {
			HouseDeal deal = housedao.search(no);
			if (deal == null) {
				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다.", no));
			}
			return deal;
		} catch (SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
//	@Override
//	   public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception {
//	      PageNavigation pageNavigation = new PageNavigation();
//	      int naviSize = 10; //페이지 갯수
//	      pageNavigation.setCurrentPage(currentPage);
//	      pageNavigation.setNaviSize(naviSize);
//	      int totalCount = housedao.getTotalCount(key, word);
//	      pageNavigation.setTotalCount(totalCount);
//	      int totalPageCount = (totalCount - 1) / sizePerPage + 1 ; //총 페이지수
//	      pageNavigation.setTotalPageCount(totalPageCount);
//	      boolean startRange = currentPage <= naviSize; //startRange true : 이전 X    false : 이전 O
//	      pageNavigation.setStartRange(startRange);
//	      boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage; //endRange true : 다음 X   false : 다음 O
//	      pageNavigation.setEndRange(endRange);
//	      pageNavigation.makeNavigator();
//	      return pageNavigation;
//	   }
}
