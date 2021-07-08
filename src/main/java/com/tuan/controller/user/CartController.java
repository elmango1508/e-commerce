package com.tuan.controller.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tuan.dao.AccountDAO;
import com.tuan.dao.OrderDAO;
import com.tuan.dao.OrderDetailDAO;
import com.tuan.dao.ProductDAO;
import com.tuan.entity.Account;
import com.tuan.entity.Item;
import com.tuan.entity.Order;
import com.tuan.entity.OrderDetail;
import com.tuan.service.CartService;
import com.tuan.service.ParamService;
import com.tuan.service.SessionService;

/**
 * @author TuanPham
 *
 */
@Controller
public class CartController {
	@Autowired
	CartService cart;
	@Autowired
	AccountDAO accdao;
	@Autowired
	ProductDAO dao;
	@Autowired
	OrderDAO orderdao;
	@Autowired
	OrderDetailDAO orderdetaildao;
	//cha` ba
	@Autowired
	ParamService param;
	@RequestMapping("/cart/view")
	public String view(Model model) {
		model.addAttribute("cart",cart);
		return "cart/cart";
	}
									 
	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart/view"; // hiển thị giỏ hàng
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id,
			@RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}
	
	@RequestMapping("/cart/add-more")
	public String addmore(){
		return "redirect:/products";
	}
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/cart/checkout")
	public String checkout() {
		String username = sessionService.get("username");
		if (username==null) {
			return "redirect:/account/login";
		}
		
		Account account = null;
		if (accdao.findById(username).isPresent()) {
			
			account = accdao.findById(username).get();
			Order order = new Order();
			order.setAccount(account);
			order.setAddress(param.getString("address", ""));
			order.setCreateDate(new Date());
			//list chua orderdetail
			List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
			//duyet tat ca sp trong gio
			for (Item pd : cart.getItems()) {
				OrderDetail od = new OrderDetail();
				od.setOrder(order);
				dao.findById(pd.getId()).ifPresent(p->{
					od.setProduct(p);
				});
				od.setPrice(pd.getPrice());
				od.setQuantity(pd.getQuantity());
				orderDetails.add(od);
			}
			order.setOrderDetails(orderDetails);
			orderdao.save(order);//luu order xuong db
			
			for (OrderDetail dt : orderDetails) {
				orderdetaildao.save(dt);
			}
			cart.clear();
		}
		
		return "redirect:/cart/view";
	}
}
