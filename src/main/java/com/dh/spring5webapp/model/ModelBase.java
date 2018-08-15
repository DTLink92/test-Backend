package com.dh.spring5webapp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class ModelBase {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    @JoinColumn(name="Created_on")
    private Date created_on;

    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(insertable = false)
    @JoinColumn(name="Updated_on")
    private Date Updated_on;

    @Version
    @Column
    @JsonIgnore
    private Long version;

    private int Created_by;
    private int Modified_by;

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
        return Updated_on;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.Updated_on = updatedOn;
    }

    public long getVersion() {
        return version;
    }

    public void setVersion(long version) {
        this.version = version;
    }

    public int getCreatedBy() {
        return Created_by;
    }

    public void setCreatedBy(int created_by) {
        this.Created_by = created_by;
    }

    public long getModifiedBy() {
        return Modified_by;
    }

    public void setModifiedBy(int modified_by) {
        this.Modified_by = modified_by;
    }
}
