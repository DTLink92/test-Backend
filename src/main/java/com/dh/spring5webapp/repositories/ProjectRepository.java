package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Project;
import org.springframework.data.repository.CrudRepository;

public interface ProjectRepository extends CrudRepository<Project, Long> {
}
