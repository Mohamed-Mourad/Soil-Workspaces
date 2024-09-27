package com.soil.springboot.soil_springboot_backend.models.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Table(name = "amenities")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AmenitiesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "wifi")
    private boolean wifi;

    @Column(name = "projector")
    private boolean projector;

    @OneToOne
    @JoinColumn(name = "workspace_id", referencedColumnName = "id")
    private WorkspaceEntity workspace;
}
