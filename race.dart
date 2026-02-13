import 'horse.dart';
import 'dart:math';

class Race {
  List<Horse> horses;
  int raceDistance;
  
  Race(this.horses, this.raceDistance);

  List<Horse> runRace() {

    //refresh stats
    for (var horse in horses) {
      horse.currentStamina = horse.maxStamina;
      horse.currentDistance = 0;
      horse.currentSpeed = 0;
    }

    List<Horse> winners = [];
    var random = Random();
    
    // play rounds until 3 horses cross
    while (winners.length < 3) {
      for (var horse in horses) {

        if (winners.contains(horse)) continue; //skip already finished horses

        horse.currentStamina--; //decrease stamina by 1

        //if stamina not 0 then accelerate
        if (horse.currentStamina >= 0) {
          horse.currentSpeed += horse.acceleration;
        }

        //cap speed to max
        if (horse.currentSpeed > horse.maxSpeed) {
          horse.currentSpeed = horse.maxSpeed.toDouble();
        }

        int roll = random.nextInt(11); //luck check
      
        if (roll <= horse.luck) {
          horse.currentDistance += horse.currentSpeed; //if doesnt stumble
        }

        //check for finish line
        if (horse.currentDistance >= raceDistance) {
          winners.add(horse);
        }

      }
    }

    return winners;

  }
}