import 'package:doctorbooking/repositories/doctor_repository.dart';
import 'package:doctorbooking/screens/home_screens.dart';
import 'package:doctorbooking/shared/theme/app_theme.dart';
import 'package:doctorbooking/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final doctorRepository = DoctorRepository();
  runApp(AppScreen(doctorRepository: doctorRepository));
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.doctorRepository});

  final DoctorRepository doctorRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
        // Create other instances of repositories to make available to the app
      ],
      child: MultiRepositoryProvider(
          providers: [
            BlocProvider(
            create: (context) => HomeBloc(doctorRepository: doctorRepository)
              ..add(LoadHomeEvent()),
            ),
          ],
          child: const MaterialApp(
            title: 'Flutter Demo',
            // theme: const AppTheme().themeData,
            home: HomeScreen(),
              ),
      ),
    );
  }
}
