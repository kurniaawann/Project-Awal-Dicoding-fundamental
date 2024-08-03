import 'package:flutter/material.dart';

class CustomerReview extends StatelessWidget {
  const CustomerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic>? customerReviews =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Review"),
      ),
      body: ListView.builder(
        itemCount: customerReviews?.length ?? 0,
        itemBuilder: (context, index) {
          final review = customerReviews![index];
          return ListTile(
            title: Text(review['name']),
            subtitle: Text(review['review']),
            trailing: Text(review['date']),
          );
        },
      ),
    );
  }
}
