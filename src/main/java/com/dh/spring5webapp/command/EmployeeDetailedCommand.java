/**
 * (C) 2017 Agilysys NV, LLC.  All Rights Reserved.  Confidential Information of Agilysys NV, LLC.
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Project_Contract;
import org.apache.tomcat.util.codec.binary.Base64;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.*;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class EmployeeDetailedCommand extends ModelBase {

    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
    private String firstName;
    private String lastName;
    private int yearsOld;
    private Long phoneNumber;
    private String civilState;
    private Integer dependenciesAmount;
    private String experience;
    private String birthday;
    private Long ci;
    private String profileImage;
    private String genre;
    //informacion del contrato
    private String positionName;
    private Long positionId;
    private Long supervisorId;
    private Long contractId;
    private String supervisorName;
    private String description;
    private Date initDate;
    private Date finishDate;
    private Date birthDate;
    private Long salary;
    private Long projectId;

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCivilState() {
        return civilState;
    }

    public void setCivilState(String civilState) {
        this.civilState = civilState;
    }

    public Integer getDependenciesAmount() {
        return dependenciesAmount;
    }

    public void setDependenciesAmount(Integer dependenciesAmount) {
        this.dependenciesAmount = dependenciesAmount;
    }

    public String getExperience() {

        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }


    public int getYearsOld() {
        return yearsOld;
    }

    public void setYearsOld(int yearsOld) {
        this.yearsOld = yearsOld;
    }


    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public EmployeeDetailedCommand() {

    }
    public EmployeeDetailedCommand(Employee employee) {
        setId(employee.getId());
        setCreatedOn(employee.getCreatedOn());
        setUpdatedOn(employee.getUpdatedOn());
        setFirstName( employee.getFirst_name());
        setLastName(employee.getLast_name());
        setBirthday(df.format(employee.getBirthdate()));
        setCivilState(employee.getCivil_state());
        setExperience(employee.getExperience());
        setDependenciesAmount(employee.getDependencies_amount());
        setPhoneNumber(employee.getPhone_number());
        setCi(employee.getCi());
        setGenre(employee.getGender());
        if (employee.getProfile_image() != null) {
            try {
                byte[] decodedString = Base64.decodeBase64(new String(employee.getProfile_image()).getBytes("UTF-8"));
                this.setProfileImage(new String(decodedString));
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
        }
        List<Project_Contract> positions = employee.getPositions();
        if(positions != null) {
            if(positions.size() > 0) {
                positions.forEach(position -> {
                    setSalary(position.getSalary());
                    setContractId(position.getId());
                    setDescription(position.getContract_description());
                    setInitDate(position.getHire_date());
                    setFinishDate(position.getEnd_date());
                    if (position.getPosition() != null)
                    {
                        setPositionName(position.getPosition().getName());
                        setPositionId(position.getPosition().getId());
                    }
                    if(position.getSupervisor() != null) {
                        setSupervisorName(position.getSupervisor().getFirst_name()+" "
                                +position.getSupervisor().getLast_name());
                        setSupervisorId(position.getSupervisor().getId());
                    }
                    if(position.getProject() != null) {
                        setProjectId(position.getProject().getId());
                    }
                });
            }
        }
        setBirthDate(employee.getBirthdate());
        setId(employee.getId());
    }

    public Employee toEmployee() {
        Employee employee = new Employee();
        employee.setFirst_name(getFirstName());
        employee.setLast_name(getLastName());
        employee.setId(getId());
        employee.setCreatedOn(getCreatedOn());
        employee.setUpdatedOn(getUpdatedOn());
        try {
            employee.setBirthdate(inputFormat.parse(getBirthday()));
        } catch (Exception e)
        {

        }
        employee.setCivil_state(getCivilState());
        employee.setDependencies_amount(getDependenciesAmount());
        employee.setPhone_number(getPhoneNumber());
        employee.setCi(getCi());
        employee.setExperience(getExperience());
        employee.setGender(getGenre());
        employee.setEmail("");
        employee.setVersion(1);
        if (this.getProfileImage() != null) {
            byte[] codedString = Base64.encodeBase64(this.getProfileImage().getBytes());
            employee.setProfile_image(codedString);
        }
        return employee;
    }

    private static int calculateAge(Date birthDate) {
        if (birthDate == null) return 0;
        LocalDate localBirthDate = birthDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        Calendar calendar = Calendar.getInstance();
        LocalDate currentDate = calendar.getTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        if ((localBirthDate != null) && (currentDate != null)) {
            return Period.between(localBirthDate, currentDate).getYears();
        } else {
            return 0;
        }
    }

    public Long getCi() {
        return ci;
    }

    public void setCi(Long ci) {
        this.ci = ci;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public void updateValues(Employee employee) {
        employee.setLast_name(getLastName());
        employee.setFirst_name(getFirstName());
        employee.setCivil_state(getCivilState());
        employee.setExperience(getExperience());
        employee.setDependencies_amount(getDependenciesAmount());
        employee.setPhone_number(getPhoneNumber());
        employee.setGender(getGenre());
        try {
            employee.setBirthdate(inputFormat.parse(getBirthday()));
        } catch (Exception e)
        {

        }
        employee.setCi(getCi());
        if(this.getProfileImage() != null) {
            byte[] codedString = Base64.encodeBase64(this.getProfileImage().getBytes());
            employee.setProfile_image(codedString);
        }
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSupervisorName() {
        return supervisorName;
    }

    public void setSupervisorName(String supervisorName) {
        this.supervisorName = supervisorName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public Date getInitDate() {
        return initDate;
    }

    public void setInitDate(Date initDate) {
        this.initDate = initDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public Long getSupervisorId() {
        return supervisorId;
    }

    public void setSupervisorId(Long supervisorId) {
        this.supervisorId = supervisorId;
    }

    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    public Long getContractId() {
        return contractId;
    }

    public void setContractId(Long contractId) {
        this.contractId = contractId;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Long getSalary() {
        return salary;
    }

    public void setSalary(Long salary) {
        this.salary = salary;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }
}
