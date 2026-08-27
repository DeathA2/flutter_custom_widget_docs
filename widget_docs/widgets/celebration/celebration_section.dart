import 'package:doc_widget/doc_widget.dart';

import 'confetti/confetti_preview.dart';
import 'celebration_overlay/celebration_overlay_preview.dart';
import 'coin_flight/coin_flight_preview.dart';

ElementsSection renderCelebrationSection() {
  return ElementsSection(
    elements: [confettiPreview, celebrationOverlayPreview, coinFlightPreview],
    title: 'Celebration',
  );
}
