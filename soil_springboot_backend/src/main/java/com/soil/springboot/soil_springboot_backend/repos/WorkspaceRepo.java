package com.soil.springboot.soil_springboot_backend.repos;

import com.soil.springboot.soil_springboot_backend.models.entities.WorkspaceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface WorkspaceRepo extends JpaRepository<WorkspaceEntity, Integer> {

}
