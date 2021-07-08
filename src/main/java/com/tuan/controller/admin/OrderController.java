package com.tuan.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tuan.dao.OrderDAO;
import com.tuan.entity.Order;

@Controller
public class OrderController {	
	@Autowired
	OrderDAO dao;
	@RequestMapping("/order/index")
	public String index(Model model) {
		Order item = new Order();
		model.addAttribute("item", item);
		List<Order> items = dao.findAll();
		model.addAttribute("items", items);
		return "/admin/order";
	}

	@RequestMapping("/order/edit")
	public String edit(Model model) {	
		
		return "/admin/order-detail";
	}

	@RequestMapping("/order/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		dao.deleteById(id);
		return "redirect:/order/index";
	}
}
