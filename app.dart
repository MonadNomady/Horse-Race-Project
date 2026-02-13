import 'dart:io';
import 'horse.dart';
import 'race.dart';

void main() {
  //prompt user for: distance, horses per race, and number of races 
  stdout.write('Enter the distance of the race: ');
  String? raceDistanceInput = stdin.readLineSync();

  stdout.write('Enter the horses per race: ');
  String? horseCountInput = stdin.readLineSync();

  stdout.write('Enter the number of races: ');
  String? numRacesInput = stdin.readLineSync();

  int raceDistance = int.parse(raceDistanceInput!);
  int horseCount = int.parse(horseCountInput!);
  int numRaces = int.parse(numRacesInput!);
  
  //create list of random horses
  List<Horse> participants = List.generate(horseCount, (index) => Horse());

  // 3. Loop through the number of races requested 
  //    - Create the Race 
  Race firstRace = new Race(participants, raceDistance);
  //    - Get winners and print their stats
  List<Horse> winners = firstRace.runRace();
  print("\nRACE 1");
  for(var horse in winners) {
    horse.printHorseInfo();
  }
  print('\n');
  int j = 2;

  //    - Keep winners and fill the rest with new horses 
   for(int i = 1; i < numRaces; i++) {
    int remaining = horseCount - winners.length;
    if(remaining < 0){
      remaining = 0;
    }
    List<Horse> participants = List.generate(remaining, (_) => Horse());
    List<Horse> newP = winners + participants;
    
    Race races = new Race(newP, raceDistance);

    //    - Get winners and print their stats
    winners = races.runRace().take(3).toList();
    print("RACE $j");
    for(var horse in winners) {
      horse.printHorseInfo();
    }
    print('\n');
    j++;
    
  }
  print("FINAL STANDINGS");
  for(var horse in winners) {
    horse.printHorseInfo();
  }

} 