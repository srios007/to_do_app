class TableNames {
  factory TableNames() {
    return _instance;
  }

  TableNames._internal();

  static final _instance = TableNames._internal();

  static const String inspectionsTypes = 'INSPECTIONS_TYPES';
  static const String locations = 'LOCATIONS';
  static const String names = 'NAMES';
  static const String projects = 'PROJECTS';
  static const String dynamicForms = 'DYNAMIC_FORMS';
  static const String dynamicFormOptions = 'DYNAMIC_FORM_OPTIONS';
  static const String inspectionsCheck = 'INSPECTIONS_CHECK';
  static const String secondTitles = 'SECOND_TITLES';
  static const String checks = 'CHECKS';
  static const String options = 'OPTIONS';
  static const String matrix = 'MATRIX';
  static const String matrixOptions = 'MATRIX_OPTIONS';
  static const String preoperationalTypes = 'PREOPERATIONAL_TYPES';
  static const String vehicles = 'VEHICLES';
  static const String drivers = 'DRIVERS';
  static const String inspectionTableItem = 'INSPECTION_TABLE_ITEM';
  static const String preoperationalTableItem = 'PREOPERATIONAL_TABLE_ITEM';
  static const String totalTables = 'TOTAL_TABLES';
}
