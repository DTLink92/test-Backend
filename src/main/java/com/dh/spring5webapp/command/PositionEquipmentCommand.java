package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Position_Equipment;

public class PositionEquipmentCommand extends ModelBase {

    /*private Position position;
    private Equipment equipment;*/
    private Long idEquipment;
    private Long idPosition;
    private String namePosition;
    private String nameEquipment;
    //private String typeEquipment;

    public PositionEquipmentCommand() {

    }

    public PositionEquipmentCommand(Position_Equipment positionEquipment) {
        /*this.position = positionEquipment.getPosition();
        this.equipment = positionEquipment.getEquipment();*/
        setId(positionEquipment.getId());
        setVersion(positionEquipment.getVersion());
        setCreatedOn(positionEquipment.getCreatedOn());
        setUpdatedOn(positionEquipment.getUpdatedOn());
        this.idEquipment = positionEquipment.getEquipment().getId();
        this.idPosition = positionEquipment.getPosition().getId();
        this.namePosition = positionEquipment.getPosition().getName();
        this.nameEquipment = positionEquipment.getEquipment().getName();
        //this.typeEquipment = positionEquipment.getEquipment().getTypeEquipment().getName();
    }

    /*public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }*/

    public Long getIdEquipment() {
        return idEquipment;
    }

    public void setIdEquipment(Long idEquipment) {
        this.idEquipment = idEquipment;
    }

    public Long getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(Long idPosition) {
        this.idPosition = idPosition;
    }

    public String getNamePosition() {
        return namePosition;
    }

    public void setNamePosition(String namePosition) {
        this.namePosition = namePosition;
    }

    public String getNameEquipment() {
        return nameEquipment;
    }

    public void setNameEquipment(String nameEquipment) {
        this.nameEquipment = nameEquipment;
    }

    /*public String getTypeEquipment() {
        return typeEquipment;
    }

    public void setTypeEquipment(String typeEquipment) {
        this.typeEquipment = typeEquipment;
    }*/

    public Position_Equipment toPositionEquipment() {
        Position_Equipment positionEquipment = new Position_Equipment();
        /*positionEquipment.setEquipment(getEquipment());
        positionEquipment.setPosition(getPosition());*/
        return positionEquipment;
    }

    public void updateValues(Position_Equipment positionEquipment) {

    }
}
