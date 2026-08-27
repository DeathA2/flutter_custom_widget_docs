import 'package:doc_widget/doc_widget.dart';

import 'activity_indicator/activity_indicator_preview.dart';
import 'shimmer/shimmer_preview.dart';
import 'skeleton_box/skeleton_box_preview.dart';
import 'loading_overlay/loading_overlay_preview.dart';
import 'status_toast/status_toast_preview.dart';
import 'empty_state/empty_state_preview.dart';
import 'error_state/error_state_preview.dart';

ElementsSection renderLoadingStateSection() {
  return ElementsSection(
    elements: [
      activityIndicatorPreview,
      shimmerPreview,
      skeletonBoxPreview,
      loadingOverlayPreview,
      statusToastPreview,
      emptyStatePreview,
      errorStatePreview,
    ],
    title: 'Loading & State',
  );
}
