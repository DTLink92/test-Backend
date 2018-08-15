
package com.dh.spring5webapp.bootsptrap;

import com.dh.spring5webapp.model.*;
import com.dh.spring5webapp.repositories.*;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

//@Component

public class DevBootstrap implements ApplicationListener<ContextRefreshedEvent> {

    private EmployeeRepository employeeRepository;
    private PositionRepository positionRepository;
    private EmployeeAccidentRepository employeeAccidentRepository;
    private PositionAssignEmployeeRepository PAErepository;
    private PerformanceRepository performanceRepository;
    private PositionRecruitmentProfileRepository recruitmentProfileRepository;
    private PositionTypeEvaluatorRepository typeEvaluatorRepository;
    private PositionEvaluationMetricRepository evaluationMetricRepository;
    private PositionManagementIndicatorRepository managementIndicatorRepository;
    private PositionEvaluationRepository evaluationPositionRepository;
    private PositionIndicatorValueRepository indicatorValueRepository;


    private AssignEquipmentRepository assignEquipmentRepository;
    private DetailAssignEquipmentRepository detailAssignEquipmentRepository;
    private EquipmentRepository equipmentRepository;
    private PositionEquipmentRepository positionEquipmentRepository;
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    private TypeEquipmentRepository typeEquipmentRepository;
    private AccidentCauseGroupRepository accidentCauseGroupRepository;
    private AccidentCauseRepository accidentCauseRepository;

    private ProjectRepository projectRepository;
    private AreaRepository areaRepository;
    private AccidentRepository accidentRepository;
    private AccidentTypeRepository accidentTypeRepository;

    public DevBootstrap(EmployeeRepository employeeRepository, PositionRepository positionRepository, EmployeeAccidentRepository employeeAccidentRepository
            , PositionRecruitmentProfileRepository recruitmentProfileRepository, PositionTypeEvaluatorRepository typeEvaluatorRepository
            , PositionEvaluationMetricRepository evaluationMetricRepository, PositionManagementIndicatorRepository managementIndicatorRepository
            , PositionEvaluationRepository evaluationPositionRepository, PositionIndicatorValueRepository indicatorValueRepository
            , PerformanceRepository performanceRepository, PositionAssignEmployeeRepository PAErepository
            , EquipmentRepository equipmentRepository, TypeEquipmentRepository typeEquipmentRepository
            , AssignEquipmentRepository assignEquipmentRepository, DetailAssignEquipmentRepository detailAssignEquipmentRepository, PositionEquipmentRepository positionEquipmentRepository
            , AccidentCauseGroupRepository accidentCauseGroupRepository, AccidentCauseRepository accidentCauseRepository
            , ProjectRepository projectRepository, AreaRepository areaRepository, RoleRepository roleRepository, UserRepository userRepository
            , AccidentRepository accidentRepository, AccidentTypeRepository accidentTypeRepository

    ) {
        this.employeeRepository = employeeRepository;
        this.positionRepository = positionRepository;
        this.employeeAccidentRepository = employeeAccidentRepository;
        this.PAErepository = PAErepository;
        this.performanceRepository = performanceRepository;
        this.recruitmentProfileRepository = recruitmentProfileRepository;
        this.typeEvaluatorRepository = typeEvaluatorRepository;
        this.evaluationMetricRepository = evaluationMetricRepository;
        this.managementIndicatorRepository = managementIndicatorRepository;
        this.evaluationPositionRepository = evaluationPositionRepository;
        this.indicatorValueRepository = indicatorValueRepository;

        this.roleRepository = roleRepository;
        this.userRepository = userRepository;
        this.assignEquipmentRepository = assignEquipmentRepository;
        this.detailAssignEquipmentRepository = detailAssignEquipmentRepository;
        this.equipmentRepository = equipmentRepository;
        this.positionEquipmentRepository = positionEquipmentRepository;

        this.typeEquipmentRepository = typeEquipmentRepository;
        this.projectRepository = projectRepository;
        this.areaRepository = areaRepository;

        this.accidentCauseGroupRepository = accidentCauseGroupRepository;
        this.accidentCauseRepository = accidentCauseRepository;
        this.accidentRepository = accidentRepository;
        this.accidentTypeRepository = accidentTypeRepository;
    }


