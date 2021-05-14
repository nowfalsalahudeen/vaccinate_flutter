import 'dart:convert';

States statesFromJson(String str) => States.fromJson(json.decode(str));

String statesToJson(States data) => json.encode(data.toJson());

class States {
  States({
    this.states,
    this.ttl,
  });

  List<StateItem> states;
  int ttl;

  factory States.fromJson(Map<String, dynamic> json) => States(
        states: List<StateItem>.from(
            json["states"].map((x) => StateItem.fromJson(x))),
        ttl: json["ttl"],
      );

  Map<String, dynamic> toJson() => {
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
        "ttl": ttl,
      };
}

class StateItem {
  StateItem({
    this.stateId,
    this.stateName,
  });

  @override
  String toString() {
    return '$stateName';
  }

  int stateId;
  String stateName;

  factory StateItem.fromJson(Map<String, dynamic> json) => StateItem(
        stateId: json["state_id"],
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "state_name": stateName,
      };
}
