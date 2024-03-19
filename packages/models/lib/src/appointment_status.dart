
import 'package:flutter/material.dart';

enum AppointmentStatus{
  pending(name: "pending", icon: Icons.pending),
  accepted(name: 'Accepted', icon: Icons.check),
  rejected(name: 'Rejected', icon: Icons.close),
  completed(name: 'Completed', icon: Icons.verified),
  cancelled(name: 'Cancelled', icon: Icons.cancel);

  final String name;
  final IconData icon;

   const AppointmentStatus({
    required this.name,
    required this.icon,
  });
  
}