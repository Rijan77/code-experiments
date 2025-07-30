import 'package:flutter/material.dart';
import 'package:try_project/jokes_app/model/jokes_api.dart';
import 'package:try_project/jokes_app/model/jokes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  JokesModel? currentJoke;

  fetchData() async {
    final JokesApi jokesApi = JokesApi();
    final joke = await jokesApi.getJoke();

    if (joke != null) {
      setState(() {
        currentJoke = joke;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "Jokes Loaded",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 10, left: 10),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 500,

                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentJoke!.type?.toUpperCase() ?? "",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        currentJoke!.setup ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Icon(Icons.arrow_right, size: 35),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              currentJoke!.punchline ?? "",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,

                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("😊 😂 😄", style: TextStyle(fontSize: 24)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  side: BorderSide(width: 2, color: Colors.blue.shade200),
                  elevation: 4,
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  fetchData();
                },
                child: Text(
                  "Next One",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
