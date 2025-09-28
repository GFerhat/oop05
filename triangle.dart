enum UnitOfMesurement {
  mm(1),
  cm(10),
  dm(100),
  m(1000),
  inch(25.4),
  ft(304.8);

  final double factorToMm;
  const UnitOfMesurement(this.factorToMm);
}

//class:
class Triangle {
  double _heightInMm, _widthInMm;
  UnitOfMesurement unitOfMesurement;

  Triangle._internal(this._heightInMm, this._widthInMm, this.unitOfMesurement) {
    if (_heightInMm <= 0 && _widthInMm <= 0)
      throw Exception("invalid height & width");
    if (_heightInMm <= 0) throw Exception("invalid height");
    if (_widthInMm <= 0) throw Exception("invalid width");
  }

  factory Triangle.mm(double height, double width) =>
      Triangle._internal(height, width, UnitOfMesurement.mm);

  factory Triangle.cm(double height, double width) => Triangle._internal(
    height * UnitOfMesurement.cm.factorToMm,
    width * UnitOfMesurement.cm.factorToMm,
    UnitOfMesurement.cm,
  );

  factory Triangle.dm(double height, double width) => Triangle._internal(
    height * UnitOfMesurement.dm.factorToMm,
    width * UnitOfMesurement.dm.factorToMm,
    UnitOfMesurement.dm,
  );

  factory Triangle.m(double height, double width) => Triangle._internal(
    height * UnitOfMesurement.m.factorToMm,
    width * UnitOfMesurement.m.factorToMm,
    UnitOfMesurement.m,
  );

  factory Triangle.inch(double height, double width) => Triangle._internal(
    height * UnitOfMesurement.inch.factorToMm,
    width * UnitOfMesurement.inch.factorToMm,
    UnitOfMesurement.inch,
  );

  factory Triangle.ft(double height, double width) => Triangle._internal(
    height * UnitOfMesurement.ft.factorToMm,
    width * UnitOfMesurement.ft.factorToMm,
    UnitOfMesurement.ft,
  );



  factory Triangle.byUnitOfMesurement(
    double height,
    double width,
    UnitOfMesurement unitOfMesurement,
  ) {
    switch (unitOfMesurement) {
      case UnitOfMesurement.mm:
        return Triangle.mm(height, width);
      case UnitOfMesurement.cm:
        return Triangle.cm(height, width);
      case UnitOfMesurement.dm:
        return Triangle.dm(height, width);
      case UnitOfMesurement.m:
        return Triangle.m(height, width);
      case UnitOfMesurement.inch:
        return Triangle.inch(height, width);
      case UnitOfMesurement.ft:
        return Triangle.ft(height, width);
    }
  }

  String calcArea() {
    double areaInMm2 = 0.5 * _heightInMm * _widthInMm;
    switch (unitOfMesurement) {
      case UnitOfMesurement.mm:
        return "$areaInMm2 mm";
      case UnitOfMesurement.cm:
        return '${areaInMm2 / (UnitOfMesurement.cm.factorToMm * UnitOfMesurement.cm.factorToMm)}cm'; //area in cm
      case UnitOfMesurement.dm:
        return '${areaInMm2 / (UnitOfMesurement.dm.factorToMm * UnitOfMesurement.dm.factorToMm)}dm'; //area in dm
      case UnitOfMesurement.m:
        return '${areaInMm2 / (UnitOfMesurement.m.factorToMm * UnitOfMesurement.m.factorToMm)}m';
      case UnitOfMesurement.inch:
        return '${areaInMm2 / (UnitOfMesurement.inch.factorToMm * UnitOfMesurement.inch.factorToMm)}inch';
      case UnitOfMesurement.ft:
        return '${areaInMm2 / (UnitOfMesurement.ft.factorToMm * UnitOfMesurement.ft.factorToMm)}feet';
    }
  }



  double get heightInCm => _heightInMm / UnitOfMesurement.cm.factorToMm;
  set heightInCm(double height) {
    _validate(height);
    _heightInMm = height * UnitOfMesurement.cm.factorToMm;
  }

  double get heightInDm => _heightInMm / UnitOfMesurement.dm.factorToMm;
  set heightInDm(double height) {
    _validate(height);
    _heightInMm = height * UnitOfMesurement.dm.factorToMm;
  }

  double get heightInM => _heightInMm / UnitOfMesurement.m.factorToMm;
  set heightInM(double height) {
    _validate(height);
    _heightInMm = height * UnitOfMesurement.m.factorToMm;
  }

