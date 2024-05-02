import 'package:flutter/material.dart';

class SeeMyJob extends StatefulWidget {
  final String?  name, job;
  const SeeMyJob({Key? key, this.name, this.job}) : super(key: key);

  @override
  State<SeeMyJob> createState() => _SeeMyJobState();
}

class _SeeMyJobState extends State<SeeMyJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Job"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("Id : ${widget.id}", textScaleFactor: 2, ),
            Text("Name : ${widget.name}", textScaleFactor: 2,),
            Text("Job : ${widget.job}",  textScaleFactor: 2,),
          ],
        ),
      ),
    );
  }
}