import 'package:flutter/material.dart';

class InfiniteGrid extends StatefulWidget {
  final int crossAxisCount;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool loading;
  final bool hasNext;
  final Function() nextData;
  final String emptyText;
  final EdgeInsets padding;

  const InfiniteGrid({
    Key key,
    this.itemCount,
    this.itemBuilder,
    this.hasNext,
    this.nextData,
    this.emptyText = 'Vazio',
    this.loading = false,
    this.crossAxisCount = 2,
    this.padding = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  _InfiniteGridState createState() => _InfiniteGridState();
}

class _InfiniteGridState extends State<InfiniteGrid> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading && widget.itemCount == 0) {
      return Center(child: CircularProgressIndicator());
    }

    if (widget.itemCount == 0) {
      return Center(child: Text(widget.emptyText ?? ''));
    }

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          _buildGridView(),
          _buildNextDataLoading(),
        ],
      ),
    );
  }

  _buildGridView() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      padding: widget.padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
      ),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }

  _buildNextDataLoading() {
    if (widget.loading && widget.itemCount != 0) {
      return Container(
        height: 100.0,
        padding: const EdgeInsets.all(20.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox();
  }
}
