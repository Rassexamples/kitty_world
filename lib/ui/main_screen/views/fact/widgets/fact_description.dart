import 'package:flutter/material.dart';
import 'package:kitty_world/model/cat_fact.dart';

class FactDescription extends StatelessWidget {

  ///
  /// A simple wrapper around the content
  const FactDescription({
    Key? key,
    required this.catFact,
  }) : super(key: key);

  final CatFact catFact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            catFact.fact,
            maxLines: 1,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            "length: ${catFact.length.toString()}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
