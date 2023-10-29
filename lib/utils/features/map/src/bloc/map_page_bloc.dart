import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/utils/data/svg_reader/domain.dart';
import 'package:interactive_svg/utils/utils.dart';

part 'map_page_event.dart';
part 'map_page_state.dart';

extension BlocExt on BuildContext {
  MapPageBloc get mapPageBloc => read<MapPageBloc>();
}

extension MapPageBlocExt on MapPageBloc {
  void init() => add(GetSvgEvent());

  void onRegionSelected(Region country) => add(RegionSelectedEvent(country));
}

class MapPageBloc extends Bloc<MapPageEvent, MapPageState> {
  MapPageBloc() : super(MapPageState.init()) {
    on<GetSvgEvent>(_onGetSvgEvent);
    on<RegionSelectedEvent>(_onRegionSelectedEvent);
  }

  FutureOr<void> _onGetSvgEvent(GetSvgEvent event, Emitter emit) async {
    await Utils.loadSvgImage(svgImage: 'assets/map.svg').then((data) {
      emit(state.copyWith(regiones: data, status: MapPageStatus.success));
    });
  }

  FutureOr<void> _onRegionSelectedEvent(RegionSelectedEvent event, Emitter emit) async {
    emit(state.copyWith(currentRegion: event.region, status: MapPageStatus.success));
  }
}
