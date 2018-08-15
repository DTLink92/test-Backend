
package com.dh.spring5webapp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Entity
@Table(name = "equipment")
public class Equipment{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    @Column
    @JsonIgnore
    private Long version;

    private String name;
    private String brand;
    private String code;
    private String manufactured;
    private String warranty;
    private Date dateofpurchase;
    private String status;
    private String description;
    @ManyToOne(targetEntity = TypeEquipment.class)
    private TypeEquipment type_equipment;


    @Lob
    private byte[] image_equipment;
    /*@OneToMany(fetch = FetchType.LAZY, mappedBy = "equipment", cascade = CascadeType.REMOVE)
    private List<EmployeeAssignEquipment> employeeAssignEquipments = new LinkedList<EmployeeAssignEquipment>();*/
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


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getManufactured() {
        return manufactured;
    }

    public void setManufactured(String manufactured) {
        this.manufactured = manufactured;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public Date getDateofpurchase() {
        return dateofpurchase;
    }

    public void setDateofpurchase(Date dateofpurchase) {
        this.dateofpurchase = dateofpurchase;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public TypeEquipment getTypeEquipment() {
        return type_equipment;
    }

    public void setTypeEquipment(TypeEquipment typeEquipment) {
        this.type_equipment = typeEquipment;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public byte[] getImageEquipment() {
        return image_equipment;
    }

    public void setImageEquipment(byte[] image_equipment) {
        this.image_equipment = image_equipment;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }





}
