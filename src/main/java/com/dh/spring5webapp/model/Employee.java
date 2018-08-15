
package com.dh.spring5webapp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.*;

@Entity
public class Employee{
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
    private String first_name;
    private String last_name;
    private String employee_address;
    private Date birthdate;
    private Long phone_number;
    private String civil_state;
    private Integer dependencies_amount;
    private String experience;
    private Long ci;
    private String gender;
    private String email;
    private Long modified_by;
    private Long created_by;
    @Lob
    private byte[] profile_image;



    @OneToMany(fetch = FetchType.EAGER, mappedBy = "employee", cascade = CascadeType.REMOVE)
    private List<Project_Contract> positions = new LinkedList<Project_Contract>();

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

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmployee_address() {
        return employee_address;
    }

    public void setEmployee_address(String employee_address) {
        this.employee_address = employee_address;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public Long getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(Long phone_number) {
        this.phone_number = phone_number;
    }

    public String getCivil_state() {
        return civil_state;
    }

    public void setCivil_state(String civil_state) {
        this.civil_state = civil_state;
    }

    public Integer getDependencies_amount() {
        return dependencies_amount;
    }

    public void setDependencies_amount(Integer dependencies_amount) {
        this.dependencies_amount = dependencies_amount;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Long getCi() {
        return ci;
    }

    public void setCi(Long ci) {
        this.ci = ci;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public byte[] getProfile_image() {
        return profile_image;
    }

    public void setProfile_image(byte[] profile_image) {
        this.profile_image = profile_image;
    }

    public List<Project_Contract> getPositions() {
        return positions;
    }

    public void setPositions(List<Project_Contract> positions) {
        this.positions = positions;
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