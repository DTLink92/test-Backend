package com.dh.spring5webapp.model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;


import javax.persistence.*;


import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Entity
 @Table(name = "type_equipment", catalog = "dbo")
//public class TypeEquipment extends ModelBase{
public class TypeEquipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreatedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    @JoinColumn(name="created_on")
    private Date created_on;

    @LastModifiedDate
    @Temporal(TemporalType.TIMESTAMP)
    @Column(insertable = false)
    @JoinColumn(name="updated_on")
    private Date updated_on;

    @Version
    @Column(nullable = false)
    private Long version;

    private String name;
    private  String description_type_equipment;
    private Long modified_by;
    private Long created_by;



   /* @OneToMany(fetch = FetchType.LAZY, mappedBy = "typeEquipment", cascade = CascadeType.REMOVE)
    private List<Equipment> equipments = new LinkedList<Equipment>();*/
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

    public long getVersion() {
        return version;
    }

    public void setVersion(long version) {
        this.version = version;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



  /*  public List<Equipment> getEquipments() {
        return equipments;
    }

    public void setEquipments(List<Equipment> equipments) {
        this.equipments = equipments;
    }
*/
    public String getDescriptionTypeEquipment() {
        return description_type_equipment;
    }

    public void setDescriptionTypeEquipment(String description_type_equipment) {
        this.description_type_equipment = description_type_equipment;
    }
   public Long getModify_by() {
        return modified_by;
    }

    public void setModify_by(Long modify_by) {
        this.modified_by = modify_by;
    }

    public Long getCreated_by() {
        return created_by;
    }

    public void setCreated_by(Long created_by) {
        this.created_by = created_by;
    }
}
