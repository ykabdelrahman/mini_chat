import 'package:flutter/material.dart';
import 'widgets/add_status_item.dart';
import 'widgets/recent_updates_list.dart';
import 'widgets/status_app_bar.dart';
import 'widgets/status_section_text.dart';
import 'widgets/viewed_updates_list.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: StatusAppBar()),
          SliverToBoxAdapter(child: AddStatusItem()),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: StatusSectionText(title: 'Recent updates'),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          RecentUpdatesList(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: StatusSectionText(title: 'Viewed updates'),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          ViewedUpdatesList(),
        ],
      ),
    );
  }
}
