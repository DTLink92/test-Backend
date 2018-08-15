/*los tipos de accidentes que se llevara a tomar encuenta son :
* - 1 accidentes de resbalon
* - 2 caidas(desde las alturas o desde un andamio)
* - 3 caidas de escombros u objetos
* - 4 electrocutacion,incendio u explocion
* - 5 accidentes de atrapamiento
* - 6 accidente con maquinaria
* - 7 accidentes vehiculares
* https://www.warren-kallianos.com/es/accidentes-de-construccion/tipos-de-accidentes-en-construcciones/
* */
package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class AccidentType { // extends ModelBase {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "accidentTypeID")
    private Long accidentTypeID;

    private String name_type_accident;
    private String code_type_accident;


    public Long getId() {
        return accidentTypeID;
    }

    public void setId(Long accidentTypeID) {
        this.accidentTypeID = accidentTypeID;
    }

    public String getCode_type_accident() {
        return code_type_accident;
    }

    public void setCode_type_accident(String code_type_accident) {
        this.code_type_accident = code_type_accident;
    }

    public String getName_type_accident() {
        return name_type_accident;
    }

    public void setName_type_accident(String name_type_accident) {
        this.name_type_accident = name_type_accident;
    }
}
