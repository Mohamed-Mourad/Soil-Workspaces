package com.soil.springboot.soil_springboot_backend.models.dtos;

import com.soil.springboot.soil_springboot_backend.models.entities.SlotEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
public class ReservationConfirmationDto {

    private List<SlotDto> slots;

    public ReservationConfirmationDto(List<SlotEntity> reservedSlots) {
        this.slots = reservedSlots.stream()
                .map(SlotDto::fromEntity)
                .collect(Collectors.toList());
    }
}

