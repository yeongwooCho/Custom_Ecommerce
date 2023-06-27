import 'package:flutter/material.dart';

class CustomProductListScreen extends StatefulWidget {
  final List<String> items;
  final bool isScroll;

  const CustomProductListScreen({
    Key? key,
    required this.items,
    required this.isScroll,
  }) : super(key: key);

  @override
  State<CustomProductListScreen> createState() =>
      _CustomProductListScreenState();
}

class _CustomProductListScreenState extends State<CustomProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: widget.isScroll ? null : NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 16 / 27,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) => Card(
        elevation: 8,
        child: GridTile(
          child: Center(
            child: Text(
              widget.items[index],
              style: const TextStyle(fontSize: 16),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black38,
            title: const Text('footer'),
            subtitle: Text('Item '),
          ),
        ),
      ),
    );
  }
}
