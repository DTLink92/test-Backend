package com.dh.spring5webapp.model;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;


@EntityListeners(AuditingEntityListener.class)
@Entity
public class Project {


     private String gestion;
     private String name;
     @Column(insertable = true, name="estimated_date")
     private Date   estimatedDate;
     @Column(insertable = true, name="delivery_date")
     private Date   deliveryDate;
     @Column(insertable = true, name="economic_loss")
     private double economicLoss;
     private double inversion;



     @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Long id;

     @CreatedDate
     @Temporal(TemporalType.TIMESTAMP)
     @Column(nullable = false, updatable = false, name="created_on")
     private Date createdOn;

     @LastModifiedDate
     @Temporal(TemporalType.TIMESTAMP)
     @Column(insertable = false, name="updated_on")
     private Date updatedOn;

     @Version
     @Column(nullable = false)
     private long version;





     public String getGestion() {
          return gestion;
     }

     public Date getEstimatedDate() {
          return estimatedDate;
     }

     public Date getDeliveryDate() {
          return deliveryDate;
     }

     public double getEconomicLoss() {
          return economicLoss;
     }

     public double getInversion() {
          return inversion;
     }


     public void setGestion(String gestion) {
          this.gestion = gestion;
     }

     public void setEstimatedDate(Date estimatedDate) {
          this.estimatedDate = estimatedDate;
     }

     public void setDeliveryDate(Date deliveryDate) {
          this.deliveryDate = deliveryDate;
     }

     public void setEconomicLoss(double economicLoss) {
          this.economicLoss = economicLoss;
     }

     public void setInversion(double inversion) {
          this.inversion = inversion;
     }

     public String getName() {
          return name;
     }

     public void setName(String name) {
          this.name = name;
     }

     public Date getCreatedOn() {
          return createdOn;
     }

     public void setCreatedOn(Date createdOn) {
          this.createdOn = createdOn;
     }

     public Date getUpdatedOn() {
          return updatedOn;
     }

     public void setUpdatedOn(Date updatedOn) {
          this.updatedOn = updatedOn;
     }

     public long getVersion() {
          return version;
     }

     public void setVersion(long version) {
          this.version = version;
     }

     public Long getId() {
          return id;
     }

     public void setId(Long id) {
          this.id = id;
     }
}
