part of 'doctor_details_bloc.dart';


enum DoctorDetailStatus{ initial , loading, loaded, error}
class DoctorDetailState extends Equatable {
  final DoctorDetailStatus status;
  final Doctor? doctor;


  const DoctorDetailState({
    this.status  = DoctorDetailStatus.initial,
     this.doctor
    }
  );
  
  DoctorDetailState copyWith({
    DoctorDetailStatus? status,
    Doctor? doctor,
  }){
    return DoctorDetailState(
      status: status ?? this.status,
      doctor: doctor ?? this.doctor,

    );
  }
  
  @override
  List<Object?> get props => [
    status, doctor,
  ];
}


