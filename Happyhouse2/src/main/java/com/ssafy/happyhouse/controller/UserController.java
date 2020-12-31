package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dao.UserDao;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.service.UserService;
import com.ssafy.happyhouse.model.service.UserServiceImpl;

@Controller
public class UserController extends HttpServlet {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService iUserService;

	@RequestMapping("/login")
	public String login(Model model) {
		logger.info("Welcome LoginController login! " + new Date());

		model.addAttribute("head", "WELCOME");
		return "user/login";
	}//

	@RequestMapping(value = "/loginAf")
	public String loginAf(HttpServletRequest request, MemberDto member, Model model) throws SQLException {

		MemberDto login = iUserService.login(member);

		System.out.println(member.getUserid());
		System.out.println(member.getUserpwd());
		if (login != null && !login.getUserid().equals("")) {
			request.getSession().setAttribute("login", login);
			request.getSession().setMaxInactiveInterval(10 * 60);
			model.addAttribute("userinfo", "WELCOME");

			return "index";
		} else {
			request.getSession().invalidate();
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		logger.info("Welcome LoginController logout! " + new Date());
		request.getSession().invalidate();
		model.addAttribute("head", "WELCOME");

		return "index";
	}//

	@RequestMapping(value = "/regi", method = { RequestMethod.GET, RequestMethod.POST })
	public String regi(Model model) {
		logger.info("Welcome LoginController regi! " + new Date());
		model.addAttribute("head", "REGISTRY");
		return "user/join";
	}//

	@RequestMapping(value = "/regiAf", method = { RequestMethod.GET, RequestMethod.POST })
	public String regiAf(MemberDto member, Model model) throws SQLException {
		logger.info("Welcome LoginController regiAf! " + new Date());
		logger.info("Welcome LoginController --------- " + member);
		iUserService.join(member);

		System.out.println(member.toString());
		return "redirect:/login";
	}//

	@RequestMapping(value = "/modiuser")
	public String modiuser(Model model) throws SQLException {
		System.out.println("=================================변경");
//		System.out.println(member.getUnum());
//		System.out.println(member.getUserid());
//	
//		model.addAttribute("userinfo", iUserService.modify(member));
//		MemberDto update = iUserService.modify(member); 
		return "user/modifyUserInfo";
	}
	@RequestMapping(value = "/modi", method = { RequestMethod.GET, RequestMethod.POST })
	public String modi(MemberDto member, Model model) throws SQLException {
		System.out.println("++++++++");
//		model.addAttribute("head", "REGISTRY");
//		iUserService.modify(member); 
		System.out.println(member.getUnum());
		System.out.println(member.getUsername());
		System.out.println(member.getPhone());
		System.out.println(member.getAddress());
		System.out.println(member.getUserpwd());
		model.addAttribute("userinfo", iUserService.modify(member));

		return "user/login";
	}//
	

}
