import 'package:flutter/services.dart';
import 'package:interactive_svg/utils/data/svg_reader/domain.dart';
import 'package:xml/xml.dart';

class Utils {
  static Future<List<Region>> loadSvgImage({required String svgImage}) async {
    List<Region> maps = [];
    String generalString = await rootBundle.loadString(svgImage);

    XmlDocument document = XmlDocument.parse(generalString);

    final paths = document.findAllElements('path');

    for (var element in paths) {
      String partId = element.getAttribute('id').toString();
      String partPath = element.getAttribute('d').toString();
      String zone = element.getAttribute('zone').toString();
      String color = element.getAttribute('color')?.toString().replaceAll('#', 'FF') ?? 'D7D3D2';

      maps.add(Region(id: partId, path: partPath, color: color, zone: zone));
    }

    return maps;
  }
}
