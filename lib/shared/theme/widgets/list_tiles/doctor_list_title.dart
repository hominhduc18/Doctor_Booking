import 'package:doctorbooking/screens/doctor_detail_sceen.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
class DoctorListTile extends StatelessWidget {
  const DoctorListTile({
    super.key,
    required this.doctor,
    }
  );

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context){
              return DoctorDetailsScreen(doctorId: doctor.id);
            }
            )
          );
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: colorScheme.background,
        backgroundImage: NetworkImage(doctor.profileImageUrl),
        ),
        title: Text(
          doctor.name,
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.0,),
            Text(
              doctor.category.name,
              style: textTheme.bodyMedium!.copyWith(color: colorScheme.secondary),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange[200],size: 16),
                SizedBox(width: 4.0),
                Text(
                  doctor.rating.toString(),
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.onBackground.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16.0),
                Icon(Icons.work, color: colorScheme.tertiary, size: 16),
                SizedBox(width: 4.0),
                Text(
                  '3 years',
                  style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.onBackground.withOpacity(.5),
                    fontWeight: FontWeight.bold,
                  ),
                  
                )

              ],
            )

          ],
        ),

      trailing: FilledButton(
        onPressed: (){},
         child: const Text('Book Now')
         ),
      
      
    );
  }
}