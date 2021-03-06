package com.tuan.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tuan.dao.ProductDAO;
import com.tuan.entity.Product;
import com.tuan.service.ParamService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao; 

	@Autowired
	ParamService param;

	@RequestMapping("/product/index")
	public String index(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/product";
	}

	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/product";
	}

	@RequestMapping("/product/create")
	public String create(Product item,@RequestParam("img") MultipartFile file) {
		param.save(file, "images");
		item.setImage(file.getOriginalFilename());
		dao.save(item);
		return "redirect:/product/index";
	}

	@RequestMapping("/product/update")
	public String update(Product item,@RequestParam("img") MultipartFile file) {
		if (file != null) {
			param.save(file, "images");
			item.setImage(file.getOriginalFilename());
		}else {
			item.setImage(item.getImage());
		}
		dao.save(item);
		return "redirect:/product/edit/" + item.getId();
	}

	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		dao.deleteById(id);
		return "redirect:/product/index";
	}
}