package com.soil.springboot.soil_springboot_backend.models.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "slots")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SlotEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "workspace_id")
    private WorkspaceEntity workspace;

    @Column(name = "date_time_from")
    private LocalDateTime dateTimeFrom;

    @Column(name = "date_time_to")
    private LocalDateTime dateTimeTo;

    private boolean reserved;
}

