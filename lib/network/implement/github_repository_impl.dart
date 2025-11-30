import 'package:flutter_custom_widget_docs/network/api_endpoint.dart';
import 'package:flutter_custom_widget_docs/network/model/common/result.dart';
import 'package:flutter_custom_widget_docs/network/model/github/github_user_model.dart';
import 'package:flutter_custom_widget_docs/network/model/github/repo_information_model.dart';
import 'package:flutter_custom_widget_docs/network/repository/github_repository.dart';
import 'package:flutter_custom_widget_docs/services/dio_services.dart';

class GithubRepositoryImpl extends GithubRepository {
  @override
  Future<XResult<List<GithubUserModel>>> getListContributors() {
    return executeApi(
      func: () => DioServices.dio.get(APIEndpoint.getContributors),
      onSuccess: (response) {
        List<GithubUserModel> listResponse = List.empty();
        if (response.data is List) {
          listResponse =
              (response.data as List)
                  .map((item) => GithubUserModel.fromJson(item))
                  .toList();
        }
        return XResult.success(listResponse);
      },
    );
  }

  @override
  Future<XResult<RepoInformationModel>> getRepoInformation() {
    return executeApi(
      func: () => DioServices.dio.get(APIEndpoint.getRepoInfo),
      onSuccess:
          (response) =>
              XResult.success(RepoInformationModel.fromJson(response.data)),
    );
  }
}
