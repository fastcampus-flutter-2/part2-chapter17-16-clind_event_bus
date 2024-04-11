import 'package:community_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';

class CommunityChannelChip extends ClindChannelChip {
  CommunityChannelChip({
    required super.imageUrl,
    required super.name,
    required super.onTap,
  });

  factory CommunityChannelChip.item(
    Channel channel, {
    required VoidCallback onTap,
  }) {
    return CommunityChannelChip(
      imageUrl: channel.imageUrl,
      name: channel.name,
      onTap: onTap,
    );
  }
}

class CommunityLoadingChannelListView extends StatelessWidget {
  const CommunityLoadingChannelListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) => const ClindLoadingChannelChip(),
      separatorBuilder: (context, index) => const SizedBox(
        width: 6.0,
      ),
    );
  }
}

class CommunityChannelListView extends StatelessWidget {
  final List<Channel> items;
  final Function(Channel) onTap;

  const CommunityChannelListView({
    super.key,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => CommunityChannelChip.item(
        items[index],
        onTap: () => onTap.call(items[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 6.0,
      ),
    );
  }
}