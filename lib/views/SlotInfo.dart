import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaccinate/controllers/slot_info_controller.dart';

class SlotInfo extends StatelessWidget {
  const SlotInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SlotInfoController controller = Get.put(SlotInfoController());
    return Container(
      child: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return Text(
                "${controller.slotInfoDetail.value.toJson().toString()}",
              style: TextStyle(color: Colors.white,fontSize: 12),
            );
          }
        }),
      ),
    );
  }
}
