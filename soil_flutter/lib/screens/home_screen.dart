import 'package:flutter/material.dart';
import 'package:soil_flutter/models/amenities_model.dart';
import 'package:soil_flutter/models/workspace_model.dart';
import 'package:soil_flutter/widgets/item_separator.dart';
import 'package:soil_flutter/widgets/workspace_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Mock Data for Workspaces
  List<Workspace> _getMockWorkspaces() {
    return List.generate(10, (index) {
      return Workspace(
        name: 'Workspace $index',
        images: [
          'https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg',
          'https://images.inc.com/uploaded_files/image/1920x1080/getty_517610514_353435.jpg',
          'https://imageio.forbes.com/blogs-images/davidburkus/files/2016/06/space-desk-workspace-coworking-1200x795.jpg?height=471&width=711&fit=bounds',
        ],
        location: 'Location $index',
        amenities: Amenities(
          wifi: index % 2 == 0,
          projector: index % 3 == 0,
          capacity: 5 + index,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Workspace> workspaces = _getMockWorkspaces();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: workspaces.length,
        itemBuilder: (context, index) {
          final workspace = workspaces[index];
          return WorkspaceCard(workspace: workspace);
        },
        separatorBuilder: (context, index) {
          return const ItemSeparator();
        },
      ),
    );
  }
}
