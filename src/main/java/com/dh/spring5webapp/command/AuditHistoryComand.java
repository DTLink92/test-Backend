package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.AuditHistory;

import java.util.Date;

public class AuditHistoryComand {
    private Long AuditHistoryId;
    private String  TableName;
    private String ColumnName;
    private int ID;
    private Date Date;
    private  String Oldvalue;
    private String NewValue;
    private int ModifiedBy;

    public AuditHistoryComand() {
    }
    public AuditHistoryComand(AuditHistory auditHistory){
        this.AuditHistoryId = auditHistory.getAuditHistoryId();
        this.setTableName(auditHistory.getTableName());
        this.setColumnName(auditHistory.getTableName());
        this.setID(auditHistory.getID());
        this.setDate(auditHistory.getDate());
        this.setOldvalue(auditHistory.getOldvalue());
        this.setNewValue(auditHistory.getNewValue());
        this.setModifiedBy(auditHistory.getModifiedBy());
    }
    public AuditHistory toAuditHistory(){
        AuditHistory auditHistory = new AuditHistory();
        auditHistory.setAuditHistoryId(getAuditHistoryId());
        auditHistory.setTableName(getTableName());
        auditHistory.setColumnName(getColumnName());
        auditHistory.setID(getID());
        auditHistory.setDate(getDate());
        auditHistory.setOldvalue(getOldvalue());
        auditHistory.setNewValue(getNewValue());
        auditHistory.setModifiedBy(getModifiedBy());
        return auditHistory;
    }
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
