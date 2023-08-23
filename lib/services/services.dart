// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Services {
//   static const CHANNEL_ID = 'UCOdwZgADx2CnjRwPnMJRYsg';

//   static Future<ChannelInfo?> getChannelInfo() async {
//     final Map<String, String> parameters = {
//       'part': 'snippet,contentDetails,statistics',
//       'id': CHANNEL_ID,
//       'key': Constants.apikey,
//     };

//     final Uri uri =
//         Uri.https('youtube.googleapis.com', '/youtube/v3/channels', parameters);

//     final Map<String, String> headers = {
//       'Content-Type': 'application/json',
//     };

//     try {
//       final http.Response response = await http.get(uri, headers: headers);

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = jsonDecode(response.body);
//         final ChannelInfo channelInfo = ChannelInfo.fromJson(data);
//         return channelInfo;
//       } else {
//         print('Request failed with status: ${response.statusCode}');
//         return null;
//       }
//     } catch (error) {
//       print('Error fetching channel info: $error');
//       return null;
//     }
//   }

//   static Future<VideoList> getVideosList({
//     required String playListId,
//     required String pageToken,
//   }) async {
//     Map<String, String> parameters = {
//       'part': 'snippet',
//       'playlistId': playListId,
//       'maxResults': '8',
//       'pageToken': pageToken,
//       'key': Constants.apikey,
//     };
//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };
//     Uri uri = Uri.https(
//       'youtube.googleapis.com',
//       '/youtube/v3/playlistItems',
//       parameters,
//     );
//     Response response = await http.get(uri, headers: headers);
//     // print(response.body);
//     VideoList videosList = videoListFromJson(response.body);
//     return videosList;
//   }


//   static Future<PlaylistItemResponse> fetchPlaylistItems({int maxResults = 25}) async {
//   const apiKey = Constants.apikey;
//   const playlistId = 'PLbDoEFEEj5kx-Rl0I_OkmsfpWh8KltDmq';
//   final url =
//       'https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$playlistId&key=$apiKey&maxResults=$maxResults';

//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     return PlaylistItemResponse.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load playlist items');
//   }
// }

//  static  Future<PlaylistItemResponseModel> fetchPlaylistVideoItems() async {
//   const apiKey = Constants.apikey;
//   const playlistId = 'PLbDoEFEEj5kz_Lg--IKeHkN9HM9vvKkSL';
//   const url =
//       'https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$playlistId&key=$apiKey';

//   final response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     return PlaylistItemResponseModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load playlist items');
//   }
// }

//   }


// // class ServicesUrl {
// //       final Uri _url = Uri.parse('https://www.youtube.com/playlist?list=PLbDoEFEEj5kx-Rl0I_OkmsfpWh8KltDmq');


// //       Future<void> fetchlaunchUrl() async {
// //   if (!await launchUrl(_url)) {
// //     throw Exception('Could not launch $_url');
// //   }
// // }
