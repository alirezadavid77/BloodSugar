class BloodSugarResultEntity {
  final String bloodSugarId;
  final String patientId;
  final String assignDate;
  final String measureTime;
  final int bloodSugar;
  final String measureState;
  final String quantifier;
  final int method;
  final String persistenceTime;
  final int tag;


  BloodSugarResultEntity({
    required this.bloodSugarId,
    required this.patientId,
    required this.assignDate,
    required this.measureState,
    required this.measureTime,
    required this.method,
    required this.persistenceTime,
    required this.bloodSugar,
    required this.tag,
    required this.quantifier,
  });
}
