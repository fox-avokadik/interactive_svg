part of 'map_page_bloc.dart';

enum MapPageStatus { init, loading, success, error }

@immutable
class MapPageState extends Equatable {
  final MapPageStatus status;
  final List<Region> regiones;
  final Region? currentRegion;

  const MapPageState._({
    required this.status,
    required this.regiones,
    this.currentRegion,
  });

  factory MapPageState.init() {
    return const MapPageState._(status: MapPageStatus.init, regiones: []);
  }

  MapPageState copyWith({MapPageStatus? status, List<Region>? regiones, Region? currentRegion}) {
    return MapPageState._(
      status: status ?? this.status,
      regiones: regiones ?? this.regiones,
      currentRegion: currentRegion,
    );
  }

  @override
  List<Object?> get props => [regiones, currentRegion, status];
}
