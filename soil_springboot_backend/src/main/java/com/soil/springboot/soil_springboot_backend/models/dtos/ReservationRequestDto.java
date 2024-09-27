package com.soil.springboot.soil_springboot_backend.models.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationRequestDto {

    private int workspaceId;
    private LocalDateTime dateTimeFrom;
    private LocalDateTime dateTimeTo;
}

