package com.soil.springboot.soil_springboot_backend.models.dtos;


import com.soil.springboot.soil_springboot_backend.models.entities.SlotEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SlotDto {

    private int id;
    private WorkspaceDto workspace;
    private LocalDateTime dateTimeFrom;
    private LocalDateTime dateTimeTo;
    private boolean reserved;

    public static SlotDto fromEntity(SlotEntity slot) {
        return new SlotDto(
                slot.getId(),
                WorkspaceDto.fromEntity(slot.getWorkspace()),
                slot.getDateTimeFrom(),
                slot.getDateTimeTo(),
                slot.isReserved()
        );
    }
}

