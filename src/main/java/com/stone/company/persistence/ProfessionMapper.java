package com.stone.company.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.company.domain.Profession;

public interface ProfessionMapper {
	int insertProfession(Profession profession);

	int deleteProfession(@Param("id") long id);

	int updateProfession(Profession profession);

	Profession findProfessionById(@Param("id") long id);

	List<Profession> queryProfession(@Param("uid") long uid,
			PageBounds pageBounds);

	List<Profession> queryAll(PageBounds pageBounds);

}
