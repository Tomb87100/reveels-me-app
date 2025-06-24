import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PublishPackCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    double? price,
    String? coverImagePath = '',
    String? authToken = '',
    String? dedicatedCoverPath = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}",
  "price": "${price}",
  "coverImagePath": "${coverImagePath}",
  "dedicatedCoverPath": "${dedicatedCoverPath}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'publishPack',
      apiUrl:
          'https://rpbxzrmvioqqajffaufc.supabase.co/functions/v1/publishPack',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwYnh6cm12aW9xcWFqZmZhdWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxNjM0MTEsImV4cCI6MjA2NTczOTQxMX0.6aRDjYzfxjpR7z7sJmqDGpE2RcoKF2yTdgL8thVRrdI',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
