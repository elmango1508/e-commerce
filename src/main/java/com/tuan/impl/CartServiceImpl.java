package com.tuan.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.tuan.dao.ProductDAO;
import com.tuan.entity.Item;
import com.tuan.entity.Product;
import com.tuan.service.CartService;

@SessionScope
@Service
public class CartServiceImpl implements CartService {
	public static Map<Integer, Item> map = new HashMap<>();
	@Autowired
	ProductDAO dao;
	
	@Override
	public Item add(Integer id) {
		// TODO Auto-generated method stub
		Item item = map.get(id);
		//5. nếu chưa có món hàng  trong giỏ hàng
		if(item == null) {
			
			item = new Item();
			Product p = new Product();
			List<Product> list = dao.findAll() ;
			//p = list.get(id);	// hàm get lấy theo index, ko lấy theo id
			//6. lấy ra 1 món hàng dựa vào id
			p = list.stream()
					.filter(it->it.getId()==id)
					.collect(Collectors.toList())
					.get(0);
			item.setId(p.getId());
			item.setImage(p.getImage());
			item.setName(p.getName());
			item.setPrice(p.getPrice());
								//item.setQty(1);
								//item = DB.items.get(id);
			item.setQuantity(1); //7. set số lượng là 1
			map.put(id, item); //8. thêm vào giỏ hàng
		} else {
			//9. ngược lại  có trong giỏ hàng thì tăng số lượng lên 1
			item.setQuantity(item.getQuantity() + 1);
		}
		return item;
	}

	@Override
	public void remove(Integer id) {
		// TODO Auto-generated method stub
		map.remove(id);
	}

	@Override
	public Item update(Integer id, int qty) {
		// TODO Auto-generated method stub
		Item item = map.get(id);
		item.setQuantity(qty);
		return item;
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		map.clear();
	}

	@Override
	public Collection<Item> getItems() {
		// TODO Auto-generated method stub
		return map.values();
	}

	@Override
	public long getCount() {
		return map.values().stream()
				.mapToInt(item -> item.getId())
				.count();
	}
	@Override
	public double getAmount() {
		return map.values().stream()
				.mapToDouble(item -> item.getPrice()*item.getQuantity())
				.sum();
	}
	
	@Override
	public double getTotal() {
		// TODO Auto-generated method stub
		double tong = 0;
		for (Item item : map.values()) {
			tong += (item.getPrice() * item.getQuantity());
		}
		return tong;
	}
}