import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyTasksSummaryWidget extends StatelessWidget {
  const DailyTasksSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              backgroundColor: Colors.grey,
              value: .5,
            ),
          ),
          const SizedBox(
            width: 20,
          ),

          /// Texts
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "1 of 3 task",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}
