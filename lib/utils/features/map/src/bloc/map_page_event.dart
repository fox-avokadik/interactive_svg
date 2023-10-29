part of 'map_page_bloc.dart';

@immutable
abstract class MapPageEvent {}

class GetSvgEvent extends MapPageEvent {}

class RegionSelectedEvent extends MapPageEvent {
  final Region region;

  RegionSelectedEvent(this.region);
}
