import 'triangle.dart';
import 'dart:io';

void main() {
  var triangle1=Triangle.mm(100, 100);
  print("t1 area ${triangle1.area} mm");

  final triangle2 = Triangle.cm(30.0, 15.0);
  triangle2.heightInInch = 200;
  triangle2.widthInCm=50;
  print("height in cm ${triangle2.heightInCm}");
  final area = triangle2.calcArea();
  print(area);

  //ask user
  double? inputHeight, inputWidth;
  String? inputUnit;
  UnitOfMesurement? unitOfMesurement;
  bool error = false;
  do {
    error = false;
    print("Input the heigt: ");
    inputHeight = double.tryParse(stdin.readLineSync()!);
    if (inputHeight == null || inputHeight <= 0) {
      error = true;
      print("invalid height");
    }
  } while (error);

  do {
    error = false;
    print("input the width");
    inputWidth = double.tryParse(stdin.readLineSync()!);
    if (inputWidth == null || inputWidth <= 0) {
      error = true;
      print("invalid width");
    }
  } while (error);

  do {
    error = false;
    print("input the unit");
    inputUnit = stdin.readLineSync()!;
    try {
      unitOfMesurement = UnitOfMesurement.values.firstWhere(
        (element) =>
            element.toString().split('.').last.toLowerCase() ==
            inputUnit!.toLowerCase(),
      );
    } catch (e) {
      error = true;
    }
  } while (error);

  final triangle = Triangle.byUnitOfMesurement(
    inputHeight!,
    inputWidth!,
    unitOfMesurement!,
  );
  print(triangle.calcArea());
}
