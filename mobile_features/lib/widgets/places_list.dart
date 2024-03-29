import 'package:flutter/material.dart';
import 'package:mobile_features/models/place.dart';
import 'package:mobile_features/screens/place_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet, start adding some!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(places[i].image),
        ),
        title: Text(
          places[i].title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(places[i].id),
        // subtitle: Text(places[i].location.address,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodySmall!
        //         .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => PlaceDetailScreen(place: places[i]),
            ),
          );
        },
      ),
    );
  }
}
