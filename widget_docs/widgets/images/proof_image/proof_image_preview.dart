import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/images/proof_image.dart';
import 'package:flutter_custom_widget_docs/widgets/images/proof_image.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = ProofImageDocWidget();

final proofImagePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Proof Image",
  description:
      "Takes either a file path or a URL and opens a zoomable full-screen viewer on tap. `File.existsSync()` is synchronous I/O, so calling it from `build` means touching the disk on every frame of every scrolling row; here it runs once in `initState` and again only when the path actually changes. Photos written by the image picker live in the app cache, which the OS may clear, so \"there was a file\" does not mean \"there still is\" — the placeholder is a normal branch, not a rare error case.",
  dependencies: _documentation.dependencies,
  code: r'''
ProofImage(
  pathOrUrl: 'https://example.com/proof.jpg',
  aspectRatio: 4 / 3,
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProofImage(
            pathOrUrl: 'https://picsum.photos/seed/proof/600/450',
            aspectRatio: 4 / 3,
            tapHint: 'Tap to zoom',
          ),
          const SizedBox(height: 12),
          ProofImage(
            pathOrUrl: '',
            aspectRatio: 4 / 3,
            emptyLabel: 'No proof photo yet',
            onTapWhenMissing: () {},
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'dart:io';

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// Proof photo from the device: checks the file once, remembers the result,
/// and opens a zoomable full-screen viewer on tap.
@docWidget
class ProofImage extends StatefulWidget {
  const ProofImage({
    required this.pathOrUrl,
    this.fit = BoxFit.cover,
    this.aspectRatio = 4 / 3,
    this.radius = 16,
    this.emptyLabel,
    this.tapHint,
    this.onTapWhenMissing,
    this.placeholder,
    super.key,
  });

  final String pathOrUrl;
  final BoxFit fit;

  /// Null lets the image fill the parent box without forcing a ratio.
  final double? aspectRatio;

  final double radius;
  final String? emptyLabel;

  /// When set, shows a "tap to zoom" hint pill in the corner.
  final String? tapHint;

  /// Called when the user taps and there is no file — usually reopens the camera.
  final VoidCallback? onTapWhenMissing;

  final Widget? placeholder;

  @override
  State<ProofImage> createState() => _ProofImageState();
}

class _ProofImageState extends State<ProofImage> {
  String? _resolvedPath;

  @override
  void initState() {
    super.initState();
    _resolve(widget.pathOrUrl);
  }

  @override
  void didUpdateWidget(covariant ProofImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pathOrUrl != widget.pathOrUrl) _resolve(widget.pathOrUrl);
  }

  void _resolve(String pathOrUrl) {
    final bool isFile =
        pathOrUrl.startsWith('/') || pathOrUrl.startsWith('file:');
    final String filePath = pathOrUrl.startsWith('file:')
        ? pathOrUrl.substring(7)
        : pathOrUrl;
    _resolvedPath = isFile && File(filePath).existsSync() ? filePath : null;
  }

  void _openPreview(BuildContext context, String filePath) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Center(
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  child: Image.file(File(filePath), fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  tooltip: 'Close',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: CustomColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? path = _resolvedPath;

    final Widget image = path != null
        ? Image.file(File(path), fit: widget.fit)
        : (widget.placeholder ??
              Container(
                color: CustomColors.neutral100,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.photo_rounded,
                      size: 44,
                      color: CustomColors.brand,
                    ),
                    if (widget.emptyLabel != null) ...<Widget>[
                      const SizedBox(height: 8),
                      Text(
                        widget.emptyLabel!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: CustomColors.neutral700,
                        ),
                      ),
                    ],
                  ],
                ),
              ));

    final Widget clipped = ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: image,
    );

    final Widget content = widget.aspectRatio == null
        ? clipped
        : AspectRatio(aspectRatio: widget.aspectRatio!, child: clipped);

    if (widget.tapHint == null && widget.onTapWhenMissing == null) {
      return content;
    }

    return TouchableOpacity.scale(
      onTap: () {
        if (path != null) {
          _openPreview(context, path);
        } else {
          widget.onTapWhenMissing?.call();
        }
      },
      child: Stack(
        children: <Widget>[
          content,
          if (widget.tapHint != null)
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      Icons.zoom_in_rounded,
                      size: 14,
                      color: CustomColors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.tapHint!,
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
  ''',
);
