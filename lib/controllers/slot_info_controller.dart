import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vaccinate/models/update/slot_info.dart';
import 'package:vaccinate/services/remote_services.dart';

class SlotInfoController extends GetxController{

  var currentDistrictNameValue = Get.parameters['districtName'];
  var currentDistrictIdValue = Get.parameters['districtId'];
  var currentStateIdValue = Get.parameters['stateId'];
  var isLoading = false.obs;

  var fetchDate = Get.parameters['date'];

  var slotInfoDetail = SlotInfoDetail().obs;


  @override
  void onInit() {
    fetchVaccineInfoDetails();
    super.onInit();
  }


  void fetchVaccineInfoDetails()  async{
    try{
      isLoading.value = true;
      var slotInfodetails = await RemoteService.fetchSlotsInfoDetails(currentDistrictNameValue,currentDistrictIdValue,fetchDate,currentStateIdValue);
      if(slotInfodetails != null){
      print("nowfal ${slotInfodetails.slotInfoDetail}");
        slotInfoDetail.value = slotInfodetails;
      }
    }finally{
      isLoading.value = false;
    }
  }
}