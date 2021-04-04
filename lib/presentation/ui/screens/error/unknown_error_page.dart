import 'package:flutter/material.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/presentation/base/base_controller.dart';
import 'package:provider/provider.dart';

class UnknownErrorPage<C extends BaseController> extends StatelessWidget {
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
              S.of(context).something_wrong,
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
