package com.stone.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.company.domain.Profession;
import com.stone.company.persistence.ProfessionMapper;

@Service
public class ProfessionService {
	@Autowired
	private ProfessionMapper professionMapper;

	public boolean insertProfession(Profession profession) throws Exception {
		return professionMapper.insertProfession(profession) > 0;
	}

	public boolean deleteProfession(long id) throws Exception {
		return professionMapper.deleteProfession(id) > 0;
	}

	public boolean updateProfession(Profession profession) throws Exception {
		return professionMapper.updateProfession(profession) > 0;
	}

	public Profession findProfessionById(long id) {
		return professionMapper.findProfessionById(id);
	}

	public List<Profession> queryProfessionByUid(long uid, PageBounds pageBounds) {
		return professionMapper.queryProfession(uid, pageBounds);
	}

	public List<Profession> queryAll(PageBounds pageBounds) {
		return professionMapper.queryAll(pageBounds);
	}
}
