package com.stone.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.company.domain.ValidateMail;
import com.stone.company.persistence.ValidateMailMapper;

@Service
public class ValidateMailService {
	@Autowired
	private ValidateMailMapper validateMailMapper;

	public boolean insertValidateMail(ValidateMail validateMail) {
		return validateMailMapper.insertValidateMail(validateMail) > 0;
	}

	public boolean deleteValidateMail(String mail) {
		return validateMailMapper.deleteValidateMail(mail) > 0;
	}

	public ValidateMail findByMail(String mail) {
		return validateMailMapper.findByMail(mail);
	}

}
