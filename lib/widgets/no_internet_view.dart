import 'package:flutter/cupertino.dart';

Widget noInternetView(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 1.4,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage('assets/no_intenet/no_internet.png'),
        ),
        Text('No Internet Connection')
      ],
    ),
  );
}
