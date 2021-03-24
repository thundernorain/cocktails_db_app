import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final String name;
  final String? image;

  const GridCard({Key? key, required this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Text(
              name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
