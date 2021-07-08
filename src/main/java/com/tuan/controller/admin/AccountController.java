package com.tuan.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tuan.dao.AccountDAO;
import com.tuan.entity.Account;

import com.tuan.service.ParamService;

@Controller
public class AccountController {
	@Autowired
	AccountDAO dao; 

	@Autowired
	ParamService param;

	@RequestMapping("/account/index")
	public String index(Model model) {
		Account item = new Account();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/account";
	}

	@RequestMapping("/account/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		Account item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/account";
	}

	@RequestMapping("/account/create")
	public String create(Account item, @RequestParam("photo") MultipartFile file) {
		param.save(file, "account");
		item.setPhoto(file.getOriginalFilename());
		dao.save(item);
		return "redirect:/account/index";
	}

	@RequestMapping("/account/update")
	public String update(Account item,@RequestParam("photo") MultipartFile file ) {
		if (file != null) {
			param.save(file, "account");
			item.setPhoto(file.getOriginalFilename());
		}else {
			item.setPhoto(item.getPhoto());
		}
		dao.save(item);
		return "redirect:/account/edit/" + item.getUsername();
	}

	@RequestMapping("/account/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/account/index";
	}
}
