import 'triangle.dart';
import 'dart:io';

void main() {
  final inchTriangle = Triangle.mm(30.0, 15.0);
  inchTriangle.heightInCm = 200;
  print("height in cm ${inchTriangle.heightInCm}");
  final inchArea = inchTriangle.calcArea();
  print(inchArea);

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
        // orElse: () => UnitOfMesurement.values.first,
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

void createTriangle(
  double height,
  double width,
  UnitOfMesurement unitOfMesurement,
) {
  final triangle = Triangle.byUnitOfMesurement(height, width, unitOfMesurement);
}
