// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BarbermanWidget extends StatefulWidget {
  final String imgpath;
  final String name;
  final void Function(String) tapHandler;
  final bool isSelected;
  const BarbermanWidget({
    Key? key,
    required this.imgpath,
    required this.name,
    required this.tapHandler,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<BarbermanWidget> createState() => _BarbermanWidgetState();
}

class _BarbermanWidgetState extends State<BarbermanWidget> {
  Color getSlectedbarber() {
    if (widget.isSelected) {
      return Colors.green.withOpacity(0.3);
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: AssetImage(widget.imgpath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.tapHandler(widget.name);
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: getSlectedbarber(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          widget.name,
          style: const TextStyle(
            fontFamily: 'FiraSans',
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
