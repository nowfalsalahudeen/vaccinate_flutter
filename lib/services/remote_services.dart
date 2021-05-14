import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:vaccinate/models/DIstricts.dart';
import 'package:vaccinate/models/States.dart';
import 'package:vaccinate/models/update/slot_info.dart';

class RemoteService {
  static var client = http.Client();
  static var baseUrl = "https://cdn-api.co-vin.in/api/v2/";

  static Future<States> fetchStates() async {
    var response = await client.get("${baseUrl}admin/location/states");
    if (response.statusCode == 200) {
      return statesFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<DistrictByState> fetchDistrictsByStatesId(StateItem stateItem) async {
    var response = await client.get("${baseUrl}admin/location/districts/${stateItem.stateId}");
    // var response = await client.get("${baseUrl}appointment/sessions/public/calendarByDistrict?district_id=${stateItem.stateId}&date=10-05-2021");
    if (response.statusCode == 200) {
      return DistrictByState.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future<Districts> fetchSlots(String districtId, String fetchDate) async {
    var response = await client.get("${baseUrl}appointment/sessions/public/calendarByDistrict?district_id=$districtId&date=${fetchDate}");
    if (response.statusCode == 200) {
      return Districts.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future<SlotInfo> fetchSlotsInfo(String districtName,String districtId, String fetchDate) async {
    var response = await client.get("https://www.healthifyme.com/api/v1/cowin/day_wise_slots?districtName=$districtName&language=en&district_id=$districtId");
    if (response.statusCode == 200) {
      return SlotInfo.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  static Future<SlotInfoDetail> fetchSlotsInfoDetails(String districtName,String districtId, String fetchDate,String stateId) async {
    var response = await client.get("https://www.healthifyme.com/api/v1/cowin/slots?date=$fetchDate&districtName=$districtName&stateId=$stateId&district_id=$districtId&language=en");
    if (response.statusCode == 200) {
      print("${response.body}");
      return SlotInfoDetail.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

}
