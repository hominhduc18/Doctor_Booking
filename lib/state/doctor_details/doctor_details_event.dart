part of 'doctor_details_bloc.dart';

sealed class DoctorDetailsEvent extends Equatable {
  const DoctorDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadDoctorDetailsEvent extends DoctorDetailsEvent{
  final String doctorId;

  const LoadDoctorDetailsEvent({required this.doctorId});


  List<Object> get props => [doctorId];
}
