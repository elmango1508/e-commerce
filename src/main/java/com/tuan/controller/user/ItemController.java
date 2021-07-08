package com.tuan.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuan.dao.ProductDAO;
import com.tuan.entity.Product;
import com.tuan.service.CartService;
import com.tuan.service.SessionService;

@Controller
public class ItemController {
	@Autowired
	ProductDAO dao;
	
	@Autowired
	CartService cart;
	
	@Autowired
	SessionService session;

	@RequestMapping("/products")
	public String list(Model model,
			@RequestParam("p") Optional<Integer> p,
			@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
//		Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable);
		Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable);
		model.addAttribute("page",page);
		model.addAttribute("p",p.orElse(0));
		model.addAttribute("cart",cart);
		return "/product/index";
	}
	
}
