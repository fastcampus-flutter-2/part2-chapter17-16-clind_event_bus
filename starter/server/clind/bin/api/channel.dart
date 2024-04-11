import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  final String id;
  final String imageUrl;
  final String name;
  final int followCount;

  Channel({
    this.id = '',
    this.imageUrl = '',
    this.name = '',
    this.followCount = 0,
  });

  factory Channel.fromJson(Map<String, dynamic> json) => _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

final List<Channel> channels = List.generate(
  10,
  (index) => Channel(
    id: 'channel_$index',
    imageUrl: 'https://source.unsplash.com/random/300×300',
    name: Faker().conference.name(),
    followCount: Random().nextInt(100000000),
  ),
);

var channelHandler = (Request request, String id) async {
  await Future.delayed(const Duration(seconds: 2));

  final Channel channel = channels.firstWhere(
    (item) => item.id == id,
    orElse: () => Channel(),
  );

  return Response.ok(
    jsonEncode(channel.toJson()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};

var channelsHandler = (Request request) async {
  await Future.delayed(const Duration(seconds: 2));

  return Response.ok(
    jsonEncode(channels.map((e) => e.toJson()).toList()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};

var popularChannelsHandler = (Request request) async {
  await Future.delayed(const Duration(seconds: 2));

  return Response.ok(
    jsonEncode(channels.where((e) => e.followCount > 10000).map((e) => e.toJson()).toList()),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    },
  );
};
