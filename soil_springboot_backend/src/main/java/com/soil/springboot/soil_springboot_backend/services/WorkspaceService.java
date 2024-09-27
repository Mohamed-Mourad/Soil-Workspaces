package com.soil.springboot.soil_springboot_backend.services;

import com.soil.springboot.soil_springboot_backend.models.dtos.ReservationConfirmationDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.ReservationRequestDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.WorkspaceDto;
import com.soil.springboot.soil_springboot_backend.models.entities.SlotEntity;
import com.soil.springboot.soil_springboot_backend.models.entities.WorkspaceEntity;
import com.soil.springboot.soil_springboot_backend.repos.SlotRepo;
import com.soil.springboot.soil_springboot_backend.repos.WorkspaceRepo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class WorkspaceService {

    private final WorkspaceRepo workspaceRepository;
    private final SlotRepo slotRepository;

    public WorkspaceService(WorkspaceRepo workspaceRepository, SlotRepo slotRepository) {
        this.workspaceRepository = workspaceRepository;
        this.slotRepository = slotRepository;
    }

    @Transactional
    public ReservationConfirmationDto reserveWorkspace(ReservationRequestDto reservationRequestDto) {
        List<SlotEntity> reservedSlots = new ArrayList<>();
        LocalDateTime start = reservationRequestDto.getDateTimeFrom();
        LocalDateTime end = reservationRequestDto.getDateTimeTo();

        // Fetch the workspace
        WorkspaceEntity workspace = workspaceRepository.findById(reservationRequestDto.getWorkspaceId())
                .orElseThrow(() -> new RuntimeException("Workspace not found"));

        // Loop through each one-hour slot between start and end times
        while (!start.isEqual(end)) {
            LocalDateTime nextHour = start.plusHours(1);

            // Check if the slot exists and is available
            LocalDateTime finalStart = start;
            SlotEntity slot = slotRepository.findByWorkspaceIdAndDateTimeFrom(workspace.getId(), start)
                    .orElseThrow(() -> new RuntimeException("Slot unavailable for time: " + finalStart));

            if (slot.isReserved()) {
                throw new RuntimeException("One of the slots is already reserved for time: " + start);
            }

            // Mark the slot as reserved
            slot.setReserved(true);
            slotRepository.save(slot);
            reservedSlots.add(slot);

            // Move to the next slot
            start = nextHour;
        }

        // Return reservation confirmation
        return new ReservationConfirmationDto(reservedSlots);
    }

    public List<WorkspaceDto> getAllWorkspaces() {
        List<WorkspaceEntity> workspaces = workspaceRepository.findAll();
        List<WorkspaceDto> workspaceDtos = new ArrayList<>();
        for (WorkspaceEntity workspace : workspaces) {
            workspaceDtos.add(WorkspaceDto.fromEntity(workspace));
        }
        return workspaceDtos;
    }
}

