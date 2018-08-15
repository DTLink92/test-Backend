package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.RecruitmentProfile;
import com.dh.spring5webapp.repositories.PositionRecruitmentProfileRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@Service
public class PositionRecruitmentProfileServiceImpl extends GenericServiceImpl<RecruitmentProfile> implements PositionRecruitmentProfileService{

    private static Logger logger = LoggerFactory.getLogger(EquipmentServiceImpl.class);

    private PositionRecruitmentProfileRepository repository;

    public PositionRecruitmentProfileServiceImpl(PositionRecruitmentProfileRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<RecruitmentProfile, Long> getRepository() {
        return repository;
    }

    public List<RecruitmentProfile> findByPositionId(Long positionId)
    {
        List<RecruitmentProfile> profiles = new LinkedList<RecruitmentProfile>();
        List<RecruitmentProfile> profilesPosition = new LinkedList<RecruitmentProfile>();

        profiles = findAll();
        for (RecruitmentProfile profile : profiles)
        {
            if(profile.getPosition().getId() == positionId)
            {
                profilesPosition.add(profile);
            }
        }
        return profilesPosition;
    }
}
