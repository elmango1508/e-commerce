//package com.tuan.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//import com.tuan.dao.AccountDAO;
//import com.tuan.entity.Account;
//
//public class AccountService {
//	@Autowired
//	AccountDAO dao;
//	
//	public void updateResetPassword(String token, String email) throws AccountNotFoundExeption {
//		Account account = dao.findByEmail(email);
//		
//		if (account != null) {
//			account.setResetPasswordToken(token);
//			dao.save(account);
//		}else {
//			throw new AccountNotFoundExeption("Could not find any account with email" + email);
//		}
//	}
//	
//	public Account get(String resetPasswordToken) {
//		return dao.findByResetPasswordToken(resetPasswordToken);
//	}
//	
//	public void updatePassword(Account account, String newPassword) {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String encodedPassword = passwordEncoder.encode(newPassword);
//		
//		account.setPassword(encodedPassword);
//		account.setResetPasswordToken(null);
//		
//		dao.save(account);
//	}
//}
