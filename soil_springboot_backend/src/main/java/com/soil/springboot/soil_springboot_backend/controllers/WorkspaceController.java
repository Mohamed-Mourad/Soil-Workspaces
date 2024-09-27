package com.soil.springboot.soil_springboot_backend.controllers;

import com.soil.springboot.soil_springboot_backend.models.dtos.ReservationRequestDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.ReservationConfirmationDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.SlotDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.WorkspaceDto;
import com.soil.springboot.soil_springboot_backend.services.WorkspaceService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/workspaces")
public class WorkspaceController {

    private final WorkspaceService workspaceService;

    public WorkspaceController(WorkspaceService workspaceService) {
        this.workspaceService = workspaceService;
    }

    @PostMapping("/reserve")
    public ResponseEntity<?> reserveWorkspace(@RequestBody ReservationRequestDto reservationRequestDto) {
        try {
            ReservationConfirmationDto confirmation = workspaceService.reserveWorkspace(reservationRequestDto);
            return ResponseEntity.ok(confirmation);
        } catch(RuntimeException e) {
            String message = e.getMessage();
            HttpStatus status = HttpStatus.BAD_REQUEST;

            // Check the message for specific error types
            if (message.equals("Workspace not found")) {
                status = HttpStatus.NOT_FOUND; // 404 Not Found for workspace
            } else if (message.startsWith("Slot already booked")) {
                status = HttpStatus.CONFLICT; // 409 Conflict for reservation issue
            }

            return ResponseEntity.status(status).body(message);
        }
    }


    @GetMapping()
    public ResponseEntity<List<WorkspaceDto>> getAllWorkspaces() {
        List<WorkspaceDto> workspaces = workspaceService.getAllWorkspaces();
        return ResponseEntity.ok(workspaces);
    }
}

