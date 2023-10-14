
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.account_box),
              SizedBox(width: 5,),
              Text("Сервисы"),
              Spacer(),
              Icon(Icons.search),
              Icon(Icons.more_horiz_outlined)
            ],
          ),
        ],
      ),
    );
  }
}
