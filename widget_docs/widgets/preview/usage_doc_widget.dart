import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/images/image_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/utils/logger.dart';
import 'package:flutter_custom_widget_docs/widgets/snackBar/custom_snackbar.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_highlight_view.dart';

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
            color: Color(0xFFF6F6F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              CustomHighlightView(
                content,
                textStyle: TextStyle(
                  color: Color(0xFF1B2430),
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.25,
                ),
                language: 'dart',
                theme: docsLightTheme,
                padding: const EdgeInsets.only(
                  top: PaddingApp.p6,
                  left: PaddingApp.p6,
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
        icon: SvgPicture.asset(
          ImagesApp.icCopy,
          colorFilter: ColorFilter.mode(Color(0xFF1B2430), BlendMode.srcIn),
        ),
      ),
    );
  }
}

const Map<String, TextStyle> docsLightTheme = {
  'root': TextStyle(
    color: Color(0xff383a42),
    backgroundColor: Color(0xFFF6F6F7),
  ),
  'comment': TextStyle(color: Color(0xffa0a1a7), fontStyle: FontStyle.italic),
  'quote': TextStyle(color: Color(0xffa0a1a7), fontStyle: FontStyle.italic),
  'doctag': TextStyle(color: Color(0xffa626a4)),
  'keyword': TextStyle(color: Color(0xffa626a4)),
  'formula': TextStyle(color: Color(0xffa626a4)),
  'section': TextStyle(color: Color(0xffe45649)),
  'name': TextStyle(color: Color(0xffe45649)),
  'selector-tag': TextStyle(color: Color(0xffe45649)),
  'deletion': TextStyle(color: Color(0xffe45649)),
  'subst': TextStyle(color: Color(0xffe45649)),
  'literal': TextStyle(color: Color(0xff0184bb)),
  'string': TextStyle(color: Color(0xff50a14f)),
  'regexp': TextStyle(color: Color(0xff50a14f)),
  'addition': TextStyle(color: Color(0xff50a14f)),
  'attribute': TextStyle(color: Color(0xff50a14f)),
  'meta-string': TextStyle(color: Color(0xff50a14f)),
  'built_in': TextStyle(color: Color(0xffc18401)),
  'attr': TextStyle(color: Color(0xff986801)),
  'variable': TextStyle(color: Color(0xff986801)),
  'template-variable': TextStyle(color: Color(0xff986801)),
  'type': TextStyle(color: Color(0xff986801)),
  'selector-class': TextStyle(color: Color(0xff986801)),
  'selector-attr': TextStyle(color: Color(0xff986801)),
  'selector-pseudo': TextStyle(color: Color(0xff986801)),
  'number': TextStyle(color: Color(0xff986801)),
  'symbol': TextStyle(color: Color(0xff4078f2)),
  'bullet': TextStyle(color: Color(0xff4078f2)),
  'link': TextStyle(color: Color(0xff4078f2)),
  'meta': TextStyle(color: Color(0xff4078f2)),
  'selector-id': TextStyle(color: Color(0xff4078f2)),
  'title': TextStyle(color: Color(0xff4078f2)),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
  'strong': TextStyle(fontWeight: FontWeight.bold),
};
