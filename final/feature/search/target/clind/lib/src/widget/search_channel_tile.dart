import 'package:search_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';

class SearchChannelTile extends ClindChannelTile {
  SearchChannelTile({
    required super.imageUrl,
    required super.name,
    super.followCount,
    required super.onTap,
    super.onDelete,
  });

  factory SearchChannelTile.item(
    Channel channel, {
    required VoidCallback onTap,
    VoidCallback? onDelete,
  }) {
    return SearchChannelTile(
      imageUrl: channel.imageUrl,
      name: channel.name,
      followCount: channel.followCount,
      onTap: onTap,
      onDelete: onDelete,
    );
  }
}
