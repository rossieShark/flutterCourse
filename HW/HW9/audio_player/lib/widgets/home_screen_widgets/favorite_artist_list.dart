import 'package:audio_player/app_logic/blocs/home_screen_bloc.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteArtistList extends StatefulWidget {
  const FavoriteArtistList({
    super.key,
  });

  @override
  State<FavoriteArtistList> createState() => _FavoriteArtistListState();
}

class _FavoriteArtistListState extends State<FavoriteArtistList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<FavoriteArtistBloc>(context)
        .add(FetchFavoriteArtistsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    bool isIpad = maxWidth > 600;
    double sizeInspector(double size) {
      return isIpad ? size * 1 : size * 1.29;
    }

    return BlocBuilder<FavoriteArtistBloc, FavoriteArtistState>(
        builder: (context, state) {
      if (state.favoriteArtistList.isEmpty) {
        return const Center(
          child: CustomFadingCircleIndicator(),
        );
      } else {
        final favoriteArtistList = state.favoriteArtistList;
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(favoriteArtistList.length, (index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        sizeInspector(maxWidth * 0.165) / 2),
                    child: SizedBox(
                      height: sizeInspector(maxWidth * 0.165),
                      width: sizeInspector(maxWidth * 0.165),
                      child: Image.network(
                          favoriteArtistList[index].item.image_url ?? '',
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(favoriteArtistList[index].item.name ?? '',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          }),
        );
      }
    });
  }
}