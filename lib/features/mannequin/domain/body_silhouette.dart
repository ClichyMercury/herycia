enum BodySilhouette {
  straight(shoulder: 46, chest: 40, waist: 34, hip: 38),
  hourglass(shoulder: 42, chest: 40, waist: 28, hip: 46),
  broad(shoulder: 52, chest: 50, waist: 46, hip: 50);

  const BodySilhouette({
    required this.shoulder,
    required this.chest,
    required this.waist,
    required this.hip,
  });

  final double shoulder;
  final double chest;
  final double waist;
  final double hip;
}
