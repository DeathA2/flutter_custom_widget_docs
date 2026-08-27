// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class NetworkImageViewDocWidget implements Documentation {
  @override
  String get name => 'NetworkImageView';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'url', isRequired: true, isNamed: false, type: 'String?'),
    PropertyDoc(
      name: 'fit',
      isRequired: false,
      isNamed: true,
      type: 'BoxFit',
      defaultValue: 'BoxFit.cover',
    ),
    PropertyDoc(
      name: 'width',
      isRequired: false,
      isNamed: true,
      type: 'double?',
    ),
    PropertyDoc(
      name: 'height',
      isRequired: false,
      isNamed: true,
      type: 'double?',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '0: 0.0',
    ),
    PropertyDoc(
      name: 'placeholderColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral100',
    ),
    PropertyDoc(
      name: 'semanticLabel',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Network image with a placeholder, a fade-in and an error state.
@docWidget
class NetworkImageView extends StatelessWidget {
  const NetworkImageView(
    this.url, {
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.radius = 0,
    this.placeholderColor = CustomColors.neutral100,
    this.semanticLabel,
    super.key,
  });

  final String? url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double radius;
  final Color placeholderColor;
  final String? semanticLabel;

  Widget _box({Widget? child}) => Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    color: placeholderColor,
    child: child,
  );

  @override
  Widget build(BuildContext context) {
    final String? url = this.url;

    Widget content;
    if (url == null || url.isEmpty) {
      content = _box(
        child: const Icon(
          Icons.image_outlined,
          color: CustomColors.neutral400,
          size: 28,
        ),
      );
    } else {
      content = Image.network(
        url,
        fit: fit,
        width: width,
        height: height,
        semanticLabel: semanticLabel,
        frameBuilder:
            (
              BuildContext context,
              Widget child,
              int? frame,
              bool wasSynchronouslyLoaded,
            ) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                child: child,
              );
            },
        loadingBuilder:
            (BuildContext context, Widget child, ImageChunkEvent? progress) {
              if (progress == null) return child;
              return _box(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: progress.expectedTotalBytes == null
                        ? null
                        : progress.cumulativeBytesLoaded /
                              progress.expectedTotalBytes!,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      CustomColors.neutral400,
                    ),
                  ),
                ),
              );
            },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) =>
                _box(
                  child: const Icon(
                    Icons.broken_image_outlined,
                    color: CustomColors.neutral400,
                    size: 28,
                  ),
                ),
      );
    }

    if (radius <= 0) return content;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: content,
    );
  }
}
''';
}
