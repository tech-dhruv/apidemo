import 'package:flutter/material.dart';
import 'package:learn_api/model/multi_data_model.dart';
import 'package:learn_api/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MultiData multiData = MultiData();

  bool isReady = false;

  _getMultiData() {
    isReady = true;
    ApiServices().getMultiDataWithModel().then((value) {
      setState(() {
        multiData = value!;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    _getMultiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Demo"),
        centerTitle: true,
      ),
      body: isReady == true
          ? const Center(child: CircularProgressIndicator())
          : Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(multiData.page.toString(),
                    style: const TextStyle(color: Colors.teal, fontSize: 18)),
                Text(multiData.perPage.toString(),
                    style: const TextStyle(color: Colors.teal, fontSize: 18)),
                Text(multiData.total.toString(),
                    style: const TextStyle(color: Colors.teal, fontSize: 18)),
                Text(multiData.totalPages.toString(),
                    style: const TextStyle(color: Colors.teal, fontSize: 18)),
                Text(multiData.support!.text.toString(),
                    style: const TextStyle(color: Colors.teal, fontSize: 18)),
                Expanded(
                    child: ListView.builder(
                        itemCount: multiData.data!.length,
                        itemBuilder: (context, i) {
                          return Card(
                            child: ListTile(
                              title: Text(multiData.data![i].name.toString()),
                              subtitle: Text(
                                  multiData.data![i].pantoneValue.toString()),
                            ),
                          );
                        }))
              ],
            ),
    );
  }
}
