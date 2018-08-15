package com.dh.spring5webapp.command;

public class PositionEmployeeReportCommand {

    private String nameEmpl;
    private String ciEmpl;
    private String startContract;
    private String endContract;
    private String salary;
    private int numberlist;

    public int getNumberlist() {
        return numberlist;
    }

    public void setNumberlist(int numberlist) {
        this.numberlist = numberlist;
    }

    public String getNameEmpl() {
        return nameEmpl;
    }

    public void setNameEmpl(String nameEmpl) {
        this.nameEmpl = nameEmpl;
    }

    public String getCiEmpl() {
        return ciEmpl;
    }

    public void setCiEmpl(String ciEmpl) {
        this.ciEmpl = ciEmpl;
    }

    public String getStartContract() {
        return startContract;
    }

    public void setStartContract(String startContract) {
        this.startContract = startContract;
    }

    public String getEndContract() {
        return endContract;
    }

    public void setEndContract(String endContract) {
        this.endContract = endContract;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }
}
