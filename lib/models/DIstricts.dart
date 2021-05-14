


class DistrictByState {
    List<DistrictNyStateItem> districts;
    int ttl;

    DistrictByState({this.districts, this.ttl});

    factory DistrictByState.fromJson(Map<String, dynamic> json) {
        return DistrictByState(
            districts: json['districts'] != null ? (json['districts'] as List).map((i) => DistrictNyStateItem.fromJson(i)).toList() : null,
            ttl: json['ttl'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ttl'] = this.ttl;
        if (this.districts != null) {
            data['districts'] = this.districts.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class DistrictNyStateItem {
    int district_id;

    @override
  String toString() {
    return '$district_name';
  }

  String district_name;

    DistrictNyStateItem({this.district_id, this.district_name});

    factory DistrictNyStateItem.fromJson(Map<String, dynamic> json) {
        return DistrictNyStateItem(
            district_id: json['district_id'],
            district_name: json['district_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['district_id'] = this.district_id;
        data['district_name'] = this.district_name;
        return data;
    }
}

//centers

class Districts {
  List<CenterItem> centers;

  Districts({this.centers});

  factory Districts.fromJson(Map<String, dynamic> json) {
    return Districts(
      centers: json['centers'] != null
          ? (json['centers'] as List)
              .map((i) => CenterItem.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.centers != null) {
      data['centers'] = this.centers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CenterItem {
  String address;
  String block_name;
  int center_id;
  String district_name;
  String fee_type;
  String from;

  @override
  String toString() {
    return '$name';
  }

  int lat;
  int long;
  String name;
  int pincode;
  List<SessionItem> sessions;
  String state_name;
  String to;

  CenterItem(
      {this.address,
      this.block_name,
      this.center_id,
      this.district_name,
      this.fee_type,
      this.from,
      this.lat,
      this.long,
      this.name,
      this.pincode,
      this.sessions,
      this.state_name,
      this.to});

  factory CenterItem.fromJson(Map<String, dynamic> json) {
    return CenterItem(
      address: json['address'],
      block_name: json['block_name'],
      center_id: json['center_id'],
      district_name: json['district_name'],
      fee_type: json['fee_type'],
      from: json['from'],
      lat: json['lat'],
      long: json['long'],
      name: json['name'],
      pincode: json['pincode'],
      sessions: json['sessions'] != null
          ? (json['sessions'] as List)
              .map((i) => SessionItem.fromJson(i))
              .toList()
          : null,
      state_name: json['state_name'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['block_name'] = this.block_name;
    data['center_id'] = this.center_id;
    data['district_name'] = this.district_name;
    data['fee_type'] = this.fee_type;
    data['from'] = this.from;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['name'] = this.name;
    data['pincode'] = this.pincode;
    data['state_name'] = this.state_name;
    data['to'] = this.to;
    if (this.sessions != null) {
      data['sessions'] = this.sessions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionItem {
  int available_capacity;
  String date;
  int min_age_limit;
  String session_id;
  List<String> slots;
  String vaccine;

  SessionItem(
      {this.available_capacity,
      this.date,
      this.min_age_limit,
      this.session_id,
      this.slots,
      this.vaccine});

  factory SessionItem.fromJson(Map<String, dynamic> json) {
    return SessionItem(
      available_capacity: json['available_capacity'],
      date: json['date'],
      min_age_limit: json['min_age_limit'],
      session_id: json['session_id'],
      slots:
          json['slots'] != null ? new List<String>.from(json['slots']) : null,
      vaccine: json['vaccine'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available_capacity'] = this.available_capacity;
    data['date'] = this.date;
    data['min_age_limit'] = this.min_age_limit;
    data['session_id'] = this.session_id;
    data['vaccine'] = this.vaccine;
    if (this.slots != null) {
      data['slots'] = this.slots;
    }
    return data;
  }
}
