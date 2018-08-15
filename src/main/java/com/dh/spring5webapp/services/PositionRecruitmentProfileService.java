package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.RecruitmentProfile;

import java.util.List;

public interface PositionRecruitmentProfileService extends GenericService<RecruitmentProfile>{
    List<RecruitmentProfile> findByPositionId(Long positionId);
}
