package com.soil.springboot.soil_springboot_backend.models.dtos;


import com.soil.springboot.soil_springboot_backend.models.entities.WorkspaceEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkspaceDto {

    private int id;
    private String name;
    private String location;
    private int capacity;
    private List<String> amenities;

    public static WorkspaceDto fromEntity(WorkspaceEntity workspace) {
        return new WorkspaceDto(
                workspace.getId(),
                workspace.getName(),
                workspace.getLocation(),
                workspace.getCapacity(),
                workspace.getAmenities()
        );
    }
}

