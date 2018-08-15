package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class AuditHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "AuditHistoryId")
    private Long AuditHistoryId;
    private String  TableName;
    private String ColumnName;
    private int ID;
    private Date Date;
    private  String Oldvalue;
    private String NewValue;
    private int ModifiedBy;

    public Long getAuditHistoryId() {
        return AuditHistoryId;
    }

    public void setAuditHistoryId(Long auditHistoryId) {
        AuditHistoryId = auditHistoryId;
    }

    public String getTableName() {
        return TableName;
    }

    public void setTableName(String tableName) {
        TableName = tableName;
    }

    public String getColumnName() {
        return ColumnName;
    }

    public void setColumnName(String columnName) {
        ColumnName = columnName;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public java.util.Date getDate() {
        return Date;
    }

    public void setDate(java.util.Date date) {
        Date = date;
    }

    public String getOldvalue() {
        return Oldvalue;
    }

    public void setOldvalue(String oldvalue) {
        Oldvalue = oldvalue;
    }

    public String getNewValue() {
        return NewValue;
    }

    public void setNewValue(String newValue) {
        NewValue = newValue;
    }

    public int getModifiedBy() {
        return ModifiedBy;
    }

    public void setModifiedBy(int modifiedBy) {
        ModifiedBy = modifiedBy;
    }
}
