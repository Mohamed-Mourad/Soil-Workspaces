package com.soil.springboot.soil_springboot_backend.models.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "workspaces")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WorkspaceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String location;
    private int capacity;

    @Column(columnDefinition = "LONGTEXT")
    private String images;

    @OneToOne(mappedBy = "workspace", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private AmenitiesEntity amenities;
}

