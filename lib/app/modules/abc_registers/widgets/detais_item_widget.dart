import 'package:flutter/material.dart';

class DetailsItemWidget extends StatelessWidget {
  final double titleSize;
  final double contentSize;
  final bool isLast;
  final String title;
  final String content;
  DetailsItemWidget({
    this.titleSize = 25,
    this.contentSize = 20,
    this.isLast = false,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 20,
          thickness: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                "$title",
                style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Text(
                "$content",
                style: TextStyle(fontSize: contentSize),
              ),
              if (isLast)
                const Divider(
                  height: 20,
                  thickness: 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
