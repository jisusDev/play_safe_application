import 'package:flutter/material.dart';

class PSImageCenterAndText extends StatelessWidget {
  const PSImageCenterAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            "assets/images/bro.png",
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              "No hay jugadores activos actualmente",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF3C6E71)
              ),
            ),
          ),
        )
      ],
    );
  }
}
