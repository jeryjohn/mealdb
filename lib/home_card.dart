import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String id;
  final String label1;
  final String image;
  final Function() ontap;

  const HomeCard({
    super.key,
    required this.id,
    required this.label1,
    required this.image,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    id.toString(),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 20),
                child: Align(alignment: Alignment.topLeft, child: Text(label1)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  image,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
