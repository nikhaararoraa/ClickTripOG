import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                  return Card();
                });
          },
        ),
      ),
    );
  }

  Widget card(Size size) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Container(
          height: size.height / 3,
          width: size.width / 1.1,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 222, 203, 203),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print("Hello");
                },
                child: Container(
                  height: size.height / 5.1,
                  width: size.width / 3.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 247, 247),
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 2.1,
                width: size.width / 2.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 27),
                    ),
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 27),
                    ),
                    Text(
                      "Bus Id",
                      style: TextStyle(fontSize: 27),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 27),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