    private void initData() {
/*
        // MARCELO DATA
        // Proyect
        Project projectoVivienda1 = new Project();
        projectoVivienda1.setName("Vivienda 1 ");
        projectoVivienda1.setGestion("2015");
        projectRepository.save(projectoVivienda1);

        Project projectoEdificacion1 = new Project();
        projectoEdificacion1.setName("Edificacion 1");
        projectoEdificacion1.setGestion("2016");
        projectRepository.save(projectoEdificacion1);

        Project projectoVivienda2 = new Project();
        projectoVivienda2.setName("Vivienda 2");
        projectoVivienda2.setGestion("2017");
        projectRepository.save(projectoVivienda2);

        Project projectoEdificacion2 = new Project();
        projectoEdificacion2.setName("Edificacion 2");
        projectoEdificacion2.setGestion("2018");
        projectRepository.save(projectoEdificacion2);

        Area areaElectricidad = new Area();
        Area areaPlomeria = new Area();
        Area areaFachado = new Area();
        Area areaPintura = new Area();

        areaElectricidad.setName("Electricidad");
        areaElectricidad.setDetail("details1");

        areaPlomeria.setName("Plomeria");
        areaPlomeria.setDetail("details1");

        areaFachado.setName("Fachado");
        areaFachado.setDetail("details1");

        areaPintura.setName("Pintura");
        areaPintura.setDetail("details1");
        //Area

        areaElectricidad.setProject(projectoVivienda1);
        areaFachado.setProject(projectoVivienda2);
        areaPintura.setProject(projectoEdificacion1);
        areaPlomeria.setProject(projectoEdificacion2);

        areaRepository.save(areaElectricidad);
        areaRepository.save(areaFachado);
        areaRepository.save(areaPintura);
        areaRepository.save(areaPlomeria);

        //Performances

        Performance performance = new Performance();
        performance.setAbilities("Carpintero");
        performance.setImportant(true);
        performance.setDescription("Descripcion obrero1");
        performanceRepository.save(performance);

        Performance performance1 = new Performance();
        performance1.setAbilities("Carpintero");
        performance1.setImportant(true);
        performance1.setDescription("Descripcion obrero1");
        performanceRepository.save(performance1);

        Performance performance2 = new Performance();
        performance2.setAbilities("Carpintero");
        performance2.setImportant(true);
        performance2.setDescription("Descripcion obrero1");
        performanceRepository.save(performance2);

        Performance performance3 = new Performance();
        performance3.setAbilities("Carpintero");
        performance3.setImportant(true);
        performance3.setDescription("Descripcion obrero1");
        performanceRepository.save(performance3);

        //MARCELO END

        //LAURA DATA START
        // Position
        Position position0 = new Position();
        position0.setCode("Default Gerencia");
        position0.setName("Default Gerencia");

        position0.setArea(areaElectricidad);
        position0.setProcess("Default Gerencia");
        position0.setPurpose("Responsable de la construccion para su conclucion y entrega a tiempo");
        positionRepository.save(position0);

        Position position1 = new Position();
        position1.setCode("CD-01");
        position1.setName("Gerente de proyecto");
        position1.setArea(areaFachado);
        position1.setProcess("Operativo");
        position1.setHigherWorkPosition(position0);
        position1.setPurpose("Responsable de la construccion para su conclucion y entrega a tiempo");
        position1.setPerformance(performance);
        positionRepository.save(position1);

        Position position2 = new Position();
        position2.setCode("CD-02");
        position2.setName("Arquitecto");
        position2.setHigherWorkPosition(position1);
        position2.setArea(areaElectricidad);
        position2.setProcess("Operativo");
        position2.setPurpose("Responsable de la contratacion de empleados para puesta en marcha y su respectivo seguimiento");
        position2.setPerformance(performance1);
        positionRepository.save(position2);

        Position position3 = new Position();
        position3.setCode("CD-03");
        position3.setName("Supervisor de obra");
        position3.setHigherWorkPosition(position2);
        position3.setArea(areaPintura);
        position3.setProcess("misional");
        position3.setPurpose("Asistir en las labores y representarlo en su ausencia, ademas del adecuado conocimiento y manejo de equipos a utilizar");
        position3.setPerformance(performance2);
        positionRepository.save(position3);

        Position position4 = new Position();
        position4.setCode("CD-04");
        position4.setName("Maestro Albanil");
        position4.setHigherWorkPosition(position3);
        position4.setArea(areaPlomeria);
        position4.setProcess("Contruccion");
        position4.setPurpose("Responsable del montaje y la contruccion en la obra");
        position4.setPerformance(performance3);
        positionRepository.save(position4);

        // RecruitmentProfile
        RecruitmentProfile profile1 = new RecruitmentProfile();
        profile1.setDescription("Educacion");
        profile1.setRequirement("tecnico de Archivo");
        profile1.setVerification("Certificacion");
        profile1.setPosition(position1);
        recruitmentProfileRepository.save(profile1);

        RecruitmentProfile profile2 = new RecruitmentProfile();
        profile2.setDescription("Experiencia");
        profile2.setRequirement("3 anios minimo en funciones similares");
        profile2.setVerification("Certificaciones o referencias");
        profile2.setPosition(position1);
        recruitmentProfileRepository.save(profile2);

        //Evaluation -- START
        // EvaluationMetric
        EvaluationMetric metric1 = new EvaluationMetric();
        metric1.setDescription("Excelente");
        metric1.setValue(100);
        evaluationMetricRepository.save(metric1);

        EvaluationMetric metric2 = new EvaluationMetric();
        metric2.setDescription("Muy bueno");
        metric2.setValue(85);
        evaluationMetricRepository.save(metric2);

        EvaluationMetric metric3 = new EvaluationMetric();
        metric3.setDescription("Bueno");
        metric3.setValue(75);
        evaluationMetricRepository.save(metric3);

        EvaluationMetric metric4 = new EvaluationMetric();
        metric4.setDescription("Regular");
        metric4.setValue(65);
        evaluationMetricRepository.save(metric4);

        EvaluationMetric metric5 = new EvaluationMetric();
        metric5.setDescription("Deficiente");
        metric5.setValue(45);
        evaluationMetricRepository.save(metric5);

        //Management Indicator
        ManagementIndicator indicator1 = new ManagementIndicator();
        indicator1.setCompetence("Calidad y conocimiento");
        indicator1.setCriteria("Posee conocimiento y destresas que le permitan ejercer efectivamente su puesto?");
        managementIndicatorRepository.save(indicator1);

        ManagementIndicator indicator2 = new ManagementIndicator();
        indicator2.setCompetence("Trabajo en Equipo");
        indicator2.setCriteria("Solicita participacion de");
        managementIndicatorRepository.save(indicator2);

        // Type Evaluator
        TypeEvaluator type1 = new TypeEvaluator();
        type1.setDescription("Jefe Inmediato");
        typeEvaluatorRepository.save(type1);

        TypeEvaluator type2 = new TypeEvaluator();
        type2.setDescription("Supervisor");
        typeEvaluatorRepository.save(type2);

        TypeEvaluator type3 = new TypeEvaluator();
        type3.setDescription("Colega(par)");
        typeEvaluatorRepository.save(type3);

        Employee employee1 = new Employee();
        employee1.setFirstName("evaluado");
        employee1.setLastName("evaluado");
        employee1.setBirthday(new Date(1993,10,1));
        employee1.setCi((long) 7854956);
        employee1.setCivilState("Casado/a");
        employee1.setPhoneNumber((long) 4896521);
        employee1.setGenre("Otro");
        employeeRepository.save(employee1);

        PositionAssignEmployee contractEmployee1 = new PositionAssignEmployee();
        contractEmployee1.setEmployee(employee1);
        contractEmployee1.setInitDate(new Date(2018,5,1));
        contractEmployee1.setFinishDate(new Date(2020,5,2));
        contractEmployee1.setPosition(position2);

        Employee employee2 = new Employee();
        employee2.setFirstName("evaluador");
        employee2.setLastName("evaluador");
        employee2.setBirthday(new Date(1993,10,1));
        employee2.setCi((long) 7854956);
        employee2.setCivilState("Casado/a");
        employee2.setPhoneNumber((long) 4896521);
        employee2.setGenre("Otro");
        employeeRepository.save(employee2);

        PositionAssignEmployee contractEmployee2 = new PositionAssignEmployee();
        contractEmployee2.setEmployee(employee1);
        contractEmployee2.setInitDate(new Date(2018,5,1));
        contractEmployee2.setFinishDate(new Date(2020,5,2));
        contractEmployee2.setPosition(position1);

        IndicatorValue value1 = new IndicatorValue();
        value1.setManagementIndicator(indicator1);
        value1.setMetric(metric1);
        indicatorValueRepository.save(value1);

        IndicatorValue value2 = new IndicatorValue();
        value2.setManagementIndicator(indicator2);
        value2.setMetric(metric4);
        indicatorValueRepository.save(value2);

        List<IndicatorValue> indicators = new LinkedList<IndicatorValue>();
        indicators.add(value1);
        indicators.add(value2);

        Evaluation evaluation = new Evaluation();
        evaluation.setEvaluated(employee1);
        evaluation.setEvaluator(employee2);
        evaluation.setType(type3);
        evaluation.setIndicatorValues(indicators);
        evaluationPositionRepository.save(evaluation);

        //---END

        //BRIAN DATA START
        //Employees
        //Gerentes
        Employee juan = new Employee();
        juan.setPhoneNumber((long) 4526134);
        juan.setGenre("Masculino");
        juan.setDependenciesAmount(0);
        juan.setCivilState("Casado/a");
        juan.setCi((long) 7854113);
        juan.setFirstName("Juan");
        juan.setLastName("Rojas");
        juan.setBirthday(new Date(01-01-1990));
        employeeRepository.save(juan);

        PositionAssignEmployee contratoJuan = new PositionAssignEmployee();
        contratoJuan.setPosition(position1);
        contratoJuan.setInitDate(new Date(10-01-2018));
        contratoJuan.setFinishDate(new Date(10-01-2020));
        contratoJuan.setEmployee(juan);
        contratoJuan.setSalary((long) 1000);
        PAErepository.save(contratoJuan);

        Employee carla = new Employee();
        carla.setPhoneNumber((long) 4528134);
        carla.setGenre("Femenino");
        carla.setDependenciesAmount(0);
        carla.setCivilState("Soltero/a");
        carla.setCi((long) 7854124);
        carla.setFirstName("Carla");
        carla.setLastName("Rojas");
        carla.setBirthday(new Date(06-06-1992));
        employeeRepository.save(carla);

        PositionAssignEmployee contratoCarla = new PositionAssignEmployee();
        contratoCarla.setPosition(position1);
        contratoCarla.setInitDate(new Date(10-01-2018));
        contratoCarla.setFinishDate(new Date(10-01-2020));
        contratoCarla.setEmployee(carla);
        contratoCarla.setSalary((long) 1000);
        PAErepository.save(contratoCarla);

        Employee gabriela = new Employee();
        gabriela.setPhoneNumber((long) 4526115);
        gabriela.setGenre("Femenino");
        gabriela.setDependenciesAmount(0);
        gabriela.setCivilState("Soltero/a");
        gabriela.setCi((long) 7814124);
        gabriela.setFirstName("Gabriela");
        gabriela.setLastName("Rocha");
        gabriela.setBirthday(new Date(8-10-1991));
        employeeRepository.save(gabriela);

        PositionAssignEmployee contratoGabriela = new PositionAssignEmployee();
        contratoGabriela.setPosition(position1);
        contratoGabriela.setInitDate(new Date(10-01-2018));
        contratoGabriela.setFinishDate(new Date(10-01-2020));
        contratoGabriela.setEmployee(gabriela);
        contratoGabriela.setSalary((long)1000);
        PAErepository.save(contratoGabriela);

        Employee rodrigo = new Employee();
        rodrigo.setPhoneNumber((long) 4526135);
        rodrigo.setGenre("Masculino");
        rodrigo.setDependenciesAmount(0);
        rodrigo.setCivilState("Soltero/a");
        rodrigo.setCi((long) 7154124);
        rodrigo.setFirstName("Rodrigo");
        rodrigo.setLastName("Perez");
        rodrigo.setBirthday(new Date(02-10-1992));
        employeeRepository.save(rodrigo);

        PositionAssignEmployee contratoRodrigo = new PositionAssignEmployee();
        contratoRodrigo.setPosition(position1);
        contratoRodrigo.setInitDate(new Date(10-01-2018));
        contratoRodrigo.setFinishDate(new Date(10-01-2020));
        contratoRodrigo.setEmployee(rodrigo);
        contratoRodrigo.setSalary((long) 1000);
        PAErepository.save(contratoRodrigo);

        //Arquitectos
        Employee marcelo = new Employee();
        marcelo.setPhoneNumber((long) 4526144);
        marcelo.setGenre("Masculino");
        marcelo.setDependenciesAmount(0);
        marcelo.setCivilState("Casado/a");
        marcelo.setCi((long) 7859123);
        marcelo.setFirstName("Marcelo");
        marcelo.setLastName("Rios");
        marcelo.setBirthday(new Date(02-11-1985));
        employeeRepository.save(marcelo);

        PositionAssignEmployee contratoMarcelo = new PositionAssignEmployee();
        contratoMarcelo.setPosition(position2);
        contratoMarcelo.setInitDate(new Date(10-01-2018));
        contratoMarcelo.setFinishDate(new Date(10-01-2020));
        contratoMarcelo.setEmployee(marcelo);
        contratoMarcelo.setSupervisor(juan);
        contratoMarcelo.setSalary((long) 900);
        PAErepository.save(contratoMarcelo);

        Employee monica = new Employee();
        monica.setPhoneNumber((long) 4526134);
        monica.setGenre("Femenino");
        monica.setDependenciesAmount(0);
        monica.setCivilState("Soltero/a");
        monica.setCi((long) 7854124);
        monica.setFirstName("Monica");
        monica.setLastName("Peredo");
        monica.setBirthday(new Date(02-03-1986));
        employeeRepository.save(monica);

        PositionAssignEmployee contratoMonica = new PositionAssignEmployee();
        contratoMonica.setPosition(position2);
        contratoMonica.setInitDate(new Date(10-01-2018));
        contratoMonica.setFinishDate(new Date(10-01-2020));
        contratoMonica.setEmployee(monica);
        contratoMonica.setSupervisor(carla);
        contratoMonica.setSalary((long) 900);
        PAErepository.save(contratoMonica);

        Employee fernanda = new Employee();
        fernanda.setPhoneNumber((long) 4526135);
        fernanda.setGenre("Femenino");
        fernanda.setDependenciesAmount(0);
        fernanda.setCivilState("Soltero/a");
        fernanda.setCi((long) 7857124);
        fernanda.setFirstName("Fernanda");
        fernanda.setLastName("Rocha");
        fernanda.setBirthday(new Date(02-07-1984));
        employeeRepository.save(fernanda);

        PositionAssignEmployee contratoFernanda = new PositionAssignEmployee();
        contratoFernanda.setPosition(position2);
        contratoFernanda.setInitDate(new Date(10-01-2018));
        contratoFernanda.setFinishDate(new Date(10-01-2020));
        contratoFernanda.setEmployee(fernanda);
        contratoFernanda.setSupervisor(gabriela);
        contratoFernanda.setSalary((long)900);
        PAErepository.save(contratoFernanda);

        Employee brian = new Employee();
        brian.setPhoneNumber((long) 4526145);
        brian.setGenre("Masculino");
        brian.setDependenciesAmount(0);
        brian.setCivilState("Soltero/a");
        brian.setCi((long) 7454124);
        brian.setFirstName("Brian");
        brian.setLastName("Montecinos");
        brian.setBirthday(new Date(02-05-1982));
        employeeRepository.save(brian);

        PositionAssignEmployee contratoBrian = new PositionAssignEmployee();
        contratoBrian.setPosition(position2);
        contratoBrian.setInitDate(new Date(10-01-2018));
        contratoBrian.setFinishDate(new Date(10-01-2020));
        contratoBrian.setEmployee(brian);
        contratoBrian.setSupervisor(rodrigo);
        contratoBrian.setSalary((long) 900);
        PAErepository.save(contratoBrian);

        //Supervisor de obras
        Employee leo = new Employee();
        leo.setPhoneNumber((long) 4527144);
        leo.setGenre("Masculino");
        leo.setDependenciesAmount(0);
        leo.setCivilState("Casado/a");
        leo.setCi((long) 7754123);
        leo.setFirstName("Leo");
        leo.setLastName("Rios");
        leo.setBirthday(new Date(2-9-1982));
        employeeRepository.save(leo);

        PositionAssignEmployee contratoLeo = new PositionAssignEmployee();
        contratoLeo.setPosition(position3);
        contratoLeo.setInitDate(new Date(10-1-2018));
        contratoLeo.setFinishDate(new Date(10-1-2020));
        contratoLeo.setEmployee(leo);
        contratoLeo.setSupervisor(marcelo);
        contratoLeo.setSalary((long)800);
        PAErepository.save(contratoLeo);

        Employee micaela = new Employee();
        micaela.setPhoneNumber((long) 4426134);
        micaela.setGenre("Femenino");
        micaela.setDependenciesAmount(0);
        micaela.setCivilState("Soltero/a");
        micaela.setCi((long) 7814124);
        micaela.setFirstName("Micaela");
        micaela.setLastName("Paredes");
        micaela.setBirthday(new Date(20-04-1985));
        employeeRepository.save(micaela);

        PositionAssignEmployee contratoMicaela = new PositionAssignEmployee();
        contratoMicaela.setPosition(position3);
        contratoMicaela.setInitDate(new Date(10-01-2018));
        contratoMicaela.setFinishDate(new Date(10-01-2020));
        contratoMicaela.setEmployee(micaela);
        contratoMicaela.setSupervisor(monica);
        contratoMicaela.setSalary((long) 800);
        PAErepository.save(contratoMicaela);

        Employee paola = new Employee();
        paola.setPhoneNumber((long) 5526135);
        paola.setGenre("Femenino");
        paola.setDependenciesAmount(0);
        paola.setCivilState("Soltero/a");
        paola.setCi((long) 7854524);
        paola.setFirstName("Paola");
        paola.setLastName("Arnez");
        paola.setBirthday(new Date(02-06-1987));
        employeeRepository.save(paola);

        PositionAssignEmployee contratoPaola = new PositionAssignEmployee();
        contratoPaola.setPosition(position3);
        contratoPaola.setInitDate(new Date(10-01-2018));
        contratoPaola.setFinishDate(new Date(10-01-2020));
        contratoPaola.setEmployee(paola);
        contratoPaola.setSupervisor(fernanda);
        contratoPaola.setSalary((long) 800);
        PAErepository.save(contratoPaola);

        Employee ricardo = new Employee();
        ricardo.setPhoneNumber((long) 4526145);
        ricardo.setGenre("Masculino");
        ricardo.setDependenciesAmount(0);
        ricardo.setCivilState("Soltero/a");
        ricardo.setCi((long) 7854134);
        ricardo.setFirstName("Ricardo");
        ricardo.setLastName("Fernandez");
        ricardo.setBirthday(new Date(2-8-1982));
        employeeRepository.save(ricardo);

        PositionAssignEmployee contratoRicardo = new PositionAssignEmployee();
        contratoRicardo.setPosition(position3);
        contratoRicardo.setInitDate(new Date(10-1-2018));
        contratoRicardo.setFinishDate(new Date(10-1-2020));
        contratoRicardo.setEmployee(ricardo);
        contratoRicardo.setSupervisor(brian);
        contratoRicardo.setSalary((long) 800);
        PAErepository.save(contratoRicardo);

        //Maestro albañil
        Employee jhon = new Employee();
        jhon.setPhoneNumber((long) 4527144);
        jhon.setGenre("Masculino");
        jhon.setDependenciesAmount(0);
        jhon.setCivilState("Casado/a");
        jhon.setCi((long) 7854124);
        jhon.setFirstName("Jhon");
        jhon.setLastName("Stark");
        jhon.setBirthday(new Date(02-12-1996));
        employeeRepository.save(jhon);

        PositionAssignEmployee contratoJhon= new PositionAssignEmployee();
        contratoJhon.setPosition(position4);
        contratoJhon.setInitDate(new Date(10-01-2018));
        contratoJhon.setFinishDate(new Date(10-01-2020));
        contratoJhon.setEmployee(jhon);
        contratoJhon.setSupervisor(ricardo);
        contratoJhon.setSalary((long)700);
        PAErepository.save(contratoJhon);

        Employee diana = new Employee();
        diana.setPhoneNumber((long) 4426134);
        diana.setGenre("Femenino");
        diana.setDependenciesAmount(0);
        diana.setCivilState("Soltero/a");
        diana.setCi((long) 7854125);
        diana.setFirstName("Diana");
        diana.setLastName("Claros");
        diana.setBirthday(new Date(02-03-1986));
        employeeRepository.save(diana);

        PositionAssignEmployee contratoDiana = new PositionAssignEmployee();
        contratoDiana.setPosition(position4);
        contratoDiana.setInitDate(new Date(10-01-2018));
        contratoDiana.setFinishDate(new Date(10-01-2020));
        contratoDiana.setEmployee(diana);
        contratoDiana.setSupervisor(paola);
        contratoDiana.setSalary((long) 800);
        PAErepository.save(contratoDiana);

        Role roleAdmin = new Role();
        roleAdmin.setRoleName("Administrator");
        roleRepository.save(roleAdmin);

        Role roleUser = new Role();
        roleUser.setRoleName("Regular User");
        roleRepository.save(roleUser);
*/
        /*User userAdmin = new User();
        userAdmin.setFirstName("Rodrigo");
        userAdmin.setLastName("Perez");
        userAdmin.setLogin("Admin");
        userAdmin.setPassword("Admin");
        userAdmin.setRole(roleAdmin);
        userRepository.save(userAdmin);*/
/*
        User userRegular = new User();
        userRegular.setFirstName("Rodrigo");
        userRegular.setLastName("Perez");
        userRegular.setLogin("user1234");
        userRegular.setPassword("user1234");
        userRegular.setRole(roleUser);
        userRepository.save(userRegular);
        //BRIAN END

        // ENAYDA START DATA DEFAULT


        AccidentType tipo1 = new AccidentType();
        tipo1.setName_type_accident("accidente de resbalon");
        tipo1.setCode_type_accident("accRR");
        accidentTypeRepository.save(tipo1);

        AccidentType tipo2 = new AccidentType();
        tipo2.setName_type_accident("caida de altura o andamio");
        tipo2.setCode_type_accident("accAA");
        accidentTypeRepository.save(tipo2);

        AccidentType tipo3 = new AccidentType();
        tipo3.setName_type_accident("caida de escombros y/o objetos");
        tipo3.setCode_type_accident("accEO");
        accidentTypeRepository.save(tipo3);

        AccidentType tipo4 = new AccidentType();
        tipo4.setName_type_accident("Electrocutacion");
        tipo4.setCode_type_accident("accEE");
        accidentTypeRepository.save(tipo4);
        AccidentType tipo5 = new AccidentType();
        tipo5.setName_type_accident("Incendios");
        tipo5.setCode_type_accident("accII");
        accidentTypeRepository.save(tipo5);

        AccidentType tipo6 = new AccidentType();
        tipo6.setName_type_accident("Explociones");
        tipo6.setCode_type_accident("accEX");
        accidentTypeRepository.save(tipo6);

        AccidentType tipo7 = new AccidentType();
        tipo7.setName_type_accident("Accidente de Atrapamiento");
        tipo7.setCode_type_accident("accATR");
        accidentTypeRepository.save(tipo7);

        AccidentType tipo8 = new AccidentType();
        tipo8.setName_type_accident("Accidente de Maquinaria");
        tipo8.setCode_type_accident("accMM");
        accidentTypeRepository.save(tipo8);

        AccidentType tipo9 = new AccidentType();
        tipo9.setName_type_accident("Accidente Vehicular");
        tipo9.setCode_type_accident("accVV");
        accidentTypeRepository.save(tipo9);

        //LISTA DE ACCIDENTES
        Accident acc1 = new Accident();
        acc1.setNameAccidentado("edilverto perez");
        acc1.setDate_accident(new Date(10 - 01 - 2020));
        acc1.setHour_accident(new Date(10 - 01 - 2020));
        acc1.setPlace_accident("planta baja de construccion");
        acc1.setGravity_accident("");
        acc1.setDescription_accident("");
        acc1.setAccidentType(tipo1);
        acc1.setArea(areaElectricidad);
        accidentRepository.save(acc1);

        Accident acc2 = new Accident();
        acc2.setNameAccidentado("edilvertoww perez");
        acc2.setDate_accident(new Date(10 - 01 - 2020));
        acc2.setHour_accident(new Date(10 - 01 - 2020));
        acc2.setPlace_accident("planta baja de construccion");
        acc2.setGravity_accident("");
        acc2.setDescription_accident("");
        acc2.setAccidentType(tipo1);
        acc2.setArea(areaFachado);
        accidentRepository.save(acc2);

        Accident acc3 = new Accident();
        acc3.setNameAccidentado("edilverto perez");
        acc3.setDate_accident(new Date(10 - 01 - 2020));
        acc3.setHour_accident(new Date(10 - 01 - 2020));
        acc3.setPlace_accident("planta baja de construccion");
        acc3.setGravity_accident("");
        acc3.setDescription_accident("");
        acc3.setAccidentType(tipo1);
        acc3.setArea(areaElectricidad);
        accidentRepository.save(acc3);

        Accident acc4 = new Accident();
        acc4.setNameAccidentado("Edson Pilar");
        acc4.setDate_accident(new Date(10 - 01 - 2020));
        acc4.setHour_accident(new Date(10 - 01 - 2020));
        acc4.setPlace_accident("construccion");
        acc4.setGravity_accident("lebe");
        acc4.setDescription_accident("caida de altura un metro");
        acc4.setAccidentType(tipo8);
        acc4.setArea(areaPintura);
        accidentRepository.save(acc4);

        Accident acc5 = new Accident();
        acc5.setNameAccidentado("Amilcar Medrano");
        acc5.setDate_accident(new Date(10 - 01 - 2020));
        acc5.setHour_accident(new Date(10 - 01 - 2020));
        acc5.setPlace_accident("planta baja sotano");
        acc5.setGravity_accident("ensegesimiento por unnos minutos");
        acc5.setDescription_accident("la luces inpactaron fuerte sus ojos");
        acc5.setAccidentType(tipo9);
        acc5.setArea(areaElectricidad);
        accidentRepository.save(acc5);

        Accident acc6 = new Accident();
        acc6.setNameAccidentado("Eliceo Munes");
        acc6.setDate_accident(new Date(10 - 01 - 2020));
        acc6.setHour_accident(new Date(10 - 01 - 2020));
        acc6.setPlace_accident("casa de misitro Quistana");
        acc6.setGravity_accident("fractura de brazo");
        acc6.setDescription_accident("exeso de esfuerzo");
        acc6.setAccidentType(tipo5);
        acc6.setArea(areaPlomeria);
        accidentRepository.save(acc6);

        Accident acc7 = new Accident();
        acc7.setNameAccidentado("Edy Crespo");
        acc7.setDate_accident(new Date(10 - 01 - 2020));
        acc7.setHour_accident(new Date(10 - 01 - 2020));
        acc7.setPlace_accident(" construccion externa ");
        acc7.setGravity_accident("deslizamiento de andamio");
        acc7.setDescription_accident("fractura pie derecho");
        acc7.setAccidentType(tipo1);
        acc7.setArea(areaElectricidad);
        accidentRepository.save(acc7);

        Accident acc8 = new Accident();
        acc8.setNameAccidentado("Juan Zalinas");
        acc8.setDate_accident(new Date(10 - 01 - 2020));
        acc8.setHour_accident(new Date(10 - 01 - 2020));
        acc8.setPlace_accident("planta alta de construccion");
        acc8.setGravity_accident("roptura de craneo");
        acc8.setDescription_accident("caida de 4 metros");
        acc8.setAccidentType(tipo1);
        acc8.setArea(areaElectricidad);
        accidentRepository.save(acc8);

        Accident acc9 = new Accident();
        acc9.setNameAccidentado("Pedro Alcores");
        acc9.setDate_accident(new Date(10 - 01 - 2020));
        acc9.setHour_accident(new Date(10 - 01 - 2020));
        acc9.setPlace_accident("planta de construccion");
        acc9.setGravity_accident("desprendimiento piel");
        acc9.setDescription_accident("cortadira de amquinaria");
        acc9.setAccidentType(tipo1);
        acc9.setArea(areaElectricidad);
        accidentRepository.save(acc9);

        Accident acc10 = new Accident();
        acc10.setNameAccidentado("Roberto Paniagua");
        acc10.setDate_accident(new Date(10 - 01 - 2020));
        acc10.setHour_accident(new Date(10 - 01 - 2020));
        acc10.setPlace_accident("planta baja de construccion");
        acc10.setGravity_accident("lebe");
        acc10.setDescription_accident("golpes de escombros");
        acc10.setAccidentType(tipo1);
        acc10.setArea(areaElectricidad);
        accidentRepository.save(acc10);

        Accident acc11 = new Accident();
        acc11.setNameAccidentado("Patrecuato Aguilar");
        acc11.setDate_accident(new Date(10 - 01 - 2020));
        acc11.setHour_accident(new Date(10 - 01 - 2020));
        acc11.setPlace_accident("planta baja ");
        acc11.setGravity_accident("grabe");
        acc11.setDescription_accident("atropello maquinaria");
        acc11.setAccidentType(tipo7);
        acc11.setArea(areaElectricidad);
        accidentRepository.save(acc11);

        Accident acc12 = new Accident();
        acc12.setNameAccidentado("Waldo Camacho");
        acc12.setDate_accident(new Date(10 - 01 - 2020));
        acc12.setHour_accident(new Date(10 - 01 - 2020));
        acc12.setPlace_accident("planta alta bloque B");
        acc12.setGravity_accident("pasable");
        acc12.setDescription_accident("caida de escombros");
        acc12.setAccidentType(tipo4);
        acc12.setArea(areaPlomeria);
        accidentRepository.save(acc12);

        Accident acc13 = new Accident();
        acc13.setNameAccidentado("Roverto Cardoso");
        acc13.setDate_accident(new Date(10 - 01 - 2020));
        acc13.setHour_accident(new Date(10 - 01 - 2020));
        acc13.setPlace_accident("andamio");
        acc13.setGravity_accident("grabe");
        acc13.setDescription_accident("caida de altura de 2 metros");
        acc13.setAccidentType(tipo1);
        acc13.setArea(areaPintura);
        accidentRepository.save(acc13);

        Accident acc14 = new Accident();
        acc14.setNameAccidentado("Acimilo perez");
        acc14.setDate_accident(new Date(10 - 01 - 2020));
        acc14.setHour_accident(new Date(10 - 01 - 2020));
        acc14.setPlace_accident("planta baja de construccion");
        acc14.setGravity_accident("lebe");
        acc14.setDescription_accident("fractura brazo");
        acc14.setAccidentType(tipo4);
        acc14.setArea(areaFachado);
        accidentRepository.save(acc14);
        //probando relacionamiento causas y grupos de causas

        //GRUPO 1 FACTORES PERSONALES
        AccidentCauseGroup group1 = new AccidentCauseGroup();
        group1.setTitle("Factores personales");
        group1 = accidentCauseGroupRepository.save(group1);

        AccidentCause cause28 = new AccidentCause();
        cause28.setAccidentCauseGroup(group1);
        cause28.setDescription("falta de experiencia en el cargo");
        accidentCauseRepository.save(cause28);

        AccidentCause cause29 = new AccidentCause();
        cause29.setAccidentCauseGroup(group1);
        cause29.setDescription("Deficiencia fisica para la albor");
        accidentCauseRepository.save(cause29);

        AccidentCause cause30 = new AccidentCause();
        cause30.setAccidentCauseGroup(group1);
        cause30.setDescription("No Acatar Ordenes de su Superior");
        accidentCauseRepository.save(cause30);

        AccidentCause cause31 = new AccidentCause();
        cause31.setAccidentCauseGroup(group1);
        cause31.setDescription("Uso inadecuado de los EPP proporcionados por la empresa");
        accidentCauseRepository.save(cause31);

        AccidentCause cause32 = new AccidentCause();
        cause32.setAccidentCauseGroup(group1);
        cause32.setDescription("No Uso de los EPP proporcionados por la empresa");
        accidentCauseRepository.save(cause32);

        AccidentCause cause33 = new AccidentCause();
        cause33.setAccidentCauseGroup(group1);
        cause33.setDescription("tension");
        accidentCauseRepository.save(cause33);

        AccidentCause cause34 = new AccidentCause();
        cause34.setAccidentCauseGroup(group1);
        cause34.setDescription("Motivacion deficiente");
        accidentCauseRepository.save(cause34);

        AccidentCause cause35 = new AccidentCause();
        cause35.setAccidentCauseGroup(group1);
        cause35.setDescription("Falta de Habilidad");
        accidentCauseRepository.save(cause35);

        AccidentCause cause36 = new AccidentCause();
        cause36.setAccidentCauseGroup(group1);
        cause36.setDescription("Otras - Cual...?");
        accidentCauseRepository.save(cause36);

        //GRUPO 2 FACTORES RELATIVOS AL AMBIENTE Y LUGAR DE TRABAJO
        AccidentCauseGroup group2 = new AccidentCauseGroup();
        group2.setTitle("Factores Relativos al Ambiente y Lugar de Trabajo");
        group2 = accidentCauseGroupRepository.save(group2);

        AccidentCause cause1 = new AccidentCause();
        cause1.setAccidentCauseGroup(group2);
        cause1.setDescription("falta o Exeso de iluminacion");
        accidentCauseRepository.save(cause1);

        AccidentCause cause2 = new AccidentCause();
        cause2.setAccidentCauseGroup(group2);
        cause2.setDescription("falta o exeso de vaentilacion");
        accidentCauseRepository.save(cause2);

        AccidentCause cause3 = new AccidentCause();
        cause3.setAccidentCauseGroup(group2);
        cause3.setDescription("ventilacion deficiente");
        accidentCauseRepository.save(cause3);

        AccidentCause cause4 = new AccidentCause();
        cause4.setAccidentCauseGroup(group2);
        cause4.setDescription("tarea con sobrecarga (ritmo monotomia entre otros");
        accidentCauseRepository.save(cause4);

        AccidentCause cause5 = new AccidentCause();
        cause5.setAccidentCauseGroup(group2);
        cause5.setDescription("Falta de comunicacion/Falta de explicacion  de la tarea asignada");
        accidentCauseRepository.save(cause5);

        AccidentCause cause6 = new AccidentCause();
        cause6.setAccidentCauseGroup(group2);
        cause6.setDescription("Falta de orden y limpieza en el puesto de trabajo");
        accidentCauseRepository.save(cause6);

        AccidentCause cause7 = new AccidentCause();
        cause7.setAccidentCauseGroup(group2);
        cause7.setDescription("Supervision inadecuada");
        accidentCauseRepository.save(cause7);

        AccidentCause cause8 = new AccidentCause();
        cause8.setAccidentCauseGroup(group2);
        cause8.setDescription("Abuso y maltrato");
        accidentCauseRepository.save(cause8);

        AccidentCause cause9 = new AccidentCause();
        cause9.setAccidentCauseGroup(group2);
        cause9.setDescription("Otras - Cual?");
        accidentCauseRepository.save(cause9);

        //GRUPO 3 ACCIONES Y CONDICIONES SUBSTANDARES
        AccidentCauseGroup group3 = new AccidentCauseGroup();
        group3.setTitle("Acciones y Condiciones Subestandares");
        group3 = accidentCauseGroupRepository.save(group3);

        AccidentCause cause10 = new AccidentCause();
        cause10.setAccidentCauseGroup(group3);
        cause10.setDescription("Uso de herramientas y Equipos Inadecuados");
        accidentCauseRepository.save(cause10);

        AccidentCause cause11 = new AccidentCause();
        cause11.setAccidentCauseGroup(group3);
        cause11.setDescription("No asegurar el area de trabajo");
        accidentCauseRepository.save(cause11);

        AccidentCause cause12 = new AccidentCause();
        cause12.setAccidentCauseGroup(group3);
        cause12.setDescription("No advertir");
        accidentCauseRepository.save(cause12);

        AccidentCause cause13 = new AccidentCause();
        cause13.setAccidentCauseGroup(group3);
        cause13.setDescription("Exceso de velocidad");
        accidentCauseRepository.save(cause13);

        AccidentCause cause14 = new AccidentCause();
        cause14.setAccidentCauseGroup(group3);
        cause14.setDescription("Exceso de confianza");
        accidentCauseRepository.save(cause14);

        AccidentCause cause15 = new AccidentCause();
        cause15.setAccidentCauseGroup(group3);
        cause15.setDescription("Uso de equipos defectuosos");
        accidentCauseRepository.save(cause15);

        AccidentCause cause16 = new AccidentCause();
        cause16.setAccidentCauseGroup(group3);
        cause16.setDescription("Ubicacion inadecuada de Equipos y herramientas");
        accidentCauseRepository.save(cause16);

        AccidentCause cause17 = new AccidentCause();
        cause17.setAccidentCauseGroup(group3);
        cause17.setDescription("Levantamiento inadecuado");
        accidentCauseRepository.save(cause17);

        AccidentCause cause18 = new AccidentCause();
        cause18.setAccidentCauseGroup(group3);
        cause18.setDescription("Bromas");
        accidentCauseRepository.save(cause18);

        AccidentCause cause37 = new AccidentCause();
        cause37.setAccidentCauseGroup(group3);
        cause37.setDescription("Influencia de bebidas embriagantes");
        accidentCauseRepository.save(cause37);

        AccidentCause cause38 = new AccidentCause();
        cause38.setAccidentCauseGroup(group3);
        cause38.setDescription("Exposicion al Ruido");
        accidentCauseRepository.save(cause38);

        AccidentCause cause39 = new AccidentCause();
        cause39.setAccidentCauseGroup(group3);
        cause39.setDescription("Otras - Cual?");
        accidentCauseRepository.save(cause39);

        //GRUPO 4 TIPOS DE CONTACTO
        AccidentCauseGroup group4 = new AccidentCauseGroup();
        group4.setTitle("Tipo de Contacto");
        group4 = accidentCauseGroupRepository.save(group4);

        AccidentCause cause19 = new AccidentCause();
        cause19.setAccidentCauseGroup(group4);
        cause19.setDescription("Golpeado por...");
        accidentCauseRepository.save(cause19);

        AccidentCause cause20 = new AccidentCause();
        cause20.setAccidentCauseGroup(group4);
        cause20.setDescription("Atrapado en ...");
        accidentCauseRepository.save(cause20);

        AccidentCause cause21 = new AccidentCause();
        cause21.setAccidentCauseGroup(group4);
        cause21.setDescription("Atrapado sobre...");
        accidentCauseRepository.save(cause21);

        AccidentCause cause22 = new AccidentCause();
        cause22.setAccidentCauseGroup(group4);
        cause22.setDescription("Atrapado entre...");
        accidentCauseRepository.save(cause22);

        AccidentCause cause23 = new AccidentCause();
        cause23.setAccidentCauseGroup(group4);
        cause23.setDescription("Resbalon");
        accidentCauseRepository.save(cause23);

        AccidentCause cause24 = new AccidentCause();
        cause24.setAccidentCauseGroup(group4);
        cause24.setDescription("Caida a un distinto nivel");
        accidentCauseRepository.save(cause24);

        AccidentCause cause25 = new AccidentCause();
        cause25.setAccidentCauseGroup(group4);
        cause25.setDescription("Sobreesfuerzo");
        accidentCauseRepository.save(cause25);

        AccidentCause cause26 = new AccidentCause();
        cause26.setAccidentCauseGroup(group4);
        cause26.setDescription("Otras - Cual?");
        accidentCauseRepository.save(cause26);

        AccidentCause cause27 = new AccidentCause();
        cause27.setAccidentCauseGroup(group4);
        cause27.setDescription("");
        accidentCauseRepository.save(cause27);
        // ENAYDA END

        // JUAN START DATA DEFAULT
        //-- Llenar aqui tu data default y usar la data de los demas si tienes dependecia de tus companieros
        // JUAN END

        // FARID START DATA DEFAULT
        //-- Llenar aqui tu data default y usar la data de los demas si tienes dependecia de tus companieros
        TypeEquipment maquinaria= new TypeEquipment();
        maquinaria.setName("Maquinaria");
        maquinaria.setDescriptionTypeEquipment("Maquinarias pesadas y livianas");
        typeEquipmentRepository.save(maquinaria);

        TypeEquipment maquinaria2= new TypeEquipment();
        maquinaria2.setName("Heavy Machinary");
        maquinaria2.setDescriptionTypeEquipment("Heavy Machinary for Operator");
        typeEquipmentRepository.save(maquinaria2);

        TypeEquipment maquinaria3= new TypeEquipment();
        maquinaria3.setName("Light Machinary");
        maquinaria3.setDescriptionTypeEquipment("Light Machinary for Builders");
        typeEquipmentRepository.save(maquinaria3);

        TypeEquipment equipmentsafety= new TypeEquipment();
        equipmentsafety.setName("Light Machinary");
        equipmentsafety.setDescriptionTypeEquipment("Equipment Safety  for Builders");
        typeEquipmentRepository.save(equipmentsafety);

        Equipment mezcladora= new Equipment();
        mezcladora.setName("Mezcladora");
        mezcladora.setBrand("Cat");
        mezcladora.setCode("MZD");
        mezcladora.setStatus("Active");
        mezcladora.setManufactured("Italia");
        mezcladora.setWarranty("4 años");
        mezcladora.setDateofpurchase(new Date(2018, 5, 8));
        mezcladora.setTypeEquipment(maquinaria);
        equipmentRepository.save(mezcladora);

        Equipment helmet= new Equipment();
        helmet.setName("Helmet safety");
        helmet.setBrand("Asia");
        helmet.setCode("ASh6");
        helmet.setStatus("Active");
        helmet.setManufactured("China");
        helmet.setWarranty("1 años");
        helmet.setDateofpurchase(new Date(2017, 4, 3));
        helmet.setTypeEquipment(equipmentsafety);
        equipmentRepository.save(helmet);

        Equipment amoladora= new Equipment();
        amoladora.setName("Amoladora");
        amoladora.setBrand("Trupper");
        amoladora.setCode("Amdr");
        amoladora.setStatus("Inactive");
        amoladora.setManufactured("Francia");
        amoladora.setWarranty("2 años");
        amoladora.setDateofpurchase(new Date(2016, 6, 18));
        amoladora.setTypeEquipment(maquinaria3);
        equipmentRepository.save(amoladora);

        Equipment vibradora= new Equipment();
        vibradora.setName("Vibradora");
        vibradora.setBrand("Skyl");
        vibradora.setCode("Vbdr");
        vibradora.setStatus("Active");
        vibradora.setManufactured("Usa");
        vibradora.setWarranty("3 años");
        vibradora.setDateofpurchase(new Date(2015, 2, 18));
        vibradora.setTypeEquipment(maquinaria2);
        equipmentRepository.save(vibradora);



        Equipment niveladora= new Equipment();
        niveladora.setName("Niveladora");
        niveladora.setBrand("Cat");
        niveladora.setCode("NVD");
        niveladora.setStatus("Inactive");
        niveladora.setManufactured("Alemania");
        niveladora.setWarranty("2 años");
        niveladora.setDateofpurchase(new Date(2018, 5, 20));
        niveladora.setTypeEquipment(maquinaria);
        equipmentRepository.save(niveladora);

        Equipment oxigeno= new Equipment();
        oxigeno.setName("Oxigeno");
        oxigeno.setBrand("Bosch");
        oxigeno.setCode("OXN");
        oxigeno.setStatus("Active");
        oxigeno.setManufactured("Francia");
        oxigeno.setWarranty("4 años");
        oxigeno.setDateofpurchase(new Date(2017, 6, 10));
        oxigeno.setTypeEquipment(maquinaria);
        equipmentRepository.save(oxigeno);

        // FARID END

        // LOURDES START DATA DEFAULT
        Assign_Equipment aeq1 = new Assign_Equipment();
        aeq1.setSupervisor(leo);
        aeq1.setEmployee(jhon);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String assignDate = "2015-05-15";
        String returnDate = "2015-06-20";
        Date dateA = new Date();
        Date dateR = new Date();
        try {
            dateA = sdf.parse(assignDate);
            dateR = sdf.parse(returnDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        aeq1.setDateAssign(dateA);
        aeq1.setDateReturn(dateR);
        aeq1.setDescription("Devuelto en buen estado");
        aeq1.setStatusEmployee(1);
        this.assignEquipmentRepository.save(aeq1);

        Assign_Equipment aeq2 = new Assign_Equipment();
        aeq2.setSupervisor(micaela);
        aeq2.setEmployee(diana);
        String assignDate2 = "2015-05-30";
        String returnDate2 = "2015-06-30";
        Date dateA2 = new Date();
        Date dateR2 = new Date();
        try {
            dateA2 = sdf.parse(assignDate2);
            dateR2 = sdf.parse(returnDate2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        aeq2.setDateAssign(dateA2);
        aeq2.setDateReturn(dateR2);
        aeq2.setDescription("Herramienta devuelta con fallas");
        aeq2.setStatusEmployee(1);
        this.assignEquipmentRepository.save(aeq2);

        Assign_Equipment aeq3 = new Assign_Equipment();
        aeq3.setSupervisor(paola);
        aeq3.setEmployee(jhon);
        String assignDate3 = "2016-05-30";
        String returnDate3 = "2016-06-30";
        Date dateA3 = new Date();
        Date dateR3 = new Date();
        try {
            dateA3 = sdf.parse(assignDate3);
            dateR3 = sdf.parse(returnDate3);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        aeq3.setDateAssign(dateA3);
        aeq3.setDateReturn(dateR3);
        aeq3.setDescription("Equipo necesita mantenimiento");
        aeq3.setStatusEmployee(1);
        this.assignEquipmentRepository.save(aeq3);


        Detail_Assign_Equipment daeq1 = new Detail_Assign_Equipment();
        daeq1.setAssignEquipment(aeq1);
        daeq1.setEquipment(mezcladora);
        this.detailAssignEquipmentRepository.save(daeq1);

        Detail_Assign_Equipment daeq2 = new Detail_Assign_Equipment();
        daeq2.setAssignEquipment(aeq1);
        daeq2.setEquipment(niveladora);
        this.detailAssignEquipmentRepository.save(daeq2);

        Detail_Assign_Equipment daeq3 = new Detail_Assign_Equipment();
        daeq3.setAssignEquipment(aeq2);
        daeq3.setEquipment(mezcladora);
        this.detailAssignEquipmentRepository.save(daeq3);

        Detail_Assign_Equipment daeq4 = new Detail_Assign_Equipment();
        daeq4.setAssignEquipment(aeq3);
        daeq4.setEquipment(niveladora);
        this.detailAssignEquipmentRepository.save(daeq4);

        Detail_Assign_Equipment daeq5 = new Detail_Assign_Equipment();
        daeq5.setAssignEquipment(aeq3);
        daeq5.setEquipment(oxigeno);
        this.detailAssignEquipmentRepository.save(daeq5);

        Detail_Assign_Equipment daeq6 = new Detail_Assign_Equipment();
        daeq6.setAssignEquipment(aeq2);
        daeq6.setEquipment(niveladora);
        this.detailAssignEquipmentRepository.save(daeq6);

        Detail_Assign_Equipment daeq7 = new Detail_Assign_Equipment();
        daeq7.setAssignEquipment(aeq3);
        daeq7.setEquipment(amoladora);
        this.detailAssignEquipmentRepository.save(daeq7);

        Position_Equipment peq1 = new Position_Equipment();
        peq1.setPosition(position4);
        peq1.setEquipment(mezcladora);
        this.positionEquipmentRepository.save(peq1);

        Position_Equipment peq2 = new Position_Equipment();
        peq2.setPosition(position4);
        peq2.setEquipment(niveladora);
        this.positionEquipmentRepository.save(peq2);

        Position_Equipment peq3 = new Position_Equipment();
        peq3.setPosition(position2);
        peq3.setEquipment(helmet);
        this.positionEquipmentRepository.save(peq3);

        Position_Equipment peq4 = new Position_Equipment();
        peq4.setPosition(position1);
        peq4.setEquipment(helmet);
        this.positionEquipmentRepository.save(peq4);

        Position_Equipment peq5 = new Position_Equipment();
        peq5.setPosition(position1);
        peq5.setEquipment(oxigeno);
        this.positionEquipmentRepository.save(peq5);

        // LOURDES END

        */


    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent){
        initData();
    }
}
