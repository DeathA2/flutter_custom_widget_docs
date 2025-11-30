import 'package:doc_widget/doc_widget.dart';

import 'shake_container/shake_container_preview.dart';
import 'touchable_opacity/touchable_opacity_preview.dart';

ElementsSection renderAnimationSection() {
  return ElementsSection(
    elements: [shakeContainer, touchableOpacityPreview],
    title: 'Animations',
  );
}
