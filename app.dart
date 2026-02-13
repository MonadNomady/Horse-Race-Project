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
  //    - Get winners and print their stats
  //    - Keep winners and fill the rest with new horses 
}