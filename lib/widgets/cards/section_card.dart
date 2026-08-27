import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Groups settings rows in a titled card, inserting dividers between rows.
@docWidget
class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.title,
    required this.children,
    this.large = false,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: large ? 20 : 18,
              color: CustomColors.ink,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: CustomColors.neutral200),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < children.length; i++) ...<Widget>[
                if (i > 0)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 56,
                    color: CustomColors.neutral200,
                  ),
                children[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}
