import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vaccinate/controllers/vaccine_info_controller.dart';
import 'package:vaccinate/models/DIstricts.dart';
import 'package:vaccinate/models/Slots.dart';
import 'package:vaccinate/models/update/slot_info.dart';

class VaccineDetails extends StatefulWidget {
  const VaccineDetails({Key key}) : super(key: key);

  @override
  _VaccineDetailsState createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends State<VaccineDetails> {
  VaccineInfoController controller = Get.put(VaccineInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildRootContainer(),
      ),
    );
  }

  @override
  void initState() {
    if (Get.parameters['districtName'] == null &&
        Get.parameters['districtId'] == null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Get.toNamed('/');
      });
    } else {}
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateFormat('dd-MM-yyyy').parse(
            "${controller.fetchDate.value}"),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
        controller.setDate(picked);

        }


  Container buildRootContainer() =>
      Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  elevation: 2.0,
                  fillColor: Colors.grey[700],
                  child: Icon(
                    Icons.arrow_back,
                    size: 18.0,
                  ),
                  padding: EdgeInsets.all(8.0),
                  shape: CircleBorder(),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(Get.parameters['districtName']),
                    subtitle: Obx((){
                      return Text("${controller.fetchDate.value} ${DateFormat('EEEE').format(
                          DateFormat('dd-MM-yyyy').parse(
                              "${controller.fetchDate.value}"))}");
                    }),
                  ),
                ),

                RawMaterialButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  elevation: 2.0,
                  fillColor: Colors.grey[900],
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 24.0,
                  ),
                  padding: EdgeInsets.all(12.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Divider(
                height: 20,
                color: Colors.grey[300],
                thickness: 2,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24.0),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator(),);
                  } else {
                    if(controller.availableSlots.value.centers.length == 0){
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height/10,
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: Text(
                                  "No slots available",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                      );
                    }else {
                      return Container(
                        // height: MediaQuery
                        //     .of(context)
                        //     .size
                        //     .height / 1.314,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                            controller.availableSlots.value.centers.length,
                            itemBuilder: (context, index) {
                              var totalSlot = controller
                                  .availableSlots.value.centers[index].sessions
                                  .map((slotnum) => slotnum.available_capacity)
                                  .fold(0, (prev, slot) => prev + slot);
                              return buildCardRow(
                                  controller.availableSlots.value
                                      .centers[index],
                                  totalSlot);
                            }),
                      );
                    }
                  }
                }),
              ),
            )
          ],
        ),
      );

  Stack buildCardRow(CenterItem slot, int slotnum) =>
      Stack(
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text("${slot.name}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Expanded(child: Text("${slot.address}")),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text("${slot.pincode}"),
                      ],
                    ),
                    trailing: ActionChip(
                      avatar: Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      label: Text(
                        "${slot.fee_type.capitalize}",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: slot.fee_type == "Free"
                          ? Colors.green[200]
                          : Colors.red[200],
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  if (slotnum == 0)
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                            child: Text(
                              "No slots available",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[500], style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: slot.sessions
                          .map((e) =>
                          ListTile(
                            title: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    "${e.date} ${DateFormat('EEEE').format(
                                        DateFormat('dd-MM-yyyy').parse(
                                            "${e.date}"))}"),
                                SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ActionChip(
                                      avatar: Icon(
                                        Icons.opacity,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        "${e.available_capacity}",
                                        style:
                                        TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor: Colors.grey[300],
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    ActionChip(
                                      avatar: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        e.min_age_limit.toString() == "45"
                                            ? "45+"
                                            : "${e.min_age_limit}",
                                        style:
                                        TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor: Colors.grey[300],
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    ActionChip(
                                      label: Text(
                                        "${e.vaccine}",
                                        style:
                                        TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor: Colors.grey[300],
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  )
                ],
              ),
              // child: Row(
              //   mainAxisSize: MainAxisSize.max,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     ListTile(
              //       title: Text("${slot.name}"),
              //     ),
              //     // Text("${slot.name}"),
              //     // Text("${slot.date} ${DateFormat('EEEE').format(DateFormat('dd-MM-yyyy').parse("${slot.date}"))}"),
              //
              //
              //   ],
              // ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    // Get.toNamed('/slot-info/${slot.date}/${controller.currentDistrictIdValue}/${controller.currentDistrictNameValue}/${controller.currentStateIdValue}');
                  },
                ),
              ),
            ),
          )
        ],
      );
}
