import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/images/image_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/strings/string_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/utils/logger.dart';
import 'package:flutter_custom_widget_docs/widgets/snackBar/custom_snackbar.dart';
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
          color: ColorsApp.background,
          padding: const EdgeInsets.all(PaddingApp.p20),
          width: double.infinity,
          child: Stack(
            children: [
              Text(content, textAlign: TextAlign.start),
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
            CustomSnackBar.displaySnackBar(
              context: context,
              message: StringsApp.copyToClipboard,
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
