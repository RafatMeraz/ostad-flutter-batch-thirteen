import 'package:flutter/material.dart';

import '../../../../app/asset_paths.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPaths.noImagePng,
    );
  }
}
