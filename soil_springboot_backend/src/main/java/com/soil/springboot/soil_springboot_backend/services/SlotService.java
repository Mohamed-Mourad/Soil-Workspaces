package com.soil.springboot.soil_springboot_backend.services;

import com.soil.springboot.soil_springboot_backend.models.dtos.WorkspaceDto;
import com.soil.springboot.soil_springboot_backend.models.entities.SlotEntity;
import com.soil.springboot.soil_springboot_backend.models.dtos.SlotDto;
import com.soil.springboot.soil_springboot_backend.repos.SlotRepo;
import com.soil.springboot.soil_springboot_backend.repos.WorkspaceRepo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class SlotService {

    private final WorkspaceRepo workspaceRepository;
    private final SlotRepo slotRepository;

    public SlotService(WorkspaceRepo workspaceRepository, SlotRepo slotRepository) {
        this.workspaceRepository = workspaceRepository;
        this.slotRepository = slotRepository;
    }

    public List<SlotDto> getSlotsByWorkspaceId(Integer workspaceId) {
        List<SlotEntity> slots = slotRepository.findAllByWorkspaceId(workspaceId);
        List<SlotDto> slotDtos = new ArrayList<>();
        for (SlotEntity slot : slots) {
            slotDtos.add(SlotDto.fromEntity(slot));
        }
        return slotDtos;
    }
}
