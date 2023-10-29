import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/utils/features/map/bloc.dart';
import 'package:interactive_svg/utils/features/map/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapPageBloc(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: 'Interactive SVG',
        home: const MapPage(),
      ),
    );
  }
}
