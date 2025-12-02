import 'package:flutter/foundation.dart';
import 'package:flutter_custom_widget_docs/network/model/github/github_user_model.dart';

class RepoInformationModel {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool isPrivate;
  final GithubUserModel owner;
  final String htmlUrl;
  final String? description;
  final bool fork;
  final String url;
  final String forksUrl;
  final String keysUrl;
  final String collaboratorsUrl;
  final String teamsUrl;
  final String hooksUrl;
  final String issueEventsUrl;
  final String eventsUrl;
  final String assigneesUrl;
  final String branchesUrl;
  final String tagsUrl;
  final String blobsUrl;
  final String gitTagsUrl;
  final String gitRefsUrl;
  final String treesUrl;
  final String statusesUrl;
  final String languagesUrl;
  final String stargazersUrl;
  final String contributorsUrl;
  final String subscribersUrl;
  final String subscriptionUrl;
  final String commitsUrl;
  final String gitCommitsUrl;
  final String commentsUrl;
  final String issueCommentUrl;
  final String contentsUrl;
  final String compareUrl;
  final String mergesUrl;
  final String archiveUrl;
  final String downloadsUrl;
  final String issuesUrl;
  final String pullsUrl;
  final String milestonesUrl;
  final String notificationsUrl;
  final String labelsUrl;
  final String releasesUrl;
  final String deploymentsUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  final String gitUrl;
  final String sshUrl;
  final String cloneUrl;
  final String svnUrl;
  final String? homepage;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool hasPages;
  final bool hasDiscussions;
  final int forksCount;
  final bool archived;
  final bool disabled;
  final int openIssuesCount;
  final String? license;
  final bool allowForking;
  final bool isTemplate;
  final bool webCommitSignoffRequired;
  final List<String> topics;
  final String visibility;
  final int forks;
  final int openIssues;
  final int watchers;
  final String defaultBranch;
  RepoInformationModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.isPrivate,
    required this.owner,
    required this.htmlUrl,
    this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.hasDiscussions,
    required this.forksCount,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    this.license,
    required this.allowForking,
    required this.isTemplate,
    required this.webCommitSignoffRequired,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
  });

  RepoInformationModel copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? isPrivate,
    GithubUserModel? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    bool? hasDiscussions,
    int? forksCount,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    String? license,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    List<String>? topics,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
  }) {
    return RepoInformationModel(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      isPrivate: isPrivate ?? this.isPrivate,
      owner: owner ?? this.owner,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      description: description ?? this.description,
      fork: fork ?? this.fork,
      url: url ?? this.url,
      forksUrl: forksUrl ?? this.forksUrl,
      keysUrl: keysUrl ?? this.keysUrl,
      collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
      teamsUrl: teamsUrl ?? this.teamsUrl,
      hooksUrl: hooksUrl ?? this.hooksUrl,
      issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      assigneesUrl: assigneesUrl ?? this.assigneesUrl,
      branchesUrl: branchesUrl ?? this.branchesUrl,
      tagsUrl: tagsUrl ?? this.tagsUrl,
      blobsUrl: blobsUrl ?? this.blobsUrl,
      gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
      gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
      treesUrl: treesUrl ?? this.treesUrl,
      statusesUrl: statusesUrl ?? this.statusesUrl,
      languagesUrl: languagesUrl ?? this.languagesUrl,
      stargazersUrl: stargazersUrl ?? this.stargazersUrl,
      contributorsUrl: contributorsUrl ?? this.contributorsUrl,
      subscribersUrl: subscribersUrl ?? this.subscribersUrl,
      subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
      commitsUrl: commitsUrl ?? this.commitsUrl,
      gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
      commentsUrl: commentsUrl ?? this.commentsUrl,
      issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
      contentsUrl: contentsUrl ?? this.contentsUrl,
      compareUrl: compareUrl ?? this.compareUrl,
      mergesUrl: mergesUrl ?? this.mergesUrl,
      archiveUrl: archiveUrl ?? this.archiveUrl,
      downloadsUrl: downloadsUrl ?? this.downloadsUrl,
      issuesUrl: issuesUrl ?? this.issuesUrl,
      pullsUrl: pullsUrl ?? this.pullsUrl,
      milestonesUrl: milestonesUrl ?? this.milestonesUrl,
      notificationsUrl: notificationsUrl ?? this.notificationsUrl,
      labelsUrl: labelsUrl ?? this.labelsUrl,
      releasesUrl: releasesUrl ?? this.releasesUrl,
      deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
      gitUrl: gitUrl ?? this.gitUrl,
      sshUrl: sshUrl ?? this.sshUrl,
      cloneUrl: cloneUrl ?? this.cloneUrl,
      svnUrl: svnUrl ?? this.svnUrl,
      homepage: homepage ?? this.homepage,
      size: size ?? this.size,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      language: language ?? this.language,
      hasIssues: hasIssues ?? this.hasIssues,
      hasProjects: hasProjects ?? this.hasProjects,
      hasDownloads: hasDownloads ?? this.hasDownloads,
      hasWiki: hasWiki ?? this.hasWiki,
      hasPages: hasPages ?? this.hasPages,
      hasDiscussions: hasDiscussions ?? this.hasDiscussions,
      forksCount: forksCount ?? this.forksCount,
      archived: archived ?? this.archived,
      disabled: disabled ?? this.disabled,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      license: license ?? this.license,
      allowForking: allowForking ?? this.allowForking,
      isTemplate: isTemplate ?? this.isTemplate,
      webCommitSignoffRequired:
          webCommitSignoffRequired ?? this.webCommitSignoffRequired,
      topics: topics ?? this.topics,
      visibility: visibility ?? this.visibility,
      forks: forks ?? this.forks,
      openIssues: openIssues ?? this.openIssues,
      watchers: watchers ?? this.watchers,
      defaultBranch: defaultBranch ?? this.defaultBranch,
    );
  }

  factory RepoInformationModel.fromJson(Map<String, dynamic> json) {
    return RepoInformationModel(
      id: json['id'] ?? 0,
      nodeId: json['node_id'] ?? '',
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      isPrivate: json['private'] ?? false,
      owner: GithubUserModel.fromJson(json['owner'] ?? {}),
      htmlUrl: json['html_url'] ?? '',
      description: json['description'],
      fork: json['fork'] ?? false,
      url: json['url'] ?? '',
      forksUrl: json['forks_url'] ?? '',
      keysUrl: json['keys_url'] ?? '',
      collaboratorsUrl: json['collaborators_url'] ?? '',
      teamsUrl: json['teams_url'] ?? '',
      hooksUrl: json['hooks_url'] ?? '',
      issueEventsUrl: json['issue_events_url'] ?? '',
      eventsUrl: json['events_url'] ?? '',
      assigneesUrl: json['assignees_url'] ?? '',
      branchesUrl: json['branches_url'] ?? '',
      tagsUrl: json['tags_url'] ?? '',
      blobsUrl: json['blobs_url'] ?? '',
      gitTagsUrl: json['git_tags_url'] ?? '',
      gitRefsUrl: json['git_refs_url'] ?? '',
      treesUrl: json['trees_url'] ?? '',
      statusesUrl: json['statuses_url'] ?? '',
      languagesUrl: json['languages_url'] ?? '',
      stargazersUrl: json['stargazers_url'] ?? '',
      contributorsUrl: json['contributors_url'] ?? '',
      subscribersUrl: json['subscribers_url'] ?? '',
      subscriptionUrl: json['subscription_url'] ?? '',
      commitsUrl: json['commits_url'] ?? '',
      gitCommitsUrl: json['git_commits_url'] ?? '',
      commentsUrl: json['comments_url'] ?? '',
      issueCommentUrl: json['issue_comment_url'] ?? '',
      contentsUrl: json['contents_url'] ?? '',
      compareUrl: json['compare_url'] ?? '',
      mergesUrl: json['merges_url'] ?? '',
      archiveUrl: json['archive_url'] ?? '',
      downloadsUrl: json['downloads_url'] ?? '',
      issuesUrl: json['issues_url'] ?? '',
      pullsUrl: json['pulls_url'] ?? '',
      milestonesUrl: json['milestones_url'] ?? '',
      notificationsUrl: json['notifications_url'] ?? '',
      labelsUrl: json['labels_url'] ?? '',
      releasesUrl: json['releases_url'] ?? '',
      deploymentsUrl: json['deployments_url'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pushedAt: DateTime.parse(json['pushed_at']),
      gitUrl: json['git_url'] ?? '',
      sshUrl: json['ssh_url'] ?? '',
      cloneUrl: json['clone_url'] ?? '',
      svnUrl: json['svn_url'] ?? '',
      homepage: json['homepage'],
      size: json['size'] ?? 0,
      stargazersCount: json['stargazers_count'] ?? 0,
      watchersCount: json['watchers_count'] ?? 0,
      language: json['language'],
      hasIssues: json['has_issues'] ?? false,
      hasProjects: json['has_projects'] ?? false,
      hasDownloads: json['has_downloads'] ?? false,
      hasWiki: json['has_wiki'] ?? false,
      hasPages: json['has_pages'] ?? false,
      hasDiscussions: json['has_discussions'] ?? false,
      forksCount: json['forks_count'] ?? 0,
      archived: json['archived'] ?? false,
      disabled: json['disabled'] ?? false,
      openIssuesCount: json['open_issues_count'] ?? 0,
      license: json['license']?['name'],
      allowForking: json['allow_forking'] ?? true,
      isTemplate: json['is_template'] ?? false,
      webCommitSignoffRequired: json['web_commit_signoff_required'] ?? false,
      topics:
          (json['topics'] as List?)?.map((e) => e.toString()).toList() ?? [],
      visibility: json['visibility'] ?? 'public',
      forks: json['forks'] ?? 0,
      openIssues: json['open_issues'] ?? 0,
      watchers: json['watchers'] ?? 0,
      defaultBranch: json['default_branch'] ?? 'main',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'full_name': fullName,
      'private': isPrivate,
      'owner': owner.toJson(),
      'html_url': htmlUrl,
      'description': description,
      'fork': fork,
      'url': url,
      'forks_url': forksUrl,
      'keys_url': keysUrl,
      'collaborators_url': collaboratorsUrl,
      'teams_url': teamsUrl,
      'hooks_url': hooksUrl,
      'issue_events_url': issueEventsUrl,
      'events_url': eventsUrl,
      'assignees_url': assigneesUrl,
      'branches_url': branchesUrl,
      'tags_url': tagsUrl,
      'blobs_url': blobsUrl,
      'git_tags_url': gitTagsUrl,
      'git_refs_url': gitRefsUrl,
      'trees_url': treesUrl,
      'statuses_url': statusesUrl,
      'languages_url': languagesUrl,
      'stargazers_url': stargazersUrl,
      'contributors_url': contributorsUrl,
      'subscribers_url': subscribersUrl,
      'subscription_url': subscriptionUrl,
      'commits_url': commitsUrl,
      'git_commits_url': gitCommitsUrl,
      'comments_url': commentsUrl,
      'issue_comment_url': issueCommentUrl,
      'contents_url': contentsUrl,
      'compare_url': compareUrl,
      'merges_url': mergesUrl,
      'archive_url': archiveUrl,
      'downloads_url': downloadsUrl,
      'issues_url': issuesUrl,
      'pulls_url': pullsUrl,
      'milestones_url': milestonesUrl,
      'notifications_url': notificationsUrl,
      'labels_url': labelsUrl,
      'releases_url': releasesUrl,
      'deployments_url': deploymentsUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'pushed_at': pushedAt.toIso8601String(),
      'git_url': gitUrl,
      'ssh_url': sshUrl,
      'clone_url': cloneUrl,
      'svn_url': svnUrl,
      'homepage': homepage,
      'size': size,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'has_issues': hasIssues,
      'has_projects': hasProjects,
      'has_downloads': hasDownloads,
      'has_wiki': hasWiki,
      'has_pages': hasPages,
      'has_discussions': hasDiscussions,
      'forks_count': forksCount,
      'archived': archived,
      'disabled': disabled,
      'open_issues_count': openIssuesCount,
      'license': license,
      'allow_forking': allowForking,
      'is_template': isTemplate,
      'web_commit_signoff_required': webCommitSignoffRequired,
      'topics': topics,
      'visibility': visibility,
      'forks': forks,
      'open_issues': openIssues,
      'watchers': watchers,
      'default_branch': defaultBranch,
    };
  }

  @override
  String toString() {
    return 'RepoInformationModel(id: $id, nodeId: $nodeId, name: $name, fullName: $fullName, isPrivate: $isPrivate, owner: $owner, htmlUrl: $htmlUrl, description: $description, fork: $fork, url: $url, forksUrl: $forksUrl, keysUrl: $keysUrl, collaboratorsUrl: $collaboratorsUrl, teamsUrl: $teamsUrl, hooksUrl: $hooksUrl, issueEventsUrl: $issueEventsUrl, eventsUrl: $eventsUrl, assigneesUrl: $assigneesUrl, branchesUrl: $branchesUrl, tagsUrl: $tagsUrl, blobsUrl: $blobsUrl, gitTagsUrl: $gitTagsUrl, gitRefsUrl: $gitRefsUrl, treesUrl: $treesUrl, statusesUrl: $statusesUrl, languagesUrl: $languagesUrl, stargazersUrl: $stargazersUrl, contributorsUrl: $contributorsUrl, subscribersUrl: $subscribersUrl, subscriptionUrl: $subscriptionUrl, commitsUrl: $commitsUrl, gitCommitsUrl: $gitCommitsUrl, commentsUrl: $commentsUrl, issueCommentUrl: $issueCommentUrl, contentsUrl: $contentsUrl, compareUrl: $compareUrl, mergesUrl: $mergesUrl, archiveUrl: $archiveUrl, downloadsUrl: $downloadsUrl, issuesUrl: $issuesUrl, pullsUrl: $pullsUrl, milestonesUrl: $milestonesUrl, notificationsUrl: $notificationsUrl, labelsUrl: $labelsUrl, releasesUrl: $releasesUrl, deploymentsUrl: $deploymentsUrl, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt, gitUrl: $gitUrl, sshUrl: $sshUrl, cloneUrl: $cloneUrl, svnUrl: $svnUrl, homepage: $homepage, size: $size, stargazersCount: $stargazersCount, watchersCount: $watchersCount, language: $language, hasIssues: $hasIssues, hasProjects: $hasProjects, hasDownloads: $hasDownloads, hasWiki: $hasWiki, hasPages: $hasPages, hasDiscussions: $hasDiscussions, forksCount: $forksCount, archived: $archived, disabled: $disabled, openIssuesCount: $openIssuesCount, license: $license, allowForking: $allowForking, isTemplate: $isTemplate, webCommitSignoffRequired: $webCommitSignoffRequired, topics: $topics, visibility: $visibility, forks: $forks, openIssues: $openIssues, watchers: $watchers, defaultBranch: $defaultBranch)';
  }

  @override
  bool operator ==(covariant RepoInformationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nodeId == nodeId &&
        other.name == name &&
        other.fullName == fullName &&
        other.isPrivate == isPrivate &&
        other.owner == owner &&
        other.htmlUrl == htmlUrl &&
        other.description == description &&
        other.fork == fork &&
        other.url == url &&
        other.forksUrl == forksUrl &&
        other.keysUrl == keysUrl &&
        other.collaboratorsUrl == collaboratorsUrl &&
        other.teamsUrl == teamsUrl &&
        other.hooksUrl == hooksUrl &&
        other.issueEventsUrl == issueEventsUrl &&
        other.eventsUrl == eventsUrl &&
        other.assigneesUrl == assigneesUrl &&
        other.branchesUrl == branchesUrl &&
        other.tagsUrl == tagsUrl &&
        other.blobsUrl == blobsUrl &&
        other.gitTagsUrl == gitTagsUrl &&
        other.gitRefsUrl == gitRefsUrl &&
        other.treesUrl == treesUrl &&
        other.statusesUrl == statusesUrl &&
        other.languagesUrl == languagesUrl &&
        other.stargazersUrl == stargazersUrl &&
        other.contributorsUrl == contributorsUrl &&
        other.subscribersUrl == subscribersUrl &&
        other.subscriptionUrl == subscriptionUrl &&
        other.commitsUrl == commitsUrl &&
        other.gitCommitsUrl == gitCommitsUrl &&
        other.commentsUrl == commentsUrl &&
        other.issueCommentUrl == issueCommentUrl &&
        other.contentsUrl == contentsUrl &&
        other.compareUrl == compareUrl &&
        other.mergesUrl == mergesUrl &&
        other.archiveUrl == archiveUrl &&
        other.downloadsUrl == downloadsUrl &&
        other.issuesUrl == issuesUrl &&
        other.pullsUrl == pullsUrl &&
        other.milestonesUrl == milestonesUrl &&
        other.notificationsUrl == notificationsUrl &&
        other.labelsUrl == labelsUrl &&
        other.releasesUrl == releasesUrl &&
        other.deploymentsUrl == deploymentsUrl &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.pushedAt == pushedAt &&
        other.gitUrl == gitUrl &&
        other.sshUrl == sshUrl &&
        other.cloneUrl == cloneUrl &&
        other.svnUrl == svnUrl &&
        other.homepage == homepage &&
        other.size == size &&
        other.stargazersCount == stargazersCount &&
        other.watchersCount == watchersCount &&
        other.language == language &&
        other.hasIssues == hasIssues &&
        other.hasProjects == hasProjects &&
        other.hasDownloads == hasDownloads &&
        other.hasWiki == hasWiki &&
        other.hasPages == hasPages &&
        other.hasDiscussions == hasDiscussions &&
        other.forksCount == forksCount &&
        other.archived == archived &&
        other.disabled == disabled &&
        other.openIssuesCount == openIssuesCount &&
        other.license == license &&
        other.allowForking == allowForking &&
        other.isTemplate == isTemplate &&
        other.webCommitSignoffRequired == webCommitSignoffRequired &&
        listEquals(other.topics, topics) &&
        other.visibility == visibility &&
        other.forks == forks &&
        other.openIssues == openIssues &&
        other.watchers == watchers &&
        other.defaultBranch == defaultBranch;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nodeId.hashCode ^
        name.hashCode ^
        fullName.hashCode ^
        isPrivate.hashCode ^
        owner.hashCode ^
        htmlUrl.hashCode ^
        description.hashCode ^
        fork.hashCode ^
        url.hashCode ^
        forksUrl.hashCode ^
        keysUrl.hashCode ^
        collaboratorsUrl.hashCode ^
        teamsUrl.hashCode ^
        hooksUrl.hashCode ^
        issueEventsUrl.hashCode ^
        eventsUrl.hashCode ^
        assigneesUrl.hashCode ^
        branchesUrl.hashCode ^
        tagsUrl.hashCode ^
        blobsUrl.hashCode ^
        gitTagsUrl.hashCode ^
        gitRefsUrl.hashCode ^
        treesUrl.hashCode ^
        statusesUrl.hashCode ^
        languagesUrl.hashCode ^
        stargazersUrl.hashCode ^
        contributorsUrl.hashCode ^
        subscribersUrl.hashCode ^
        subscriptionUrl.hashCode ^
        commitsUrl.hashCode ^
        gitCommitsUrl.hashCode ^
        commentsUrl.hashCode ^
        issueCommentUrl.hashCode ^
        contentsUrl.hashCode ^
        compareUrl.hashCode ^
        mergesUrl.hashCode ^
        archiveUrl.hashCode ^
        downloadsUrl.hashCode ^
        issuesUrl.hashCode ^
        pullsUrl.hashCode ^
        milestonesUrl.hashCode ^
        notificationsUrl.hashCode ^
        labelsUrl.hashCode ^
        releasesUrl.hashCode ^
        deploymentsUrl.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        pushedAt.hashCode ^
        gitUrl.hashCode ^
        sshUrl.hashCode ^
        cloneUrl.hashCode ^
        svnUrl.hashCode ^
        homepage.hashCode ^
        size.hashCode ^
        stargazersCount.hashCode ^
        watchersCount.hashCode ^
        language.hashCode ^
        hasIssues.hashCode ^
        hasProjects.hashCode ^
        hasDownloads.hashCode ^
        hasWiki.hashCode ^
        hasPages.hashCode ^
        hasDiscussions.hashCode ^
        forksCount.hashCode ^
        archived.hashCode ^
        disabled.hashCode ^
        openIssuesCount.hashCode ^
        license.hashCode ^
        allowForking.hashCode ^
        isTemplate.hashCode ^
        webCommitSignoffRequired.hashCode ^
        topics.hashCode ^
        visibility.hashCode ^
        forks.hashCode ^
        openIssues.hashCode ^
        watchers.hashCode ^
        defaultBranch.hashCode;
  }
}
