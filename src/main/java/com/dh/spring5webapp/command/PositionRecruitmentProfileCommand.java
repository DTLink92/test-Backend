package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.RecruitmentProfile;

public class PositionRecruitmentProfileCommand extends ModelBase {
    private String created;
    private String requirement;
    private String description;
    private String verification;
    private Long position;
    private String positionName;

    public PositionRecruitmentProfileCommand(){}

    public PositionRecruitmentProfileCommand(RecruitmentProfile profile) {
        setId(profile.getId());
        setCreated(profile.getCreatedOn().toString());
        setVersion(profile.getVersion());
        setCreatedOn(profile.getCreatedOn());
        setUpdatedOn(profile.getUpdatedOn());
        setRequirement(profile.getRequirement());
        setDescription(profile.getDescription());
        setVerification(profile.getVerification());
        setPosition(profile.getPosition().getId());
    }

    public RecruitmentProfile toRecruitmentProfile() {
        RecruitmentProfile entity = new RecruitmentProfile();

        entity.setId(getId());
        entity.setVersion(1);
        entity.setCreatedOn(getCreatedOn());
        entity.setUpdatedOn(getUpdatedOn());
        entity.setRequirement(getRequirement());
        entity.setDescription(getDescription());
        entity.setVerification(getVerification());
        entity.setCreatedBy(1);
        entity.setModifiedBy(1);
        Position pos = new Position();
        pos.setId(getPosition());
        entity.setPosition(pos);
        return entity;
    }

    public RecruitmentProfile UpdateProfile(RecruitmentProfile profile) {
        if(this.getDescription() != null){
            profile.setDescription(this.getDescription());
        }
        if(this.getVerification() != null){
            profile.setVerification(this.getVerification());
        }
        if(this.getRequirement() != null){
            profile.setRequirement(this.getRequirement());
        }
        if(this.getPosition() != null){
            Position position = new Position();
            position.setId(this.getPosition());
            profile.setPosition(position);
        }
        return profile;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVerification() {
        return verification;
    }

    public void setVerification(String verification) {
        this.verification = verification;
    }

    public Long getPosition() {
        return position;
    }

    public void setPosition(Long position) {
        this.position = position;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