  double get heightInInch => _heightInMm / UnitOfMesurement.inch.factorToMm;
  set heightInInch(double height) {
    _validate(height);
    _heightInMm = height * UnitOfMesurement.inch.factorToMm;
  }

  double get heightInFt => _heightInMm / UnitOfMesurement.ft.factorToMm;
  set heightInFt(double height) {
    _validate(height);
    _heightInMm = height * UnitOfMesurement.ft.factorToMm;
  }

  double get widthInCm => _widthInMm / UnitOfMesurement.cm.factorToMm;
  set widthInCm(double width) {
    _validate(width);
    _widthInMm = width * UnitOfMesurement.cm.factorToMm;
  }

  double get widthInDm => _widthInMm / UnitOfMesurement.dm.factorToMm;
  set widthInDm(double width) {
    _validate(width);
    _widthInMm = width * UnitOfMesurement.dm.factorToMm;
  }

  double get widthInM => _widthInMm / UnitOfMesurement.m.factorToMm;
  set widthInM(double width) {
    _validate(width);
    _widthInMm = width * UnitOfMesurement.m.factorToMm;
  }

  double get widthInInch => _widthInMm / UnitOfMesurement.inch.factorToMm;
  set widthInInch(double width) {
    _validate(width);
    _widthInMm = width * UnitOfMesurement.inch.factorToMm;
  }

  double get widthInFt => _widthInMm / UnitOfMesurement.ft.factorToMm;
  set widthInFt(double width) {
    _validate(width);
    _widthInMm = width * UnitOfMesurement.ft.factorToMm;
  }

  _validate(double value) {
    if (value <= 0) {
      throw Exception("invalid number");
    }
  }
  //Teil der Aufgabe 5 
  double get area {
  double areaInMm2 = 0.5 * _heightInMm * _widthInMm;
  switch (unitOfMesurement) {
    case UnitOfMesurement.mm:
      return areaInMm2; // Fläche in mm²
    case UnitOfMesurement.cm:
      return areaInMm2 / (UnitOfMesurement.cm.factorToMm * UnitOfMesurement.cm.factorToMm);
    case UnitOfMesurement.dm:
      return areaInMm2 / (UnitOfMesurement.dm.factorToMm * UnitOfMesurement.dm.factorToMm);
    case UnitOfMesurement.m:
      return areaInMm2 / (UnitOfMesurement.m.factorToMm * UnitOfMesurement.m.factorToMm);
    case UnitOfMesurement.inch:
      return areaInMm2 / (UnitOfMesurement.inch.factorToMm * UnitOfMesurement.inch.factorToMm);
    case UnitOfMesurement.ft:
      return areaInMm2 / (UnitOfMesurement.ft.factorToMm * UnitOfMesurement.ft.factorToMm);
  }
}
double getHeight(UnitOfMesurement uom) {//uom = UnitOfMesurement
  switch (uom) {
    case UnitOfMesurement.mm:
      return _heightInMm;
    case UnitOfMesurement.cm:
      return _heightInMm / UnitOfMesurement.cm.factorToMm;
    case UnitOfMesurement.dm:
      return _heightInMm / UnitOfMesurement.dm.factorToMm;
    case UnitOfMesurement.m:
      return _heightInMm / UnitOfMesurement.m.factorToMm;
    case UnitOfMesurement.inch:
      return _heightInMm / UnitOfMesurement.inch.factorToMm;
    case UnitOfMesurement.ft:
      return _heightInMm / UnitOfMesurement.ft.factorToMm;
  }
}

void setHeight(UnitOfMesurement uom, int value) {
  double valueDouble = value.toDouble();
  switch (uom) {
    case UnitOfMesurement.mm:
      _heightInMm = valueDouble;
      break;
    case UnitOfMesurement.cm:
      _heightInMm = valueDouble * UnitOfMesurement.cm.factorToMm;
      break;
    case UnitOfMesurement.dm:
      _heightInMm = valueDouble * UnitOfMesurement.dm.factorToMm;
      break;
    case UnitOfMesurement.m:
      _heightInMm = valueDouble * UnitOfMesurement.m.factorToMm;
      break;
    case UnitOfMesurement.inch:
      _heightInMm = valueDouble * UnitOfMesurement.inch.factorToMm;
      break;
    case UnitOfMesurement.ft:
      _heightInMm = valueDouble * UnitOfMesurement.ft.factorToMm;
      break;
  }
}
}
