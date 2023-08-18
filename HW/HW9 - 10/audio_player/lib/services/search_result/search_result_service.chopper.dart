// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SearchResultService extends SearchResultService {
  _$SearchResultService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SearchResultService;

  @override
  Future<Response<SearchResultResponce>> getSearchResult(
    int per_page,
    int page,
    String q,
  ) {
    final Uri $url =
        Uri.parse('https://genius-song-lyrics1.p.rapidapi.com/search/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'per_page': per_page,
      'page': page,
      'q': q,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SearchResultResponce, SearchResultResponce>($request);
  }
}