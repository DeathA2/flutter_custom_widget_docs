import 'package:doc_widget/doc_widget.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/utils/platform.dart';
import 'package:doc_widget/src/widgets/app_bar.dart';
import 'package:doc_widget/src/widgets/drawer_with_search.dart';
import 'package:doc_widget/src/widgets/item.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_custom_widget_docs/network/implement/github_repository_impl.dart';
import 'package:flutter_custom_widget_docs/network/model/github/github_user_model.dart';
import 'package:flutter_custom_widget_docs/network/model/github/repo_information_model.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/theme_manager.dart';
import 'package:url_launcher/url_launcher.dart';

/// Flutter application responsible to show all elements that are generated.
class DocPreviewApp extends StatefulWidget {
  const DocPreviewApp({super.key, required this.sections, this.title});

  final List<ElementsSection> sections;
  final String? title;

  @override
  State<DocPreviewApp> createState() => _DocPreviewAppState();
}

class _DocPreviewAppState extends State<DocPreviewApp> {
  late ElementPreview _selectedItem;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GithubRepositoryImpl _repo = GithubRepositoryImpl();
  RepoInformationModel? _repoInfo;
  List<GithubUserModel> _contributors = [];
  bool _loadingRepo = false;

  @override
  void initState() {
    _selectedItem = widget.sections.first.elements.first;
    _fetchRepoData();
    super.initState();
  }

  Future<void> _fetchRepoData() async {
    setState(() => _loadingRepo = true);
    try {
      final repoRes = await _repo.getRepoInformation();
      if (repoRes.isSuccess) {
        _repoInfo = repoRes.data;
      }
      final contribRes = await _repo.getListContributors();
      if (contribRes.isSuccess) {
        _contributors = contribRes.data ?? [];
      }
    } catch (e) {
      // ignore errors for now; could log
    } finally {
      setState(() => _loadingRepo = false);
    }
  }

  void setSelectedItem(ElementPreview selectedItem) {
    setState(() {
      _selectedItem = selectedItem;
    });
  }

  // --- Repository UI helpers (moved to class scope) ---
  Widget _repoInfoSection(BuildContext context) {
    if (_repoInfo == null) {
      return const SizedBox.shrink();
    }

    final owner = _repoInfo!.owner;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Owner row
        InkWell(
          onTap: () async {
            final url = owner.htmlUrl ?? _repoInfo!.htmlUrl;
            _openUrl(url, context);
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage:
                    owner.avatarUrl != null && owner.avatarUrl!.isNotEmpty
                        ? NetworkImage(owner.avatarUrl!)
                        : null,
                child:
                    owner.avatarUrl == null || owner.avatarUrl!.isEmpty
                        ? const Icon(Icons.person)
                        : null,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  owner.login ?? 'Owner',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Contributors avatars (overlapping)
        _renderContributorsRow(context),
        const SizedBox(height: 8),

        // Repo link row — show 'Contribute here' and navigate when tapped
        Row(
          children: [
            const Icon(Icons.link, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: InkWell(
                onTap: () => _openUrl(_repoInfo!.htmlUrl, context),
                child: Text(
                  'Contribute here',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _renderContributorsRow(BuildContext context) {
    final maxAvatars = 6; // show 5-7 per request; choose 6
    final count = _contributors.length;
    if (count == 0) return const SizedBox.shrink();

    final avatars = <Widget>[];
    final displayCount = count > maxAvatars ? maxAvatars : count;
    for (var i = 0; i < displayCount; i++) {
      final u = _contributors[i];
      avatars.add(
        Tooltip(
          message: u.login ?? '',
          child: GestureDetector(
            onTap: () => _openUrl(u.htmlUrl ?? u.url ?? '', context),
            child: Container(
              margin: EdgeInsets.only(left: i == 0 ? 0 : -8.0),
              child: CircleAvatar(
                radius: 14,
                backgroundImage:
                    u.avatarUrl != null && u.avatarUrl!.isNotEmpty
                        ? NetworkImage(u.avatarUrl!)
                        : null,
                backgroundColor: Colors.grey[300],
              ),
            ),
          ),
        ),
      );
    }

    Widget trailing = const SizedBox.shrink();
    if (count > maxAvatars) {
      final remaining = count - maxAvatars;
      final names = _contributors
          .skip(maxAvatars)
          .map((e) => e.login ?? '')
          .join(', ');
      trailing = Tooltip(
        message: names,
        child: Container(
          margin: const EdgeInsets.only(left: -8.0),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.black54,
            child: Text(
              '+$remaining',
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        ...avatars,
        if (count > maxAvatars) trailing,
        const SizedBox(width: 8),
        Text(
          '$count contributors',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  void _openUrl(String? url, BuildContext context) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open URL: $url')));
    }
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
      // DrawerCustom on top; repo info shown below in a small section.
      return Column(
        children: [
          Expanded(
            child: DrawerCustom(
              title: widget.title,
              sections: widget.sections,
              selectedItem: _selectedItem,
              onTap: (selectedItem) {
                setSelectedItem(selectedItem);
                if (_scaffoldKey.currentState!.isDrawerOpen && isMobile()) {
                  _scaffoldKey.currentState!.openEndDrawer();
                }
              },
            ),
          ),
          // Small repo info area
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withAlpha((0.12 * 255).round()),
                ),
              ),
            ),
            child:
                _loadingRepo
                    ? const SizedBox.shrink()
                    : _repoInfoSection(context),
          ),
        ],
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
                  children: [
                    SizedBox(width: 320, child: renderDrawer()),
                    Expanded(child: renderBody()),
                  ],
                ),
      ),
    );
  }
}
