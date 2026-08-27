import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/outline_button.dart';

/// Error state with a retry button.
@docWidget
class ErrorState extends StatelessWidget {
  const ErrorState({
    this.title = 'Something went wrong. Please try again.',
    this.retryLabel = 'Retry',
    this.onRetry,
    super.key,
  });

  final String title;
  final String retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 76,
              height: 76,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CustomColors.errorSoft,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.wifi_tethering_error_rounded,
                size: 38,
                color: CustomColors.error,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: CustomColors.ink,
              ),
            ),
            if (onRetry != null) ...<Widget>[
              const SizedBox(height: 18),
              SizedBox(
                width: 180,
                child: OutlineButton(label: retryLabel, onTap: onRetry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
