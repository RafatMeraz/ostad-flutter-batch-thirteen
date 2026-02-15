import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/asset_paths.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height = 120, this.width = 120});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetPaths.logoSvg, width: width, height: height);
  }
}
