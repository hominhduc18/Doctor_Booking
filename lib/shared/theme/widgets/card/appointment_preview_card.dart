import 'package:flutter/material.dart';

class AppointmentPreviewCard extends StatelessWidget {
  const AppointmentPreviewCard({super.key, required this.appointment});

  final dynamic appointment;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
               colors: [
                Colors.black,
                Colors.green,
               ],
            )

          ),

          child: Column(
            children: [
              SizedBox(height: 100, child: Center(
                child: Text(
                  'No appointment yet',
                   style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                )
              )
              ), 
            ]
          ),

        ),
        Container(
          height: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.25),
            borderRadius: BorderRadius.vertical(
              bottom:  const Radius.circular(8.0)
            )
          ),
        ),
         Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.15),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(8.0),
            ),
          ),
        ), Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          decoration: BoxDecoration(
            color: colorScheme.primary.withOpacity(0.15),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}