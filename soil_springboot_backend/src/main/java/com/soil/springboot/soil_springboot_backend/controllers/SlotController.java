package com.soil.springboot.soil_springboot_backend.controllers;

import com.soil.springboot.soil_springboot_backend.models.dtos.SlotDto;
import com.soil.springboot.soil_springboot_backend.models.dtos.WorkspaceDto;
import com.soil.springboot.soil_springboot_backend.services.SlotService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/slots")
public class SlotController {
    private final SlotService slotService;

    public SlotController(SlotService slotService) {
        this.slotService = slotService;
    }

    @GetMapping()
    public ResponseEntity<List<SlotDto>> getSlotsByWorkspaceId(@RequestParam Integer workspaceId) {
        List<SlotDto> slots = slotService.getSlotsByWorkspaceId(workspaceId);
        return ResponseEntity.ok(slots);
    }
}
