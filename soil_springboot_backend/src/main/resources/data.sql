INSERT INTO workspaces (name, location, capacity, images)
VALUES ('Branch Zoe', 'Olive Branch', 20,
        'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg - https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg - https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds'
       );

INSERT INTO workspaces (name, location, capacity, images)
VALUES ('Root 007', 'West Root', 35,
        'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg - https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg - https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds'
       );

INSERT INTO workspaces (name, location, capacity, images)
VALUES ('Pot 1', 'Cosed Pots', 10,
        'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg - https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg - https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds'
       );

INSERT INTO workspaces (name, location, capacity, images)
VALUES ('Pot 2', 'Cosed Pots', 15,
        'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg - https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg - https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds'
       );

INSERT INTO workspaces (name, location, capacity, images)
VALUES ('Root 505', 'West Root', 30,
        'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg - https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg - https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds'
       );

INSERT INTO workspaces (name, location, capacity, images)
VALUES ('Branch Sparta', 'Olive Branch', 25,
        'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg - https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg - https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds'
       );


INSERT INTO amenities (wifi, projector, workspace_id) VALUES (true, true, 1);
INSERT INTO amenities (wifi, projector, workspace_id) VALUES (true, false, 2);
INSERT INTO amenities (wifi, projector, workspace_id) VALUES (false, true, 3);
INSERT INTO amenities (wifi, projector, workspace_id) VALUES (false, false, 4);
INSERT INTO amenities (wifi, projector, workspace_id) VALUES (true, true, 5);
INSERT INTO amenities (wifi, projector, workspace_id) VALUES (true, false, 6);


INSERT INTO slots (workspace_id, date_time_from, date_time_to, reserved)
VALUES (1, '2024-09-28 10:00:00', '2024-09-28 11:00:00', false);
INSERT INTO slots (workspace_id, date_time_from, date_time_to, reserved)
VALUES (1, '2024-09-28 11:00:00', '2024-09-28 12:00:00', true);
INSERT INTO slots (workspace_id, date_time_from, date_time_to, reserved)
VALUES (1, '2024-09-28 12:00:00', '2024-09-28 13:00:00', true);
INSERT INTO slots (workspace_id, date_time_from, date_time_to, reserved)
VALUES (1, '2024-09-28 13:00:00', '2024-09-28 14:00:00', false);