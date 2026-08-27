import 'package:doc_widget/doc_widget.dart';

import 'touchable_opacity/touchable_opacity_preview.dart';
import 'shake_container/shake_container_preview.dart';
import 'pulse_on_change/pulse_on_change_preview.dart';
import 'breathing/breathing_preview.dart';
import 'animated_counter/animated_counter_preview.dart';
import 'typing_dots/typing_dots_preview.dart';
import 'streak_flame/streak_flame_preview.dart';
import 'evolution_visual/evolution_visual_preview.dart';
import 'companion_avatar/companion_avatar_preview.dart';

ElementsSection renderAnimationSection() {
  return ElementsSection(
    elements: [
      touchableOpacityPreview,
      shakeContainerPreview,
      pulseOnChangePreview,
      breathingPreview,
      animatedCounterPreview,
      typingDotsPreview,
      streakFlamePreview,
      evolutionVisualPreview,
      companionAvatarPreview,
    ],
    title: 'Animations',
  );
}
