import 'package:bloc/bloc.dart';
import 'package:doctorbooking/repositories/doctor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

part 'doctor_details_event.dart';
part 'doctor_details_state.dart';

class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailState> {
  final DoctorRepository _doctorRepository;

  DoctorDetailsBloc({required DoctorRepository doctorRepository}): _doctorRepository = doctorRepository,
  super(const DoctorDetailState()){
    on<LoadDoctorDetailsEvent> (_onLoadDoctorDetails);
  }
  
  Future<void> _onLoadDoctorDetails(
    LoadDoctorDetailsEvent event,
    Emitter<DoctorDetailState> emit,
  )async{
    emit(state.copyWith(
      status: DoctorDetailStatus.loading
    ));

    try{
      final doctor =  await _doctorRepository.fetchDoctorById(event.doctorId);
       if (doctor == null) {
        emit(state.copyWith(status: DoctorDetailStatus.error));
      } else {
        emit(
          state.copyWith(
            status: DoctorDetailStatus.loaded,
            doctor: doctor,
          ),
        );
      }


    }catch (e){

      emit(state.copyWith(
        status: DoctorDetailStatus.error
      ));

    }
  }
}
