class SuperHeroModel {
  final int? id;
  final String? name;
  final String? slug;
  final PowerStats? powerStats;
  final Appearance? appearance;
  final Biography? biography;
  final Work? work;
  final Connections? connections;
  final Images? images;

  SuperHeroModel(
      {this.id,
      this.name,
      this.slug,
      this.powerStats,
      this.appearance,
      this.biography,
      this.work,
      this.connections,
      this.images});
  factory SuperHeroModel.fromJson(Map<String, dynamic> json) {
    return SuperHeroModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      powerStats: json['powerstats'] != null
          ? PowerStats.fromJson(json['powerstats'])
          : null,
      appearance: json['appearance'] != null
          ? Appearance.fromJson(json['appearance'])
          : null,
      biography: json['biography'] != null
          ? Biography.fromJson(json['biography'])
          : null,
      work: json['work'] != null ? Work.fromJson(json['work']) : null,
      connections: json['connections'] != null
          ? Connections.fromJson(json['connections'])
          : null,
      images: json['images'] != null ? Images.fromJson(json['images']) : null,
    );
  }
}

class PowerStats {
  final int? intelligence, strength, speed, durability, power, combat;

  PowerStats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });
  factory PowerStats.fromJson(Map<String, dynamic> json) => PowerStats(
        intelligence: json['intelligence'],
        strength: json['strength'],
        speed: json['speed'],
        durability: json['durability'],
        power: json['power'],
        combat: json['combat'],
      );
  List<MapEntry> get powerState => [
        MapEntry('Intelligence : ', intelligence),
        MapEntry('Strength     : ', strength),
        MapEntry('Speed        : ', speed),
        MapEntry('Durability   : ', durability),
        MapEntry('Power        : ', power),
        MapEntry('Combat       : ', combat),
      ];
}

// {
//   "id": 84,
//   "name": "Bill Harken",
//   "slug": "84-bill-harken",
//   "powerstats": {
//     "intelligence": 63,
//     "strength": 36,
//     "speed": 33,
//     "durability": 60,
//     "power": 27,
//     "combat": 40
//   },
class Appearance {
  final String? gender;
  final String? race;
  final List<dynamic>? height;
  final List<dynamic>? weight;
  final String? eyeColor;
  final String? hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });
  factory Appearance.fromJson(Map<String, dynamic> json) => Appearance(
      gender: json['gender'],
      race: json['race'],
      height: json['height'],
      weight: json['weight'],
      eyeColor: json['eyeColor'],
      hairColor: json['hairColor']);

  List<MapEntry> get appearance => [
        MapEntry('Gender    : ', gender),
        MapEntry('Race      : ', race),
        MapEntry('Height    : ', height),
        MapEntry('Weight    : ', weight),
        MapEntry('EyeColor  : ', eyeColor),
        MapEntry('HairColor : ', hairColor),
      ];
}

//   "appearance": {
//     "gender": "Male",
//     "race": "Alpha",
//     "height": [
//       "-",
//       "0 cm"
//     ],
//     "weight": [
//       "- lb",
//       "0 kg"
//     ],
//     "eyeColor": "-",
//     "hairColor": "-"
//   },
class Biography {
  final String? fullName;
  final String? alterEgos;
  final List<dynamic>? aliases;
  final String? placeOfBirth;
  final String? firstAppearance;
  final String? publisher;
  final String? alignment;

  Biography(
      {this.fullName,
      this.alterEgos,
      this.aliases,
      this.placeOfBirth,
      this.firstAppearance,
      this.publisher,
      this.alignment});
  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
      fullName: json['fullName'],
      alterEgos: json['alterEgos'],
      aliases: json['aliases'],
      placeOfBirth: json['placeOfBirth'],
      firstAppearance: json['firstAppearance'],
      publisher: json['publisher'],
      alignment: json['alignment']);

  List<MapEntry> get biography => [
        MapEntry('FullName         : ', fullName),
        MapEntry('AlterEgos        : ', alterEgos),
        MapEntry('Aliases          : ', aliases),
        MapEntry('PlaceOfBirth     : ', placeOfBirth),
        MapEntry('FirstAppearance  : ', firstAppearance),
        MapEntry('Publisher        : ', publisher),
        MapEntry('Alignment        : ', alignment),
      ];
}

//   "biography": {
//     "fullName": "",
//     "alterEgos": "No alter egos found.",
//     "aliases": [
//       "-"
//     ],
//     "placeOfBirth": "-",
//     "firstAppearance": "-",
//     "publisher": "SyFy",
//     "alignment": "good"
//   },
class Work {
  final String? occupation, baze;

  Work({required this.occupation, required this.baze});
  factory Work.fromJson(Map<String, dynamic> json) =>
      Work(occupation: json['occupation'], baze: json['base']);
  List<MapEntry> get work => [
        MapEntry('Occupation :', occupation),
        MapEntry('Base       :', baze),
      ];
}

//   "work": {
//     "occupation": "-",
//     "base": "-"
//   },
class Connections {
  final String? groupAffiliation, relatives;

  Connections({required this.groupAffiliation, required this.relatives});
  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
      groupAffiliation: json['groupAffiliation'], relatives: json['relatives']);
  List<MapEntry> get connections => [
        MapEntry('RroupAffiliation : ', groupAffiliation),
        MapEntry('Relatives        : ', relatives),
      ];
}

//   "connections": {
//     "groupAffiliation": "Alphas",
//     "relatives": "-"
//   },
class Images {
  final String? xs, sm, md, lg;

  Images(
      {required this.xs, required this.sm, required this.md, required this.lg});
  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(xs: json['xs'], sm: json['sm'], md: json['md'], lg: json['lg']);
}
  //   "images": {
  //     "xs": "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/xs/84-bill-harken.jpg",
  //     "sm": "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/sm/84-bill-harken.jpg",
  //     "md": "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/md/84-bill-harken.jpg",
  //     "lg": "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/lg/84-bill-harken.jpg"
  //   }
  // },