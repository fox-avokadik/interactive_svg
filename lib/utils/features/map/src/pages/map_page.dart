import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/utils/core/commons/widgets.dart';
import 'package:interactive_svg/utils/features/map/bloc.dart';
import 'package:interactive_svg/utils/features/map/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapPageBloc>()..init();

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
