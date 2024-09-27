import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soil_flutter/methods/navigations.dart';
import 'package:soil_flutter/models/workspace_model.dart';
import 'package:soil_flutter/screens/reserve_workspace.dart';
import 'package:soil_flutter/widgets/default_button.dart';

class WorkspaceCard extends StatelessWidget {
  final Workspace workspace;

  const WorkspaceCard({
    super.key,
    required this.workspace,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final pageController = PageController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          navigateTo(context, ReserveWorkspaceScreen(workspace: workspace,));
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
            ),
            Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    SizedBox(
                      height: 160.0,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: workspace.images.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            workspace.images[index],
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: workspace.images.length,
                        effect: WormEffect(
                          type: WormType.thin,
                          activeDotColor: colorScheme.primary,
                          dotHeight: 9.0,
                          dotWidth: 9.0,
                          spacing: 4.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      workspace.name,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        height: 0.0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      workspace.capacity.toString(),
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 16.0,
                      ),
                    ),
                    const Icon(Icons.person_2_rounded),
                    const SizedBox(width: 8.0),
                    if (workspace.amenities.wifi)
                      const Icon(Icons.wifi),
                    if (workspace.amenities.wifi)
                      const SizedBox(width: 8.0),
                    if (workspace.amenities.projector)
                      const Icon(Icons.screenshot_monitor_rounded),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      IconlyLight.location,
                      color: colorScheme.onPrimary,
                      size: 16.0,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      workspace.location,
                      style: TextStyle(
                          color: colorScheme.onPrimary,
                          height: 0.0
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                DefaultButton(
                    text: "Reserve now!",
                    function: () {
                      navigateTo(context, ReserveWorkspaceScreen(workspace: workspace,));
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
