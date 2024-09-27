package com.soil.springboot.soil_springboot_backend.controllers;

import com.soil.springboot.soil_springboot_backend.models.dtos.ReservationRequestDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.ReservationConfirmationDto;
import com.soil.springboot.soil_springboot_backend.services.WorkspaceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/workspaces")
public class WorkspaceController {

    private final WorkspaceService workspaceService;

    public WorkspaceController(WorkspaceService workspaceService) {
        this.workspaceService = workspaceService;
    }

    @PostMapping("/book")
    public ResponseEntity<ReservationConfirmationDto> bookWorkspace(@RequestBody ReservationRequestDto bookingRequestDto) {
        ReservationConfirmationDto confirmation = workspaceService.bookWorkspace(bookingRequestDto);
        return ResponseEntity.ok(confirmation);
    }
}

