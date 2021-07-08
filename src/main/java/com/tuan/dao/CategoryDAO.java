package com.tuan.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tuan.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{
	
}
