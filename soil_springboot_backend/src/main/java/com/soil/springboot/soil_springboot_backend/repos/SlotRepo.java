package com.soil.springboot.soil_springboot_backend.repos;


import com.soil.springboot.soil_springboot_backend.models.entities.SlotEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface SlotRepo extends JpaRepository<SlotEntity, Integer> {
    Optional<SlotEntity> findByWorkspaceIdAndDateTimeFrom(int workspaceId, LocalDateTime dateTimeFrom);
}

