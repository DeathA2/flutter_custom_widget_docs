import 'package:flutter_custom_widget_docs/network/implement/github_repository_impl.dart';

class DomainAPI {
  static DomainAPI? _internal;
  DomainAPI._();
  factory DomainAPI() {
    _internal ??= DomainAPI._();
    return _internal!;
  }
  final github = GithubRepositoryImpl();
}
