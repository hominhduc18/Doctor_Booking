import 'package:doctorbooking/shared/theme/widgets/bottom_nav_bars/main_nav_bar.dart';
import 'package:doctorbooking/shared/theme/widgets/card/appointment_preview_card.dart';
import 'package:doctorbooking/shared/theme/widgets/list_tiles/doctor_list_title.dart';
import 'package:doctorbooking/state/home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:doctorbooking/shared/theme/widgets/avatar/circle_avatar_with_text_label.dart';
import 'package:doctorbooking/shared/theme/widgets/titles/section_title.dart';
import 'package:flutter/material.dart';

@override
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget build(BuildContext context) {
    // create a bloc and provide it to the Home View
    return const HomeView();
  }
}

// ignore: non_constant_identifier_names
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    // Create the HomeView Ui
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 4.0),
            Text(
              'Massimo',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: colorTheme.secondary,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'HCM, VN',
                  style: textTheme.bodySmall!.copyWith(
                    color: colorTheme.secondary,
                  ),
                ),
                const SizedBox(height: 4.0),
                Icon(
                  Icons.expand_more,
                  color: colorTheme.secondary,
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8.0),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search for doctors...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: colorTheme.onSurfaceVariant,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(Icons.filter_alt_outlined,
                          color: colorTheme.onSurfaceVariant)),
                ),
              ),
            )),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == HomeStatus.loaded) {
            return const SingleChildScrollView(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _DoctorCategory(),
                  SizedBox(height: 16.0),
                  _MySchedule(),
                  SizedBox(height: 16.0),
                  _NearByDoctors(),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Error Loading Data'));
          }
        },
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _NearByDoctors extends StatelessWidget {
  const _NearByDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Nearby Doctor',
              action: 'See All',
              onPressed: () {},
            ),
            const SizedBox(height: 8.0),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  height: 24.0,
                  color: colorScheme.surfaceVariant,
                );
              },
              itemCount: Doctor.sampleDoctors.length,
              itemBuilder: (context, index) {
                final doctor = Doctor.sampleDoctors[index];
                return DoctorListTile(doctor: doctor);
              },
            )
          ],
        );
      },
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(children: [
          SectionTitle(
            title: 'My Schedule',
            action: 'See All',
            onPressed: () {},
          ),
           AppointmentPreviewCard(appointment: state.myAppointments.firstOrNull)
        ]);
      },
    );
  }
}

class _DoctorCategory extends StatelessWidget {
  const _DoctorCategory();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Categories',
              action: 'See All',
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: DoctorCategory.values
                  // Take 5 could be added in the bloc calculation
                  .take(5)
                  .map(
                    (category) => Expanded(
                      child: CircleAvatarWithTextLabel(
                        icon: category.icon,
                        label: category.name,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
