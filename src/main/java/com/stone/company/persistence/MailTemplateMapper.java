package com.stone.company.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.stone.company.domain.MailTemplate;

public interface MailTemplateMapper {
	int insertMailTemplate(MailTemplate mailTemplate);

	int updateMailTemplate(MailTemplate mailTemplate);

	int deleteMailTemplete(@Param("id") String id, @Param("uid") String uid);

	MailTemplate findById(@Param("id") String id);

	List<MailTemplate> queryByUid(@Param("uid") long uid);
}
