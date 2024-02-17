// // ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:news/newsController.dart';
// import 'package:news/testing/model/articleModel.dart';

// class AllCategoriesMain extends StatefulWidget {
//   const AllCategoriesMain({Key? key}) : super(key: key);

//   @override
//   State<AllCategoriesMain> createState() => _AllCategoriesMainState();
// }

// late Future<List<Article>> documents;

// class _AllCategoriesMainState extends State<AllCategoriesMain>
//     with TickerProviderStateMixin {
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();

//     //getImageSlider();
//     LatestNewss();
//   }

//   LatestNewss() async {
//     documents = Department_Tabssss();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffFFFFFF),
//         leading: IconButton(
//           color: const Color(0xff000000),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//           ),
//         ),
//         title: const Text(
//           "All Categories",
//           style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               color: Color(0xff000000)),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           FutureBuilder<List<Article>>(
//               future: documents,
//               builder: (
//                 context,
//                 snapshot,
//               ) {
//                 if (snapshot.hasData) {
//                   // var news = snapshot.hasData as List<LatestNews>;
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(snapshot.data![0].title,
//                           style: const TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold)),
//                       // Text(snapshot.data![index].departmentTitle,
//                       //     style: const TextStyle(
//                       //         fontStyle: FontStyle.italic, fontSize: 13)),
//                       // Text(
//                       //     snapshot.data![index].departmentTitle
//                       //         .toString(),
//                       //     style: const TextStyle(
//                       //         color: Colors.grey, fontSize: 13)),
//                     ],
//                   );

//                   // ListView.builder(
//                   //   shrinkWrap: true,
//                   //   physics: const NeverScrollableScrollPhysics(),
//                   //   itemCount: snapshot.data!.length,
//                   //   itemBuilder: (_, index) => Column(
//                   //     mainAxisAlignment: MainAxisAlignment.start,
//                   //     crossAxisAlignment: CrossAxisAlignment.start,
//                   //     children: [
//                   //       Text(snapshot.data![0].departmentTitle,
//                   //           style: const TextStyle(
//                   //               fontSize: 15, fontWeight: FontWeight.bold)),
//                   //       // Text(snapshot.data![index].departmentTitle,
//                   //       //     style: const TextStyle(
//                   //       //         fontStyle: FontStyle.italic, fontSize: 13)),
//                   //       // Text(
//                   //       //     snapshot.data![index].departmentTitle
//                   //       //         .toString(),
//                   //       //     style: const TextStyle(
//                   //       //         color: Colors.grey, fontSize: 13)),
//                   //     ],
//                   //   ),
//                   // );
//                 } else if (snapshot.hasError) {
//                   print(snapshot.error);
//                   return Text('${snapshot.error}');
//                 }

//                 // By default, show a loading spinner.
//                 return const CircularProgressIndicator();
//               }),
//           // Row(
//           //   children: [
//           //     Expanded(
//           //       flex: 10,
//           //       child: DecoratedBox(
//           //         decoration: BoxDecoration(
//           //           //This is for background color
//           //           color: Colors.white.withOpacity(0.0),
//           //           //This is for bottom border that is needed
//           //           border: const Border(
//           //               bottom: BorderSide(color: Colors.grey, width: 0.8)),
//           //         ),
//           //         child: FutureBuilder<List<Department>>(
//           //             future: documents,
//           //             builder: (
//           //               context,
//           //               snapshot,
//           //             ) {
//           //               if (snapshot.hasData) {
//           //                 // var news = snapshot.hasData as List<LatestNews>;
//           //                 return TabBar(
//           //                   unselectedLabelColor: Colors.black,
//           //                   labelColor: const Color(0xff000000),
//           //                   isScrollable: true,
//           //                   labelPadding:
//           //                       const EdgeInsets.symmetric(horizontal: 20.0),
//           //                   tabs: [
//           //                     Container(
//           //                       width: 65,
//           //                       child: Tab(
//           //                         icon: Image.asset(
//           //                             "assets/image/productDepartmentListOne/Vector (3).png"),
//           //                         child: Text(snapshot.data![0].departmentTitle,
//           //                             style: const TextStyle(
//           //                                 fontWeight: FontWeight.w400,
//           //                                 fontSize: 14)),
//           //                       ),
//           //                     ),
//           //                     Container(
//           //                       width: 65,
//           //                       child: Tab(
//           //                         icon: Image.asset(
//           //                             "assets/image/productDepartmentListOne/Vector (1).png"),
//           //                         child: Text(snapshot.data![1].departmentTitle,
//           //                             style: const TextStyle(
//           //                                 fontWeight: FontWeight.w400,
//           //                                 fontSize: 14)),
//           //                       ),
//           //                     ),
//           //                     Container(
//           //                       width: 65,
//           //                       child: Tab(
//           //                         icon: Image.asset(
//           //                             "assets/image/productDepartmentListOne/Vector (2).png"),
//           //                         child: Text(snapshot.data![1].departmentTitle,
//           //                             style: const TextStyle(
//           //                                 fontWeight: FontWeight.w400,
//           //                                 fontSize: 14)),
//           //                       ),
//           //                     )
//           //                   ],
//           //                   controller: _tabController,
//           //                   indicatorSize: TabBarIndicatorSize.tab,
//           //                 );
//           //               } else if (snapshot.hasError) {
//           //                 print(snapshot.error);
//           //                 //return Text('${snapshot.error}');
//           //               }

//           //               // By default, show a loading spinner.
//           //               return CircularProgressIndicator();
//           //             }),
//           //       ),
//           //     ),
//           //     Expanded(
//           //       flex: 2,
//           //       child: DecoratedBox(
//           //         decoration: BoxDecoration(
//           //           //This is for background color
//           //           color: Colors.white.withOpacity(0.0),
//           //           //This is for bottom border that is needed
//           //           border: const Border(
//           //               bottom: BorderSide(color: Colors.grey, width: 0.8)),
//           //         ),
//           //         child: Padding(
//           //           padding: const EdgeInsets.only(bottom: 25.0),
//           //           child: IconButton(
//           //               icon: AnimatedIcon(
//           //                 icon: AnimatedIcons.menu_arrow,
//           //                 progress: _animationController,
//           //               ),
//           //               onPressed: () async {
//           //                 _animationController.forward();
//           //                 showModalBottomSheet(
//           //                   context: context,
//           //                   builder: (context) => FutureBuilder<
//           //                           List<Department>>(
//           //                       future: documents,
//           //                       builder: (
//           //                         context,
//           //                         snapshot,
//           //                       ) {
//           //                         if (snapshot.hasData) {
//           //                           // var tab = snapshot.hasData as List<Department>;
//           //                           return GridView.builder(
//           //                             gridDelegate:
//           //                                 const SliverGridDelegateWithFixedCrossAxisCount(
//           //                                     crossAxisCount: 3,
//           //                                     crossAxisSpacing: 10,
//           //                                     mainAxisSpacing: 10),
//           //                             itemCount: snapshot.data!.length - 2,
//           //                             primary: false,
//           //                             padding: const EdgeInsets.all(20),
//           //                             itemBuilder:
//           //                                 (BuildContext context, int index) {
//           //                               return Container(
//           //                                 padding: const EdgeInsets.all(8),
//           //                                 color: Colors.grey[350],
//           //                                 child: Column(
//           //                                   crossAxisAlignment:
//           //                                       CrossAxisAlignment.center,
//           //                                   mainAxisAlignment:
//           //                                       MainAxisAlignment.center,
//           //                                   children: [
//           //                                     Image.asset(
//           //                                         "assets/image/productDepartmentListOne/Vector (3).png"),
//           //                                     const SizedBox(height: 5),
//           //                                     Text(
//           //                                       snapshot.data![index + 2]
//           //                                           .departmentTitle,
//           //                                       style: const TextStyle(
//           //                                           fontSize: 12,
//           //                                           fontWeight:
//           //                                               FontWeight.w400),
//           //                                     )
//           //                                   ],
//           //                                 ),
//           //                               );
//           //                             },
//           //                             // crossAxisSpacing: 10,
//           //                             // mainAxisSpacing: 10,
//           //                             // crossAxisCount: 3,
//           //                             // children: <Widget>[
//           //                             //   Container(
//           //                             //     padding: const EdgeInsets.all(8),
//           //                             //     color: Colors.grey[350],
//           //                             //     child: Column(
//           //                             //       crossAxisAlignment:
//           //                             //           CrossAxisAlignment.center,
//           //                             //       mainAxisAlignment:
//           //                             //           MainAxisAlignment.center,
//           //                             //       children: [
//           //                             //         Image.asset(
//           //                             //             "assets/image/productDepartmentListOne/Vector (3).png"),
//           //                             //         const SizedBox(height: 5),
//           //                             //         const Text(
//           //                             //           "Furniture",
//           //                             //           style: TextStyle(
//           //                             //               fontSize: 12,
//           //                             //               fontWeight: FontWeight.w400),
//           //                             //         )
//           //                             //       ],
//           //                             //     ),
//           //                             //   ),
//           //                             // ],
//           //                           );
//           //                         } else if (snapshot.hasError) {
//           //                           print(snapshot.error);
//           //                           // return Text('${snapshot.error}');
//           //                         }

//           //                         // By default, show a loading spinner.
//           //                         return GridView.builder(
//           //                           gridDelegate:
//           //                               const SliverGridDelegateWithFixedCrossAxisCount(
//           //                                   crossAxisCount: 3,
//           //                                   crossAxisSpacing: 10,
//           //                                   mainAxisSpacing: 10),
//           //                           itemCount: 9,
//           //                           primary: false,
//           //                           padding: const EdgeInsets.all(20),
//           //                           itemBuilder:
//           //                               (BuildContext context, int index) {
//           //                             return Shimmer.fromColors(
//           //                               baseColor: Colors.grey.shade900,
//           //                               highlightColor: Colors.grey.shade700,
//           //                               child: Container(
//           //                                 padding: const EdgeInsets.all(8),
//           //                                 color: Colors.black.withOpacity(0.04),
//           //                                 child: Column(
//           //                                   crossAxisAlignment:
//           //                                       CrossAxisAlignment.center,
//           //                                   mainAxisAlignment:
//           //                                       MainAxisAlignment.center,
//           //                                   children: [
//           //                                     CircleAvatar(
//           //                                       backgroundColor: Colors.black
//           //                                           .withOpacity(0.04),
//           //                                       radius: 20,
//           //                                       //Text
//           //                                     ),
//           //                                     const SizedBox(height: 5),
//           //                                     Container(
//           //                                       height: 10,
//           //                                       width: 85,
//           //                                       color: Colors.black
//           //                                           .withOpacity(0.04),
//           //                                     ) //CircleA
//           //                                   ],
//           //                                 ),
//           //                               ),
//           //                             );

//           //                             // Container(
//           //                             //   padding: const EdgeInsets.all(8),
//           //                             //   color: Colors.grey[350],
//           //                             //   child: Column(
//           //                             //     crossAxisAlignment:
//           //                             //         CrossAxisAlignment.center,
//           //                             //     mainAxisAlignment:
//           //                             //         MainAxisAlignment.center,
//           //                             //     children: [
//           //                             //       Image.asset(
//           //                             //           "assets/image/productDepartmentListOne/Vector (3).png"),
//           //                             //       const SizedBox(height: 5),
//           //                             //       const Text(
//           //                             //         "jshfjdf",
//           //                             //         style: TextStyle(
//           //                             //             fontSize: 12,
//           //                             //             fontWeight: FontWeight.w400),
//           //                             //       )
//           //                             //     ],
//           //                             //   ),
//           //                             // );
//           //                           },
//           //                         );
//           //                       }),
//           //                 ).then((value) {
//           //                   _animationController.reverse();
//           //                 }
//           //                     //  FutureBuilder<
//           //                     //         List<Department>>(
//           //                     //     future: documents,
//           //                     //     builder: (
//           //                     //       context,
//           //                     //       snapshot,
//           //                     //     ) {
//           //                     //       if (snapshot.hasData) {
//           //                     //         // var tab = snapshot.hasData as List<Department>;
//           //                     //         return

//           //                     //         ListView.builder(
//           //                     //             shrinkWrap: true,
//           //                     //             physics:
//           //                     //                 const NeverScrollableScrollPhysics(),
//           //                     //             itemCount: snapshot.data!.length,
//           //                     //             itemBuilder: (_, index) =>
//           //                     //                 GridView.count(
//           //                     //                     primary: false,
//           //                     //                     padding:
//           //                     //                         const EdgeInsets.all(20),
//           //                     //                     crossAxisSpacing: 10,
//           //                     //                     mainAxisSpacing: 10,
//           //                     //                     crossAxisCount: 3,
//           //                     //                     children: [
//           //                     //                       Container(
//           //                     //                         padding:
//           //                     //                             const EdgeInsets.all(8),
//           //                     //                         color: Colors.grey[350],
//           //                     //                         child: Column(
//           //                     //                           crossAxisAlignment:
//           //                     //                               CrossAxisAlignment
//           //                     //                                   .center,
//           //                     //                           mainAxisAlignment:
//           //                     //                               MainAxisAlignment
//           //                     //                                   .center,
//           //                     //                           children: [
//           //                     //                             Image.asset(
//           //                     //                                 "assets/image/productDepartmentListOne/Vector (3).png"),
//           //                     //                             const SizedBox(
//           //                     //                                 height: 5),
//           //                     //                             Text(
//           //                     //                               snapshot.data![index]
//           //                     //                                   .departmentTitle,
//           //                     //                               style: TextStyle(
//           //                     //                                   fontSize: 12,
//           //                     //                                   fontWeight:
//           //                     //                                       FontWeight
//           //                     //                                           .w400),
//           //                     //                             )
//           //                     //                           ],
//           //                     //                         ),
//           //                     //                       ),
//           //                     //                     ]));
//           //                     //       } else if (snapshot.hasError) {
//           //                     //         print(snapshot.error);
//           //                     //         return Text('${snapshot.error}');
//           //                     //       }

//           //                     //       // By default, show a loading spinner.
//           //                     //       return const CircularProgressIndicator();
//           //                     //     }),

//           //                     );
//           //               }),
//           //         ),
//           //       ),
//           //     )
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

// main.dart
import 'package:flutter/material.dart';

class HomePaget extends StatefulWidget {
  const HomePaget({Key? key}) : super(key: key);

  @override
  _HomePagetState createState() => _HomePagetState();
}

class _HomePagetState extends State<HomePaget> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
    } else {
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          title: Text(_foundUsers[index]['name'],
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old',
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
