import 'package:doctor_app/pages/home/widget/diseuse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SpecialistDoctors extends StatefulWidget {
  const SpecialistDoctors({super.key});

  @override
  State<SpecialistDoctors> createState() => _SpecialistDoctorsState();
}

class _SpecialistDoctorsState extends State<SpecialistDoctors> {
  List<String> specialist = [
    'Brain',
    'Kedny',
    'Fegeotherapy',
    'Eye',
    'Bone',
    'Medicine',
    'Hair',
    'Skin',
    'Gainy',
    'Nose',
    'Skin',
    'Neurology',
    'Dentence',
    'Hart',
    'Blood',
    'Medicine',
    'Brain',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specialist doctors'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          axisDirection: AxisDirection.down,
          children: List.generate(
            specialist.length,
            (index) => DiseuseWidget(title: specialist[index], index: index),
          ),
        ),
      ),
    );
  }
}
