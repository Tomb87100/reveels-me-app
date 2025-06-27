import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
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

class CreateStripeConnectAccountCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'createStripeConnectAccount',
      apiUrl:
          'https://rpbxzrmvioqqajffaufc.supabase.co/functions/v1/create-connect-account',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwYnh6cm12aW9xcWFqZmZhdWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxNjM0MTEsImV4cCI6MjA2NTczOTQxMX0.6aRDjYzfxjpR7z7sJmqDGpE2RcoKF2yTdgL8thVRrdI',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
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

class GetPublicPackDetailsAPICall {
  static Future<ApiCallResponse> call({
    String? slug = '',
  }) async {
    final ffApiRequestBody = '''
{
  "slug": "${escapeStringForJson(slug)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getPublicPackDetailsAPI',
      apiUrl:
          'https://rpbxzrmvioqqajffaufc.supabase.co/functions/v1/get-public-pack-details',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
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

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? sellerid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.seller_id''',
      ));
  static String? packslug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pack_slug''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static int? basesellerprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.base_seller_price''',
      ));
  static String? coverimagepath(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.cover_image_path''',
      ));
  static String? createdat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static String? shopurlslug(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.shop_url_slug''',
      ));
  static int? mediacount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.media_count''',
      ));
  static String? signedcoverurl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signedCoverUrl''',
      ));
  static List<String>? signedmediaurls(dynamic response) => (getJsonField(
        response,
        r'''$.signedMediaUrls''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  static String? dedicatedcoverpath(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dedicated_cover_path''',
      ));
  static List? signedmediaitems(dynamic response) => getJsonField(
        response,
        r'''$.signedMediaItems''',
        true,
      ) as List?;
  static List<String>? signedmediaitemstype(dynamic response) => (getJsonField(
        response,
        r'''$.signedMediaItems[:].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? signedmediaitemspath(dynamic response) => (getJsonField(
        response,
        r'''$.signedMediaItems[:].path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CreatePaymentIntentCall {
  static Future<ApiCallResponse> call({
    String? packId = '',
    String? buyerEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "packId": "${escapeStringForJson(packId)}",
  "buyerEmail": "${escapeStringForJson(buyerEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPaymentIntent',
      apiUrl:
          'https://rpbxzrmvioqqajffaufc.supabase.co/functions/v1/create-payment-intent',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwYnh6cm12aW9xcWFqZmZhdWZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxNjM0MTEsImV4cCI6MjA2NTczOTQxMX0.6aRDjYzfxjpR7z7sJmqDGpE2RcoKF2yTdgL8thVRrdI',
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

  static String? clientSecret(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.clientSecret''',
      ));
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
