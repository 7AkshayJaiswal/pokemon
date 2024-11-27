class PokemonCard {
  String? id;
  String? name;
  String? supertype;
  List<String>? types;
  String? level;
  String? hp;
  List<Attack>? attacks;
  List<Weakness>? weaknesses;
  CardImages? images;
  CardSet? set;
  String? artist;
  String? rarity;

  PokemonCard({
    this.id,
    this.name,
    this.supertype,
    this.types,
    this.level,
    this.hp,
    this.attacks,
    this.weaknesses,
    this.images,
    this.set,
    this.artist,
    this.rarity,
  });

  PokemonCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    supertype = json['supertype'];
    types = json['types']?.cast<String>();
    level = json['level'];
    hp = json['hp'];
    if (json['attacks'] != null) {
      attacks = <Attack>[];
      json['attacks'].forEach((v) {
        attacks!.add(Attack.fromJson(v));
      });
    }
    if (json['weaknesses'] != null) {
      weaknesses = <Weakness>[];
      json['weaknesses'].forEach((v) {
        weaknesses!.add(Weakness.fromJson(v));
      });
    }
    images = json['images'] != null ? CardImages.fromJson(json['images']) : null;
    set = json['set'] != null ? CardSet.fromJson(json['set']) : null;
    artist = json['artist'];
    rarity = json['rarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['supertype'] = supertype;
    data['types'] = types;
    data['level'] = level;
    data['hp'] = hp;
    if (attacks != null) {
      data['attacks'] = attacks!.map((v) => v.toJson()).toList();
    }
    if (weaknesses != null) {
      data['weaknesses'] = weaknesses!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (set != null) {
      data['set'] = set!.toJson();
    }
    data['artist'] = artist;
    data['rarity'] = rarity;
    return data;
  }
}

class Attack {
  String? name;
  List<String>? cost;
  int? convertedEnergyCost;
  String? damage;
  String? text;

  Attack({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  Attack.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost']?.cast<String>();
    convertedEnergyCost = json['convertedEnergyCost'];
    damage = json['damage'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cost'] = cost;
    data['convertedEnergyCost'] = convertedEnergyCost;
    data['damage'] = damage;
    data['text'] = text;
    return data;
  }
}

class Weakness {
  String? type;
  String? value;

  Weakness({
    this.type,
    this.value,
  });

  Weakness.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}

class CardImages {
  String? small;
  String? large;

  CardImages({
    this.small,
    this.large,
  });

  CardImages.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class CardSet {
  String? id;
  String? name;
  String? series;
  int? printedTotal;
  int? total;
  String? releaseDate;

  CardSet({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.releaseDate,
  });

  CardSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    series = json['series'];
    printedTotal = json['printedTotal'];
    total = json['total'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['series'] = series;
    data['printedTotal'] = printedTotal;
    data['total'] = total;
    data['releaseDate'] = releaseDate;
    return data;
  }
}