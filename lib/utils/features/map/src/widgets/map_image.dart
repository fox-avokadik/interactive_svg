import 'package:flutter/material.dart';
import 'package:interactive_svg/utils/data/svg_reader/domain.dart';
import 'package:interactive_svg/utils/features/map/src/bloc/map_page_bloc.dart';

import '../../widgets.dart';

class MapImage extends StatelessWidget {
  final List<Region> regiones;
  final Region? currentRegion;

  const MapImage({
    super.key,
    required this.regiones,
    this.currentRegion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InteractiveViewer(
            maxScale: 5,
            minScale: 0.1,
            child: Stack(children: _buildClippedImage(context)),
          ),
        ),
        SafeArea(
          child: Text(
            currentRegion?.zone ?? '',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildClippedImage(BuildContext context) {
    final List<Widget> regionesFromSvg = [];

    for (var region in regiones) {
      double opacity = 1.0;

      if (currentRegion != null) {
        opacity = currentRegion?.id == region.id ? opacity : 0.3;
      }

      final color =	Color(int.parse(region.color, radix: 16)).withOpacity(opacity);

      final regionFromSvg = ClipPath(
        clipper: Clipper(svgPath: region.path),
        child: GestureDetector(
          onTap: () => context.mapPageBloc.onRegionSelected(region),
          child: Container(color: color),
        ),
      );

      regionesFromSvg.add(regionFromSvg);
    }

    return regionesFromSvg;
  }
}
