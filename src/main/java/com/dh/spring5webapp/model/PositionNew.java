
package com.dh.spring5webapp.model;

import javax.persistence.*;
import javax.persistence.OneToOne;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

@Entity
public class PositionNew extends ModelBase implements Serializable {

    private String code;
    private String name;

    private Long higher_work_position_id;

    private Long area_id;

    private String process;
    private String purpose;
    private Long Created_by;

    private Long Modified_by;

    public Long getCreate_by() {
        return Created_by;
    }

    public void setCreate_by(Long create_by) {
        Created_by = create_by;
    }

    public Long getModified_by() {
        return Modified_by;
    }

    public void setModified_by(Long modified_by) {
        Modified_by = modified_by;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }

    public Long getHigherWorkPosition() {
        return higher_work_position_id;
    }

    public void setHigherWorkPosition(Long higherWorkPosition) {
        this.higher_work_position_id = higherWorkPosition;
    }

    public Long getArea() {
        return area_id;
    }

    public void setArea(Long area) {
        this.area_id = area;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

}
