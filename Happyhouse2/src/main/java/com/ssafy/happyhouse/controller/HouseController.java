package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.LocationDto;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.HouseServiceImpl;

@Controller
public class HouseController extends HttpServlet {

	@Autowired
	private HouseService houseService;

	@RequestMapping(value = "/houselistAt")
	public String houselistAt( Model model) throws SQLException {
		System.out.println("=======house======");
		
		model.addAttribute("houses", houseService.searchAll());
	
		return "house/houselist";

	}

	@RequestMapping(value = "/detailAt")
	private String detail(int no, Model model) {
		
		HouseDeal house = houseService.search(no);
		System.out.println(house.getImg());
		
		model.addAttribute("houseinfo", house);
		return "house/detail";

	}

}
