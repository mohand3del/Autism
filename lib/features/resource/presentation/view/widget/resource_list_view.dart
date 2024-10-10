
import 'package:flutter/material.dart';

import '../../../data/model/recource_response_body.dart';
import '../wep_view.dart';
import 'resource_list_item.dart';

class ResourceListView extends StatelessWidget {
  const ResourceListView({super.key, this.data, this.scrollController});
  final List<FullDatum>? data;
  final ScrollController? scrollController;


  @override
  Widget build(BuildContext context) {
    return Expanded(

        child: ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewScreen(url: data?[index].link ?? ""),
              ),
            );
          },
          child: ResourceListItem(

            data: data?[index],
          ),
        ), itemCount: data?.length,));
  }
}
