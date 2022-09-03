import 'package:facebook/presentation/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(router: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Color(0xff0F3460))),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: ListView(
//                   children: List.generate(5, (index) {
//                     return MyTile(index: index);
//                   }),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               child: const Text('Create a Post'),
//               style: ElevatedButton.styleFrom(
//                   fixedSize: Size(MediaQuery.of(context).size.width, 56)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MyTile extends StatefulWidget {
//   final int index;

//   MyTile({Key? key, required this.index}) : super(key: key);

//   @override
//   _MyTileState createState() => _MyTileState();
// }

// // A custom list tile
// class _MyTileState extends State<MyTile> {
//   // Initalliy make the TextField uneditable.
//   bool editable = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 10.0),
//       margin: EdgeInsets.only(bottom: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Expanded(
//             child: TextField(
//               enabled: editable,
//               decoration: InputDecoration(
//                   hintText: "Index ${widget.index}",
//                   hintStyle: TextStyle(color: Colors.black)),
//               onEditingComplete: () {
//                 // After editing is complete, make the editable false
//                 setState(() {
//                   editable = !editable;
//                 });
//               },
//             ),
//           ),
//           ElevatedButton(
//             child: Text('Edit'),
//             onPressed: () {
//               // When edit is pressed, make the editable true
//               setState(() {
//                 editable = !editable;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
