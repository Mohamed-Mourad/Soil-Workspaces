import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:soil_flutter/models/workspace_model.dart';
import 'package:soil_flutter/widgets/default_button.dart';

class WorkspaceCard extends StatefulWidget {
  const WorkspaceCard({
    super.key,
    required this.workspace,
  });

  final Workspace workspace;

  @override
  State<WorkspaceCard> createState() => _WorkspaceCardState();
}

class _WorkspaceCardState extends State<WorkspaceCard> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
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
                        controller: _pageController,
                        itemCount: widget.workspace.images.length,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.workspace.images[index],
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
                        controller: _pageController,
                        count: widget.workspace.images.length,
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
                      widget.workspace.name,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.workspace.amenities.capacity.toString(),
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 16.0,
                      ),
                    ),
                    const Icon(Icons.person_2_rounded),
                    const SizedBox(width: 8.0),
                    if (widget.workspace.amenities.wifi)
                      const Icon(Icons.wifi),
                    if (widget.workspace.amenities.wifi)
                      const SizedBox(width: 8.0),
                    if (widget.workspace.amenities.projector)
                      const Icon(Icons.screenshot_monitor_rounded),
                  ],
                ),
                const SizedBox(height: 8.0),
                DefaultButton(text: "Reserve now!", function: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
