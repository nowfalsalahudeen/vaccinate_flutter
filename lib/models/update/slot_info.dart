class SlotInfo {
    List<SlotInfoX> slot_info;

    SlotInfo({this.slot_info});

    factory SlotInfo.fromJson(Map<String, dynamic> json) {
        return SlotInfo(
            slot_info: json['slot_info'] != null ? (json['slot_info'] as List).map((i) => SlotInfoX.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.slot_info != null) {
            data['slot_info'] = this.slot_info.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class SlotInfoX {
    String date;
    int slots;

    SlotInfoX({this.date, this.slots});

    factory SlotInfoX.fromJson(Map<String, dynamic> json) {
        return SlotInfoX(
            date: json['date'],
            slots: json['slots'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['slots'] = this.slots;
        return data;
    }
}



class SlotInfoDetail {
    List<SlotInfoDetailX> slotInfoDetail;

    SlotInfoDetail({this.slotInfoDetail});

    factory SlotInfoDetail.fromJson(Map<String, dynamic> json) {
        return SlotInfoDetail(
            slotInfoDetail: json['data'] != null ? (json['data'] as List).map((i) => SlotInfoDetailX.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.slotInfoDetail != null) {
            data['data'] = this.slotInfoDetail.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class SlotInfoDetailX {
    int available_capacity;
    CenterAddress center_address;
    int center_id;
    String center_name;
    String fee;
    String fee_type;
    String from_time;
    int min_age_limit;
    int slot_id;
    String to_time;
    String vaccine;

    SlotInfoDetailX({this.available_capacity, this.center_address, this.center_id, this.center_name, this.fee, this.fee_type, this.from_time, this.min_age_limit, this.slot_id, this.to_time, this.vaccine});

    factory SlotInfoDetailX.fromJson(Map<String, dynamic> json) {
        return SlotInfoDetailX(
            available_capacity: json['available_capacity'],
            center_address: json['center_address'] != null ? CenterAddress.fromJson(json['center_address']) : null,
            center_id: json['center_id'],
            center_name: json['center_name'],
            fee: json['fee'],
            fee_type: json['fee_type'],
            from_time: json['from_time'],
            min_age_limit: json['min_age_limit'],
            slot_id: json['slot_id'],
            to_time: json['to_time'],
            vaccine: json['vaccine'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['available_capacity'] = this.available_capacity;
        data['center_id'] = this.center_id;
        data['center_name'] = this.center_name;
        data['fee'] = this.fee;
        data['fee_type'] = this.fee_type;
        data['from_time'] = this.from_time;
        data['min_age_limit'] = this.min_age_limit;
        data['slot_id'] = this.slot_id;
        data['to_time'] = this.to_time;
        data['vaccine'] = this.vaccine;
        if (this.center_address != null) {
            data['center_address'] = this.center_address.toJson();
        }
        return data;
    }
}

class CenterAddress {
    String block_name;
    String district_name;
    int pincode;
    String state_name;

    CenterAddress({this.block_name, this.district_name, this.pincode, this.state_name});

    factory CenterAddress.fromJson(Map<String, dynamic> json) {
        return CenterAddress(
            block_name: json['block_name'],
            district_name: json['district_name'],
            pincode: json['pincode'],
            state_name: json['state_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['block_name'] = this.block_name;
        data['district_name'] = this.district_name;
        data['pincode'] = this.pincode;
        data['state_name'] = this.state_name;
        return data;
    }
}



//sds


class InfoData {
    List<Data> data;

    InfoData({this.data});

    factory InfoData.fromJson(Map<String, dynamic> json) {
        return InfoData(
            data: json['`data`'] != null ? (json['`data`'] as List).map((i) => Data.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.data != null) {
            data['`data`'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    int available_capacity;
    CenterAddress center_address;
    int center_id;
    String center_name;
    String fee;
    String fee_type;
    String from_time;
    int min_age_limit;
    int slot_id;
    String to_time;
    String vaccine;

    Data({this.available_capacity, this.center_address, this.center_id, this.center_name, this.fee, this.fee_type, this.from_time, this.min_age_limit, this.slot_id, this.to_time, this.vaccine});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            available_capacity: json['available_capacity'],
            center_address: json['center_address'] != null ? CenterAddress.fromJson(json['center_address']) : null,
            center_id: json['center_id'],
            center_name: json['center_name'],
            fee: json['fee'],
            fee_type: json['fee_type'],
            from_time: json['from_time'],
            min_age_limit: json['min_age_limit'],
            slot_id: json['slot_id'],
            to_time: json['to_time'],
            vaccine: json['vaccine'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['available_capacity'] = this.available_capacity;
        data['center_id'] = this.center_id;
        data['center_name'] = this.center_name;
        data['fee'] = this.fee;
        data['fee_type'] = this.fee_type;
        data['from_time'] = this.from_time;
        data['min_age_limit'] = this.min_age_limit;
        data['slot_id'] = this.slot_id;
        data['to_time'] = this.to_time;
        data['vaccine'] = this.vaccine;
        if (this.center_address != null) {
            data['center_address'] = this.center_address.toJson();
        }
        return data;
    }
}

