package com.dh.spring5webapp.model;

import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class IndicatorValue extends ModelBase{

    @OneToOne(optional = false)
    private EvaluationMetric metric;

    @OneToOne(optional = false)
    private ManagementIndicator managementIndicator;

    public EvaluationMetric getMetric() {
        return metric;
    }

    public void setMetric(EvaluationMetric metric) {
        this.metric = metric;
    }

    public ManagementIndicator getManagementIndicator() {
        return managementIndicator;
    }

    public void setManagementIndicator(ManagementIndicator managementIndicator) {
        this.managementIndicator = managementIndicator;
    }

}
