import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vaccinate/models/DIstricts.dart';
import 'package:vaccinate/models/Slots.dart';
import 'package:vaccinate/models/update/slot_info.dart';
import 'package:vaccinate/services/remote_services.dart';

class VaccineInfoController extends GetxController {
  var availableSlots = Districts().obs;
  var currentDistrictNameValue = Get.parameters['districtName'];
  var currentDistrictIdValue = Get.parameters['districtId'];
  var currentStateIdValue = Get.parameters['stateId'];
  var isLoading = false.obs;

  var slotsData = <Slots>[].obs;

  var fetchDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;

  var slotInfoData = SlotInfo().obs;

  void setDate(DateTime date){
    fetchDate.value = DateFormat('dd-MM-yyyy').format(date);
    fetchSlots();
  }

  @override
  void onInit() {
    fetchSlots();
    // fetchVaccineInfo();
    super.onInit();
  }

  void fetchSlots() async {
    try {
      isLoading.value = true;
      var slots = await RemoteService.fetchSlots(
          currentDistrictIdValue, fetchDate.value);
      if (slots != null) {
        // slots.centers.forEach((element) {
        //   element.sessions.forEach((session) {
        //     var data = Slots();
        //     data.available_capacity = session.available_capacity;
        //     data.date = session.date;
        //     data.min_age_limit = session.min_age_limit;
        //     data.session_id = session.session_id;
        //     data.slots = session.slots;
        //     data.vaccine = session.vaccine;
        //
        //     data.address = element.address;
        //     data.block_name = element.block_name;
        //     data.center_id = element.center_id;
        //     data.district_name = element.district_name;
        //     data.fee_type = element.fee_type;
        //     data.from = element.from;
        //     data.lat = element.lat;
        //     data.long = element.long;
        //     data.name = element.name;
        //     data.pincode = element.pincode;
        //     data.state_name = element.state_name;
        //     data.to = element.to;
        //     slotsData.value.add(data);
        //   });
        // });

        availableSlots.value = slots;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void fetchVaccineInfo() async {
    try {
      isLoading.value = true;
      var slotInfo = await RemoteService.fetchSlotsInfo(
          currentDistrictNameValue, currentDistrictIdValue, fetchDate.value);
      if (slotInfo != null) {
        slotInfoData.value = slotInfo;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
