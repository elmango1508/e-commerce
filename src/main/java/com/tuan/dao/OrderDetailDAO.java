package com.tuan.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tuan.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{}
