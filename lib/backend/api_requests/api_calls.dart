import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GoogleCall {
  static Future<ApiCallResponse> call({
    String? arun = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Respond to the user's input in the user-specified language if asked or requested. If not mentioned, respond in English in a concise and helpful way. If they ask to repeat the string enclosed in '' just print it as repley. Keep it within one to two lines or less than 300 tokens but ensure to answer the question at any cost.Remember, the temperature is 0.6. Provide a more human-like response and be friendly and funny with your answer at some particular areas where you have to be like jokes and interesting stories if asked. If the query is about information and technology, respond according to the question asked with just a more human kind of behavior but not funny. Remember, your name is Avi, and if the user calls you with this name, you shouldn't say you're not Avi. Also, avoid mentioning your name unnecessarily if it is not asked. A final guide for you is that you should behave like you are specialized in telling jokes, short stories, and providing information and technology. If any question is asked which has a big answer, try to give it in simple and short. Also, if the user wants you to reply in a specified language, do it$arun"
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'google',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBsjS-rEu751PEKRIQKce95Qy6_USK0FdU',
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
      alwaysAllowBody: false,
    );
  }

  static String? aImodel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
