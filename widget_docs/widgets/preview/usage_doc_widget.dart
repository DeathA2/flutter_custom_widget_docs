import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/images/image_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/utils/logger.dart';
import 'package:flutter_custom_widget_docs/widgets/snackBar/custom_snackbar.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_svg/svg.dart';

class UsageDocWidget extends StatelessWidget {
  const UsageDocWidget({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderTitle(),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsApp.bgBlack, // VSCode dark background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              HighlightView(
                content,
                language: 'dart',
                theme: vs2015Theme,
                padding: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontFamily: 'FiraCode',
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              _renderClipBoard(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderTitle() {
    return Container(
      padding: const EdgeInsets.only(bottom: PaddingApp.p20),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _renderClipBoard(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () async {
          try {
            await Clipboard.setData(ClipboardData(text: content));
            if (!context.mounted) return;
            CustomSnackBar.displaySnackBar(
              context: context,
              message: "Copy To Clipboard",
              marginBottom: 30,
              imagePath: ImagesApp.icSnackbarSuccess,
              duration: const Duration(milliseconds: 500),
            );
          } catch (error) {
            Log.e("Clipboard error $error");
          }
        },
        icon: SvgPicture.asset(ImagesApp.icCopy),
      ),
    );
  }
}
