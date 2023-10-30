import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/utils/core/commons/widgets.dart';
import 'package:interactive_svg/utils/features/map/bloc.dart';
import 'package:interactive_svg/utils/features/map/widgets.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    context.mapPageBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Page')),
      body: BlocBuilder<MapPageBloc, MapPageState>(
        builder: (_, state) {
          if (state.status == MapPageStatus.loading) {
            return const LoadingWidget();
          }

          if (state.status == MapPageStatus.error) {
            return const InformationMessage(message: 'Oops! Somesing went wrong!');
          }

          if (state.status == MapPageStatus.success) {
            return MapImage(
              regiones: state.regiones,
              currentRegion: state.currentRegion,
              onRegionSelected: (country) => bloc.onRegionSelected(country),
            );
          }

          return Container();
        },
      ),
    );
  }
}
