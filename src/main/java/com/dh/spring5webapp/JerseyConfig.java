package com.dh.spring5webapp;

import com.dh.spring5webapp.controller.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.ext.ContextResolver;
import javax.ws.rs.ext.Provider;
import java.io.IOException;

@Component
@ApplicationPath("/")
public class JerseyConfig extends ResourceConfig {

    @Autowired
    public JerseyConfig(ObjectMapper objectMapper) {
        //packages("com.dh.spring5webapp.controller");
        register(new ObjectMapperContextResolver(objectMapper));
        register(MultiPartFeature.class);
        register(new CorsFilter());
        register(AccidentCauseController.class);
        register(AccidentCauseGroupController.class);
        register(AccidentCausesController.class);
        register(AccidentController.class);
        register(AccidentTypeController.class);
        register(AreaController.class);
        register(AssignEquipmentController.class);
        register(AuditHistoryController.class);
        register(CorrectiveMeasuresController.class);
        register(DetailAssignEquipmentController.class);
        register(DWAccidentController.class);
        register(EmployeeAccidentController.class);
        register(EmployeeController.class);
        register(EquipmentController.class);
        register(IndexController.class);
        register(PerformanceController.class);
        register(PositionAssignEmployeeController.class);
        register(PositionController.class);
        register(PositionEquipmentController.class);
        register(PositionEvaluationMetricController.class);
        register(PositionRecruitmentProfileController.class);
        register(PositionTypeEvaluatorController.class);
        register(ProjectController.class);
        register(RoleController.class);
        register(TypeEquipmentController.class);
        register(UserController.class);
    }

    @Provider
    public static class ObjectMapperContextResolver implements ContextResolver<ObjectMapper> {
        private final ObjectMapper mapper;

        public ObjectMapperContextResolver(ObjectMapper mapper) {
            this.mapper = mapper;
        }

        @Override
        public ObjectMapper getContext(Class<?> type) {
            return mapper;
        }
    }

    @Provider
    public class CorsFilter implements ContainerResponseFilter {
        @Override
        public void filter(ContainerRequestContext requestContext,
                           ContainerResponseContext responseContext) throws IOException {
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Origin", "*");
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Credentials", "true");
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Headers",
                    "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Methods",
                    "GET, POST, PUT, DELETE, OPTIONS, HEAD");
        }
    }

}
