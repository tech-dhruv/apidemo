//create and update Api using http

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_api/view/see_my_job.dart';

import '../model/model.dart';
import '../model/update_model.dart';
import '../services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();

  CreateJobModel createJobModel = CreateJobModel();
  UpdateData updateModel = UpdateData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: updateModel.name == null || updateModel.name == ""
            ? Text("Create Job")
            : Text("Create Job ${updateModel.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: job,
              decoration: const InputDecoration(hintText: "Job"),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    //   ApiServices().createJob(name.text.toString(), job.text.toString()).then((value){
                    //     setState(() {
                    //       createJobModel = value!;
                    //       print(value);
                    //
                    //       Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeMyJob(
                    //         id: createJobModel.id.toString(),
                    //         name: createJobModel.name.toString(),
                    //         job: createJobModel.job.toString(),
                    //       )));
                    //
                    //     });
                    //   }).onError((error, stackTrace){
                    //     print(error);
                    //   });

                    ApiServices()
                        .updateData(name.text.toString(), job.text.toString())
                        .then((value) {
                      setState(() {
                        updateModel = value!;
                        print(value);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeeMyJob(
                                      name: updateModel.name.toString(),
                                      job: updateModel.job.toString(),
                                    )));
                      });
                    }).onError((error, stackTrace) {
                      print(error);
                    });
                  },
                  child: const Text("Create Job")),
            )
          ],
        ),
      ),
    );
  }
}
