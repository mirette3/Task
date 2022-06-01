class MainModel {
  List<SearchModel>? search;

  MainModel.fromJson(List<dynamic> json) {
    if (json != null) {
      search = <SearchModel>[];
      json.forEach((v) {
        search!.add(SearchModel.fromJson(v));
      });
    }
  }
  // Map<String, List?> toJson() => {
  //       " ": search == null
  //           ? null
  //           : List<dynamic>.from(search!.map((x) => x.toJson()).toList())
  //     };
}

class SearchModel {
  int? id;
  String? name;
  String? fullName;
  Owner? owner;

  SearchModel({
    this.id,
    this.name,
    this.fullName,
    this.owner,
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['full_name'] = fullName;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }

    return data;
  }
}

class Owner {
  int? id;
  String? avatarUrl;

  Owner({
    this.id,
    this.avatarUrl,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
