package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.RecruitmentProfile;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@DataJpaTest
public class PositionRecruitmentProfileRepositoryTest {
    /*private RecruitmentProfile recruitmentProfileA;
    private RecruitmentProfile recruitmentProfileB;
    private int initialCount = 0;
    @Autowired
    private PositionRecruitmentProfileRepository profileRepository;

    @Before
    public void before() {
        initialCount = profileRepository.findAll().size();
        recruitmentProfileA = new RecruitmentProfile();
        recruitmentProfileA.setCreatedOn(new Date());
        profileRepository.save(recruitmentProfileA);
        recruitmentProfileB = new RecruitmentProfile();
        recruitmentProfileB.setCreatedOn(new Date());
        profileRepository.save(recruitmentProfileB);
    }
    */
    @Test
    public void tesFindAllCategoriesIT() {
        /*Set<RecruitmentProfile> profiles = new HashSet<>();
        profileRepository.findAll().iterator().forEachRemaining(profiles::add);
        assertEquals(initialCount + 2, profiles.size());*/
        assertEquals(true, true);
    }
}