//package com.tuan.controller.admin;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.tuan.dao.OrderDetailDAO;
//import com.tuan.entity.OrderDetail;
//
//@Controller
//public class OrderDetailController{	
//	@Autowired
//	OrderDetailDAO dao; 
//
//	@RequestMapping("/order-detail/index")
//	public String index(Model model) {
//		OrderDetail item = new OrderDetail();
//		model.addAttribute("item", item);
//		List<OrderDetail> items = dao.findAll();
//		model.addAttribute("items", items);
//		return "/admin/order-detail";
//	}
//}
