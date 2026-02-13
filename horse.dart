import 'dart:math';
import 'dart:io';

class Horse {
  // variables
  double currentDistance = 0;
  double currentSpeed = 0;

  late int currentStamina;
  late int maxStamina;
  late int maxSpeed;
  late int acceleration;
  late int luck;
  late String name;

  Horse() {
    var random = Random();

    maxSpeed = random.nextInt(91) + 10;
    maxStamina = random.nextInt(10)+1;
    acceleration = random.nextInt(10)+1;
    luck = random.nextInt(10)+1;

    currentStamina = maxStamina;

    
    // TODO: Read from nouns.txt and adj.txt for the name
  }

  void printHorseInfo() {
    print("Name: $name | Max Speed: $maxSpeed | Max Stamina: $maxStamina | Accel: $acceleration | Luck: $luck");
  }
}