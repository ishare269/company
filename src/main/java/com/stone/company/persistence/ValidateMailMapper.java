package com.stone.company.persistence;

import org.apache.ibatis.annotations.Param;

import com.stone.company.domain.ValidateMail;

public interface ValidateMailMapper {
	int insertValidateMail(ValidateMail validateMail);

	int deleteValidateMail(@Param("mail") String mail);

	ValidateMail findByMail(@Param("mail") String mail);
}
