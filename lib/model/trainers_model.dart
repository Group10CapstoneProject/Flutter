class TrainerModel {
  final String name;
  final String picture;
  final String avatar;
  final double rating;
  final List skill;
  final int price;
  final String description;
  final int experience;

  TrainerModel(
    this.name,
    this.picture,
    this.avatar,
    this.rating,
    this.skill,
    this.price,
    this.description,
    this.experience,
  );
}

final List<TrainerModel> dataTrainer = [
  TrainerModel(
    'Dika Pramudya',
    'assets/trainer/pelatih1.png',
    'assets/trainer/Foto.png',
    5.5,
    [
      'Coordination & Balance',
      'Tone',
      'KickBoxing',
    ],
    275000,
    'Personal Trainer yang merupakan lulusan Fakultas Pendidikan Olahraga dan Kesehatan UPI Bandung 2007. Atlet dan pelatih Gulat. Sertifikasi pelatih ',
    4,
  ),
  TrainerModel(
    'Mark William',
    'assets/trainer/pelatih2.png',
    'assets/trainer/Foto.png',
    4.5,
    [
      'Endurance',
      'Tone & Shape',
      'Power Strengh',
    ],
    150000,
    '-',
    0,
  ),
  TrainerModel(
    'Ammy Novarianti',
    'assets/trainer/pelatih3.png',
    'assets/trainer/Foto.png',
    5.5,
    [
      'Core',
      'Tone & Shape',
      'Rehab',
    ],
    250000,
    '-',
    0,
  ),
  TrainerModel(
    'Redy Indra',
    'assets/trainer/pelatih4.png',
    'assets/trainer/Foto.png',
    4.5,
    [
      'Power Strengh',
      'Tone & Shape',
    ],
    500000,
    '-',
    0,
  ),
];
