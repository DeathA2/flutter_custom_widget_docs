import 'package:flutter_custom_widget_docs/network/common/base_repository.dart';
import 'package:flutter_custom_widget_docs/network/model/common/result.dart';
import 'package:flutter_custom_widget_docs/network/model/github/github_user_model.dart';
import 'package:flutter_custom_widget_docs/network/model/github/repo_information_model.dart';

abstract class GithubRepository extends BaseRepository {
  Future<XResult<RepoInformationModel>> getRepoInformation();

  Future<XResult<List<GithubUserModel>>> getListContributors();
}
