import 'package:flutter/material.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UnknownErrorPage<C extends BaseController> extends StatelessWidget {

  UnknownErrorPage({required this.message});

  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message ?? '',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50,),
            FlatButton(
              color: Colors.lightGreen,
              onPressed: () {
                context.read<C>().reload();
              },
              child: Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}
