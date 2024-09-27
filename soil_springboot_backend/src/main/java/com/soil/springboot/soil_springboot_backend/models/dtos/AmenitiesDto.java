package com.soil.springboot.soil_springboot_backend.models.dtos;

import com.soil.springboot.soil_springboot_backend.models.entities.AmenitiesEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AmenitiesDto {

    private boolean wifi;
    private boolean projector;

    public static AmenitiesDto fromEntity(AmenitiesEntity amenitiesEntity) {
        return new AmenitiesDto(
                amenitiesEntity.isWifi(),
                amenitiesEntity.isProjector()
        );
    }
}

