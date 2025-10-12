import 'package:doc_widget/doc_widget.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/utils/platform.dart';
import 'package:doc_widget/src/widgets/app_bar.dart';
import 'package:doc_widget/src/widgets/drawer.dart';
import 'package:doc_widget/src/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/theme_manager.dart';

/// Flutter application responsible to show all elements that are generated.
class DocPreviewApp extends StatefulWidget {
  const DocPreviewApp({super.key, required this.sections, this.title});

  final List<ElementsSection> sections;
  final String? title;

  @override
  _DocPreviewAppState createState() => _DocPreviewAppState();
}

class _DocPreviewAppState extends State<DocPreviewApp> {
  late ElementPreview _selectedItem;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectedItem = widget.sections.first.elements.first;
    super.initState();
  }

  void setSelectedItem(ElementPreview selectedItem) {
    setState(() {
      _selectedItem = selectedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget renderBody() {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile() ? Spacing.x4 : Spacing.x8,
            vertical: Spacing.x4,
          ),
          child: Item(_selectedItem),
        ),
      );
    }

    Widget renderDrawer() {
      return DrawerCustom(
        title: widget.title,
        sections: widget.sections,
        selectedItem: _selectedItem,
        onTap: (selectedItem) {
          setSelectedItem(selectedItem);
          if (_scaffoldKey.currentState!.isDrawerOpen && isMobile()) {
            _scaffoldKey.currentState!.openEndDrawer();
          }
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.getTheme(),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: isMobile() ? renderDrawer() : null,
        appBar:
            isMobile()
                ? PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: AppBarCustom(title: _selectedItem.document.name),
                )
                : null,
        body:
            isMobile()
                ? renderBody()
                : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [renderDrawer(), Expanded(child: renderBody())],
                ),
      ),
    );
  }
}
