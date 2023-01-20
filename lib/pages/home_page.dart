import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_parking/blocs/sensor_blocs/sensor_bloc.dart';
import 'package:smart_parking/blocs/sensor_blocs/sensor_event.dart';
import 'package:smart_parking/blocs/sensor_blocs/sensor_state.dart';
import 'package:smart_parking/models/sensor_data_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    var url, response;
    Timer? timer;
  List data = [];
  List<SensorData> dataList = [];
  // List<SensorData> _electionlistToDisplay = [];
  bool _isLoading = true;
  // bool _isLightTheme = true;

  Future<List<SensorData>> getData() async {
    url = Uri.parse(
        "https://io.adafruit.com/api/v2/rambhandhari/feeds?x-aio-key=aio_OsMp23v0dXqqdAElmWPXOiW58da1");
    response = await http.get(url);
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        dataList = data.map((e) => (SensorData.fromJson(e))).toList();

        _isLoading = false;
        print("this is called");
      });
    } else {
      // Get.snackbar("Error!", "Some network error occurred");
    }

    return dataList;
  }
    @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getData());
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: IconButton(onPressed: (() {
          //     print("Refreshing");
          //     setState(() {
          //       _refreshPressed=true;
          //     });
          //     // getData();
              
          //   }), icon: Icon(Icons.refresh)),
          // )
        ],
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SMART"),
          SizedBox(width: 4,), 
  
          Text('PARKING', style: TextStyle(color: Colors.green),)
        ],
      ),),
      body:(_isLoading)?Center(child: CircularProgressIndicator(),): RefreshIndicator(
        onRefresh: getData,
        child: ListView.builder(
          // physics: AlwaysScrollableScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 4),
            child: Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.car_rental),
                title: Text("Name: "+dataList[index].name.toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Created at: "+dataList[index].createdAt.toString()), 
                    SizedBox(height: 4,), 
                    Text("Updated at: "+dataList[index].updatedAt.toString()),
                  ],
                ),
                // title: Text("Updated at: "+ dataList[index].updatedAt.toString()+" "+ "Name: "+ dataList[index].name.toString()),
                // subtitle: Text(dataList[index].createdAt.toString()),
              ),
            ),
          );
        },),
      ),
    );

    
  }
}
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final SensorBloc _sensorBloc = SensorBloc();
//   @override
//   void initState() {
//     // TODO: implement initState
//     _sensorBloc.add(GetDataList());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Smart Parking'),
//             SizedBox(
//               width: 5,
//             ),
//             Icon(
//               Icons.car_crash_rounded,
//               color: Colors.black,
//             ),
//           ],
//         ),
//       ),
//       body: _buildDataList(),
//     );
//   }

//   Widget _buildDataList() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//       child: BlocListener<SensorBloc, SensorDataState>(
//         listener: (context, state) {
//           // TODO: implement listener
//           if (state is SensorError) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.message!)));
//           }
//         },
//         child: BlocBuilder<SensorBloc, SensorDataState>(
//           builder: (context, state) {
//             if(state is SensorInitialState)
//             {
//               return _buildLoading();
//               print('LOADING');
//             }else if(state is SensorLoadedState)
//             {
              
//             }
//             return Card(
//               child: ListTile(
//                 title: Text('testtt'),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//     // return Padding(
//     //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//     //   child: Center(
//     //       child: GridView(
//     //     physics: BouncingScrollPhysics(),
//     //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //         crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16.0),
//     //     children: [
//     //       BlocListener<SensorBloc, SensorDataState>(
//     //         listener: (context, state) {
//     //           if (state is SensorError) {
//     //             ScaffoldMessenger.of(context)
//     //                 .showSnackBar(SnackBar(content: Text(state.message!)));
//     //           }
//     //         },
//     //         child: BlocBuilder<SensorBloc, SensorDataState>(
//     //           builder: (context, state) {
//     //             if(state is SensorInitialState)
//     //             {
//     //               return _buildLoading();
//     //               print("Initial state");
//     //             }else if(state is SensorLoadingState)
//     //             {
//     //               return _buildLoading();
//     //               print("Loading state");
//     //             }else if(state is SensorLoadedState)
//     //             {
//     //               return _buildCard(state.sensorData);
//     //             }
//     //             return Image.network('https://picsum.photos/250?image=1');
//     //           },
//     //         ),
//     //       ),
//     //       Image.network('https://picsum.photos/250?image=2'),
//     //       // Image.network('https://picsum.photos/250?image=3'),
//     //       // Image.network('https://picsum.photos/250?image=3'),
//     //     ],
//     //   )),
//     // );
//   }

//   Widget _buildLoading() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Widget _buildCard(SensorData sensorData) {
//     return Column(
//       children: [
//         Text("${sensorData.updatedAt}"),
//       ],
//     );
//   }
// }
