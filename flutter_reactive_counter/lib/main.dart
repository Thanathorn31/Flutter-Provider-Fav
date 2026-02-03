import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CounterModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite List')),
      body: Consumer<CounterModel>(
        builder: (context, counter, child) {
          return ListView.builder(
            itemCount: counter.favorites.length, // limit 20
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item #$index'),
                trailing: IconButton(
                  icon: Icon(
                    counter.favorites[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    counter.toggleFavorite(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
