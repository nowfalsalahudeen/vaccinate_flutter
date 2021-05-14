import 'package:get/state_manager.dart';
import 'package:vaccinate/models/DIstricts.dart';
import 'package:vaccinate/models/States.dart';
import 'package:vaccinate/services/remote_services.dart';

class StateController extends GetxController {
  var stateList = States().obs;
  var districtList = DistrictByState().obs;
  var isLoading = false.obs;
  var isLoadingDistrict = false.obs;
  var selectedDistrict = DistrictNyStateItem().obs;
  var selectedState = StateItem().obs;
  @override
  void onInit() {
    fetchStates();
    super.onInit();
  }
  void fetchStates() async {
    try {
      isLoading.value = true;
      var states = await RemoteService.fetchStates();
      if (states != null) {
        stateList.value = states;
      }
    }
    finally{
      isLoading.value = false;
    }
  }

  void fetchDisctrictsByStateId(StateItem stateItem) async{
    try{
      isLoadingDistrict.value = true;
      var districts = await RemoteService.fetchDistrictsByStatesId(stateItem);
      if(districts!=null){
        districtList.value = districts;;
      }
    }
    finally{
      isLoadingDistrict.value = false;
    }
  }
}
