import 'package:flutter/material.dart';
import 'package:note_clean_architecture/domain/notes/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({Key key, @required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('😱', style: TextStyle(fontSize: 100)),
          Text(
            failure.maybeMap(
                insufficientPermissions: (_) => "Insuffient Permissions",
                orElse: () => 'Unexpected error. \n Please contact support'),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              // print('Sending email');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.mail),
                SizedBox(width: 4),
                Text('I NEED HELP')
              ],
            ),
          )
        ],
      ),
    );
  }
}
