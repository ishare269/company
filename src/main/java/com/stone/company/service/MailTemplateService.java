package com.stone.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.company.domain.MailTemplate;
import com.stone.company.persistence.MailTemplateMapper;

@Service
public class MailTemplateService {
	@Autowired
	private MailTemplateMapper mailTemplateMapper;

	public boolean insertMailTemplate(MailTemplate mailTemplate) {
		return mailTemplateMapper.insertMailTemplate(mailTemplate) > 0;
	}

	public boolean updateMailTemplate(MailTemplate mailTemplate) {
		return mailTemplateMapper.updateMailTemplate(mailTemplate) > 0;
	}

	public boolean deleteMailTemplete(String id, String uid) {
		return mailTemplateMapper.deleteMailTemplete(id, uid) > 0;
	}

	public MailTemplate findById(String id) {
		return mailTemplateMapper.findById(id);
	}

	public List<MailTemplate> queryByUid(long uid) {
		return mailTemplateMapper.queryByUid(uid);
	}
}
