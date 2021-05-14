class Slots{
  int available_capacity;
  String date;
  int min_age_limit;
  String session_id;
  List<String> slots;
  String vaccine;

  String address;
  String block_name;
  int center_id;
  String district_name;
  String fee_type;
  String from;
  int lat;
  int long;
  String name;
  int pincode;
  String state_name;
  String to;

  Slots(
      {this.available_capacity,
        this.date,
        this.min_age_limit,
        this.session_id,
        this.slots,
        this.vaccine,
        this.address,
        this.block_name,
        this.center_id,
        this.district_name,
        this.fee_type,
        this.from,
        this.lat,
        this.long,
        this.name,
        this.pincode,
        this.state_name,
        this.to
      });
}