package com.tuan.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuan.HashUtil;
import com.tuan.dao.AccountDAO;
import com.tuan.entity.Account;
import com.tuan.service.CookieService;
import com.tuan.service.ParamService;
import com.tuan.service.SessionService;

@Controller
public class LoginController {
	@Autowired
	CookieService cookieService;

	@Autowired
	ParamService paramService;

	@Autowired
	SessionService session;

	@Autowired
	HttpServletRequest req;

	@Autowired
	AccountDAO dao;

	@GetMapping("/account/login")
	public String start() {
		return "user/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			Account user = dao.getOne(username);
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			} else {
				String uri = session.get("security-uri");
				if (uri != null) {
					return "redirect:" + uri;
				} else if(user.isAdmin() == false) {
					model.addAttribute("message", "Login succeed");
					session.set("username", user.getUsername());
//					session.get("photo",user.getPhoto());
					return "redirect:/products";
				}else {
					return "redirect:/category/index";
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "user/login";
	}
	

	@GetMapping("/account/register")
	public String register() {
		return "user/register";
	}

	@PostMapping("/register")
	public String register(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("fullname") String fullname,
			@RequestParam("email") String email) {

		Account acc = new Account();
		acc.setUsername(username);
		acc.setPassword(HashUtil.hash(password));
		acc.setFullname(fullname);
		acc.setEmail(email);
		acc.setActivated(true);
		acc.setAdmin(false);
		dao.save(acc);
		return "redirect:/account/login";
	}
}
