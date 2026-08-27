import 'package:doc_widget/doc_widget.dart';

/// Hand-written `Documentation` for APIs that are not widget classes.
///
/// `@docWidget` can only read a class constructor, so top-level functions
/// (`playCoinFlight`), static-only classes (`DragAutoScroll`) and
/// `SliverPersistentHeaderDelegate` subclasses (`SliverImageHeader`) have
/// nothing for the generator to read.
class ManualDocumentation implements Documentation {
  ManualDocumentation({
    required this.name,
    this.properties = const <PropertyDoc>[],
    this.dependencies = const <String>[],
    this.snippet = '',
    this.hasState = false,
    this.deprecation,
    this.source,
  });

  @override
  final String name;

  @override
  final List<PropertyDoc> properties;

  @override
  final List<String> dependencies;

  @override
  final String snippet;

  @override
  final bool hasState;

  @override
  final String? deprecation;

  @override
  final String? source;
}
