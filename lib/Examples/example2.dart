import 'package:stagiaire/Data/data.dart';
import 'package:stagiaire/SwipeAnimation/gesture_card_deck.dart';
import 'package:flutter/material.dart';

class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureCardDeck(
      isButtonFixed: true,
      fixedButtonPosition: Offset(50, 580),
      data: imageData,
      animationTime: Duration(milliseconds: 500),
      showAsDeck: true,
      velocityToSwipe: 1200,
      leftSwipeButton: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Color.fromRGBO(61, 135, 160, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        child:
            Center(child: Text("SUPER", style: TextStyle(color: Colors.white))),
      ),
      rightSwipeButton: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Color.fromRGBO(95, 169, 194, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        child:
            Center(child: Text("J'AIME", style: TextStyle(color: Colors.white))),
      ),
      onSwipeLeft: (index) {
        print("on swipe left");
        print(index);
      },
      onSwipeRight: (index) {
        print("on swipe right");
        print(index);
      },
      onCardTap: (index) {
        print("on card tap");
        print(index);
      },
      leftPosition: 10,
      topPosition: 50,
      leftSwipeBanner: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Transform.rotate(
          angle: 0.5,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("SUPER",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
      rightSwipeBanner: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Transform.rotate(
          angle: -0.5,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.indigo, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("J'AIME",
                  style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
