package com.tuan.service;

import java.util.Collection;

import com.tuan.entity.Item;

public interface CartService {
	Item add(Integer id);
	void remove(Integer id);
	Item update(Integer id, int qty);
	void clear();
	Collection<Item> getItems();
	long getCount();
	double getAmount();
	double getTotal();
}
