package com.dh.spring5webapp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="Detail_Assign_Equipment")
public class Detail_Assign_Equipment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(insertable = false, nullable = false, updatable = false)
    @JoinColumn(name="created_on")
    private Date created_on;

    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(insertable = false)
    @JoinColumn(name="updated_on")
    private Date updated_on;

    @Version
    @Column(insertable = false)
    @JsonIgnore
    @JoinColumn(name="version")
    private Long version;




    @ManyToOne(optional = true)
    private Equipment equipment;
    @ManyToOne(optional = true)
    private Assign_Equipment assign_equipment;

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    public Assign_Equipment getAssignEquipment() {
        return assign_equipment;
    }

    public void setAssignEquipment(Assign_Equipment assignEquipment) {
        this.assign_equipment = assignEquipment;
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreatedOn() {
        return created_on;
    }

    public void setCreatedOn(Date createdOn) {
        this.created_on = createdOn;
    }

    public Date getUpdatedOn() {
        return updated_on;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.updated_on = updatedOn;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }
}
