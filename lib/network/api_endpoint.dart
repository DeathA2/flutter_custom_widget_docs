class APIEndpoint {
  APIEndpoint._();

  static final String _baseUrl =
      'https://api.github.com/repos/DeathA2/flutter_custom_widget_docs';

  // Public GitHub API endpoints for this repository
  static String getRepoInfo = _baseUrl;
  static String getContributors = '$_baseUrl/contributors';
}
