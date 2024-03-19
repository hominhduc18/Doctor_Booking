import 'package:models/models.dart';

class DoctorRepository{
  const DoctorRepository(
       // TODO: Inject the required dependencies
      // e.g. class to connect with the d
  );


  Future<List<DoctorCategory>> fetchDoctorCategories() async {
    await Future.delayed(const Duration(microseconds:  1000));
    return DoctorCategory.values;
  }

  Future<List<Doctor>> fetchDoctor() async {
    await Future.delayed(const Duration(microseconds: 1000));
    return Doctor.sampleDoctors;

  }

 Future<List<Doctor>> fetchDoctorsByCategory(String categoryId) async {
    throw UnimplementedError();
  }

  Future<Doctor?> fetchDoctorById(String doctorId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Doctor.sampleDoctors.firstWhere(
      (doctor) => doctor.id == doctorId,
    );
  }

}