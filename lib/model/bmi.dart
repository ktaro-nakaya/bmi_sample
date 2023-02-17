
class BMI{
  final double bmi;
  final String shape;

  const BMI(this.bmi, this.shape,);

  Map<String, dynamic> toMap() {
    return {
      'bmi': this.bmi,
      'shape': this.shape,
    };
  }

  BMI.fromJson(Map<String, dynamic> map)
  : bmi= map['bmi'], shape= map['shape'];
}