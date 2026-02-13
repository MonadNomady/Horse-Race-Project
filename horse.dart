import 'dart:math';
import 'dart:io';

final Random random = Random();

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
  static List<String> nContents = [];
  static List<String> aContents = [];
  static bool loaded = false;

  Horse() {
    maxSpeed = random.nextInt(91) + 10;
    maxStamina = random.nextInt(10)+1;
    acceleration = random.nextInt(10)+1;
    luck = random.nextInt(10)+1;

    currentStamina = maxStamina;

    if(!loaded){
      files();
    }

    createName();
  }

  void files() {
    final nFile = File('nouns.txt');
    final aFile = File('adj.txt');

    if(nFile.existsSync()){
      nContents = nFile.readAsLinesSync();
    } else {
      print('File not found');
    }

    if(aFile.existsSync()){
      aContents = aFile.readAsLinesSync();
    } else {
      print('File not found');
    }
    loaded = true;
  }

    void createName(){

      int temp = random.nextInt(2);

      if(temp == 0) {
        name = nContents[random.nextInt(nContents.length)];

      }else {
        String rAdj = aContents[random.nextInt(aContents.length)];
        String rNoun = nContents[random.nextInt(nContents.length)];

        name = rAdj + " " + rNoun;
      }
    }

  void printHorseInfo() {
    print("Name: $name | Max Speed: $maxSpeed | Max Stamina: $maxStamina | Accel: $acceleration | Luck: $luck");
  }
}

// TODO: Read from nouns.txt and adj.txt for the name
  /*  void main() async {
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

      Horse horse = Horse();
      horse.printHorseInfo();

    }*/