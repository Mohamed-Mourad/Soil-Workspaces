import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:soil_flutter/widgets/default_button.dart';
import 'package:soil_flutter/widgets/item_separator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            Container(
              width: double.infinity,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 160.0,
                  width: double.infinity,
                  child: Image(
                      image: NetworkImage(
                        "https://st4.depositphotos.com/2673929/24977/i/450/depositphotos_249777954-stock-photo-loft-gray-open-space-office.jpg",
                      ),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 8.0,),
                Row(
                  children: [
                    Text(
                      "Olive Branch",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "12",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontSize: 16.0,
                      ),
                    ),
                    Icon(Icons.person_2_rounded),
                    SizedBox(width: 8.0,),
                    Icon(Icons.wifi),
                    SizedBox(width: 8.0,),
                    Icon(Icons.screenshot_monitor_rounded),
                  ],
                ),
                const SizedBox(height: 8.0,),
                DefaultButton(text: "Reserve now!", function: (){}),
                ItemSeparator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
