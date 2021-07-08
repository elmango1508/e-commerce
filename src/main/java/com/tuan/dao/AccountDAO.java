package com.tuan.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.tuan.entity.Account;

@EnableJpaRepositories
public interface AccountDAO extends JpaRepository<Account, String>{
//	
//	@Query("SELECT o FROM Account o WHERE o.email = ?1")
//	public Account findByEmail(String email);
//	
//	public Account findByResetPasswordToken(String token);
}
