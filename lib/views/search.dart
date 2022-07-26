import 'package:doctor_consultation/helpers/colors.dart';
import 'package:doctor_consultation/providers/theme_provider.dart';
import 'package:doctor_consultation/widgets/consultation_card.dart';
import 'package:doctor_consultation/widgets/doctor_card.dart';
import 'package:doctor_consultation/widgets/specialist_card.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/models/doctor.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  final String specialist;
  const Search(this.specialist);

  @override
  Widget build(BuildContext context) {
    if (this.specialist == 'View all') {
      String specialist = this.specialist;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 61, 139, 253),
          title: Text(specialist),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 40),
              itemCount: doctorList.length,
              itemBuilder: (BuildContext ctx, index) {
                if (index >= 0) {
                  index++;
                }
                if (index == doctorList.length) {
                  return SizedBox(height: 0);
                }
                var doctor = doctorList[index];
                return Container(
                  alignment: Alignment.center,
                  child: DoctorCard(doctor: doctor),
                );
              }),
        ),
      );
    }
    String specialist = this.specialist;
    specialist = specialist.replaceAll("\n", " ");

    List<Doctor> doctorListFiltered = [];
    for (var i = 0; i < doctorList.length; i++) {
      if (doctorList[i].category == specialist) {
        doctorListFiltered.add(doctorList[i]);
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 61, 139, 253),
        title: Text(specialist),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 3,
                mainAxisSpacing: 40),
            itemCount: doctorListFiltered.length,
            itemBuilder: (BuildContext ctx, index) {
              var doctor = doctorListFiltered[index];
              return Container(
                alignment: Alignment.center,
                child: DoctorCard(doctor: doctor),
              );
            }),
      ),
    );
  }
}

// class Search extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Container example"),
//         ),
//         body: Container(
//           width:  500, 
//           height: 1300, 
//           child: SizedBox(
//             width: double.infinity,
//             height: 200.0,
//             child: ListView.builder(
//               itemCount: doctorList.length,
//               scrollDirection: Axis.horizontal,
//               physics: const ScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   return SizedBox(height: 0); 
//                 }
//                 var doctor = doctorList[index];
//                 return DoctorCard(doctor: doctor);
//               },
//             ),
//           )
//         ),
//       ),
//     );
//   }
// }