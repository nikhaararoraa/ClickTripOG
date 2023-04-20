import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 1,
          leading: Icon(
            Icons.abc,
            color: Colors.grey[300],
          ),
          title: const Text(
            "1 Ghante ka kaam tha😝",
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
      body: SizedBox(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('rides').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.docs.isEmpty) {
              return SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height / 30,
                    ),
                    const Icon(
                      Icons.bus_alert,
                      size: 180,
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  //print(snapshot.data!.docs[index]['chatroom'][0]);
                  return tiles(
                      size,
                      snapshot.data!.docs[index]['name'],
                      snapshot.data!.docs[index]['seats'],
                      snapshot.data!.docs[index]['id']);
                });
          },
        ),
      ),
    );
  }

  Widget tiles(Size size, String name, int seats, String id) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Booking(
                      seats: seats,
                      id: id,
                    )));
      }),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            height: size.height / 9,
            width: size.width / 1.1,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  //Bottom right shadow will be darker
                  BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(4, 4),
                      blurRadius: 21,
                      spreadRadius: 3),

                  //top left shadow will be lighter
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1)
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, left: 18),
                    child: SizedBox(
                      width: size.width / 1.5,
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18, right: 21),
                    child: Container(
                      height: size.height / 30,
                      width: size.width / 7,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            //Bottom right shadow will be darker
                            BoxShadow(
                                color: Colors.grey.shade600,
                                offset: const Offset(4, 4),
                                blurRadius: 21,
                                spreadRadius: 3),

                            //top left shadow will be lighter
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]),
                      child: const Center(
                          child: Text(
                        "Book",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 21),
                child: SizedBox(
                  width: size.width / 1.2,
                  child: Text(
                    "$seats seats are available",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
