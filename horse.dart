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

  Horse(List<String> nouns, List<String> adj) {
    var random = Random();

    maxSpeed = random.nextInt(91) + 10;
    maxStamina = random.nextInt(10)+1;
    acceleration = random.nextInt(10)+1;
    luck = random.nextInt(10)+1;

    currentStamina = maxStamina;

    int temp = random.nextInt(2);

    if(temp == 0) {
      name = nouns[random.nextInt(nouns.length)];

    }else {
      String rAdj = adj[random.nextInt(adj.length)];
      String rNoun = nouns[random.nextInt(nouns.length)];

      name = rAdj + " " + rNoun;
    }

  }

  void printHorseInfo() {
    print("Name: $name | Max Speed: $maxSpeed | Max Stamina: $maxStamina | Accel: $acceleration | Luck: $luck");
  }
}

// TODO: Read from nouns.txt and adj.txt for the name
    void main() async {
      List<String> nContents = [];
      List<String> aContents = [];

      final nFile = File('nouns.txt');
      final aFile = File('adj.txt');

      if(await nFile.exists()){
        nContents = await nFile.readAsLines();
      } else {
        print('File not found');
      }

      if(await aFile.exists()){
        aContents = await aFile.readAsLines();
      } else {
        print('File not found');
      }

      Horse horse = Horse(nContents, aContents);
      horse.printHorseInfo();

    }