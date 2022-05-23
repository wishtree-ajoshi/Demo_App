import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post_http_demo/models/provider_time_model.dart';
import 'package:provider/provider.dart';

class ProviderClock extends StatefulWidget {
  const ProviderClock({Key? key}) : super(key: key);

  @override
  State<ProviderClock> createState() => _ProviderClockState();
}

/// ProviderData called from here.
class _ProviderClockState extends State<ProviderClock> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        // Check mounted before calling setState...
        var timeDetails = Provider.of<ClockData>(context, listen: false);
        timeDetails.currentTime();
        //print(timeDetails.getTime());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("Provider CLock build init");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Clock"),
        centerTitle: true,
      ),
      body: Center(child: Consumer<ClockData>(
        /// Consumer is used here which uses data given by provider.
        builder: (context, data, child) {
          return Text(
            data.getTime(),
            style: const TextStyle(fontSize: 40),
          );
        },
      )),
    );
  }
}
