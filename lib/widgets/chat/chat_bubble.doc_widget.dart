// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ChatBubbleDocWidget implements Documentation {
  @override
  String get name => 'ChatBubble';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'isOwn', isRequired: true, isNamed: true, type: 'bool'),
    PropertyDoc(
      name: 'startsRun',
      isRequired: true,
      isNamed: true,
      type: 'bool',
      description:
          'First message of a run by the same sender — shows the name and avatar.',
    ),
    PropertyDoc(
      name: 'timeLabel',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'text',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description: 'Text content. Null when this is a media message.',
    ),
    PropertyDoc(
      name: 'media',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
      description:
          'Sticker, image or GIF. When set, [text] is ignored and the bubble has no\n background.',
    ),
    PropertyDoc(
      name: 'senderName',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'senderEmoji',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: '🙂',
    ),
    PropertyDoc(
      name: 'status',
      isRequired: false,
      isNamed: true,
      type: 'MessageStatus?',
      description: 'Ticks only appear on your own messages.',
    ),
    PropertyDoc(
      name: 'animateIn',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'reactions',
      isRequired: false,
      isNamed: true,
      type: 'Map<String, int>',
      description: 'emoji to reaction count. Empty draws no chips.',
      defaultValue: 'const <String, int>{}: \'{}\'',
    ),
    PropertyDoc(
      name: 'onLongPress',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description: 'Null disables long press entirely.',
    ),
    PropertyDoc(
      name: 'ownColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'otherColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral100',
    ),
    PropertyDoc(
      name: 'avatarSize',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '32: 32.0',
    ),
    PropertyDoc(
      name: 'bubbleRadius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '18: 18.0',
    ),
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];
}
