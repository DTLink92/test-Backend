package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.RecruitmentProfile;
import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionRecruitmentProfileRepository  extends CrudRepository<RecruitmentProfile,Long> {
    @Override
    List<RecruitmentProfile> findAll();
}
