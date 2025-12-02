class ENV {
  static const String ownerGit = "DeathA2";
  static const String repoName = "flutter_custom_widget_docs";
  static const String githubApiUrl = "https://api.github.com/repos";

  static String get baseApiUrl => [githubApiUrl, ownerGit, repoName].join("/");
}
