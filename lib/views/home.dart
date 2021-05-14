import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaccinate/controllers/state_controller.dart';
import 'package:vaccinate/models/DIstricts.dart';
import 'package:vaccinate/models/States.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StateController stateController = Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return buildRootCenter(context);
        } else {
          return buildWebContainer(context);
        }
      }),
    );
  }

  Row buildWebContainer(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange[300], Colors.green[200]],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp)),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            // color: Colors.teal,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Test Flutter Web",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "This Website is best experienced on mobile",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "You can use the mobile view on desktop but for a better experience open this on mobile.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[900],
            child: buildRootCenter(context),
          )
        ],
      );

  Center buildRootCenter(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() {
              if (stateController.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return DropdownSearch<StateItem>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select a State",
                  mode: Mode.MENU,
                  // ignore: missing_return
                  showSelectedItem: false,
                  items: stateController.stateList.value.states,
                  label: "States *",
                  showClearButton: true,
                  onChanged: (item) {
                    stateController.selectedState.value = item;
                    stateController.fetchDisctrictsByStateId(item);
                  },
                );
              }
            }),
            SizedBox(
              height: 18,
            ),
            Obx(() {
              if (stateController.isLoadingDistrict.value) {
                return CircularProgressIndicator();
              } else {
                return DropdownSearch<DistrictNyStateItem>(
                  validator: (v) => v == null ? "required field" : null,
                  hint: "Select a District",
                  mode: Mode.MENU,
                  // ignore: missing_return
                  showSelectedItem: false,
                  items: stateController.districtList.value.districts,
                  label: "Districts *",
                  showClearButton: true,
                  onChanged: (item) {
                    stateController.selectedDistrict.value = item;
                  },
                );
              }
            }),
            SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  print(
                      "${stateController.selectedDistrict.value.district_name == null}");
                  if (stateController.selectedDistrict.value.district_name ==
                      null) {
                    Get.snackbar("Error", "Please select state and district",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    // Map<String, dynamic> data = Map();
                    // data['district'] = stateController.selectedDistrict.value;
                    Get.toNamed(
                        '/vaccine-details/${stateController.selectedDistrict.value.district_id}/${stateController.selectedDistrict.value.district_name}/${stateController.selectedState.value.stateId}');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Search Slots',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
