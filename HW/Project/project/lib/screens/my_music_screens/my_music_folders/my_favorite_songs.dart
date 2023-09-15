import 'package:project/app_logic/blocs/bloc_exports.dart';
import 'package:project/screens/my_music_screens/my_music_index.dart';
import 'package:project/screens/tab_bar/index.dart';

import 'package:project/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyFavoriteSongs extends StatelessWidget {
  const MyFavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return FavoritePageStructure(
      child: FavoriteBody(
        songs: favoriteProvider.favoriteSong,
        child: FavoriteSongListView(
          favoriteProvider: favoriteProvider,
        ),
      ),
    );
  }
}

class FavoriteSongListView extends StatelessWidget {
  const FavoriteSongListView({
    super.key,
    required this.favoriteProvider,
  });

  final FavoriteProvider favoriteProvider;

  @override
  Widget build(BuildContext context) {
    final songs = favoriteProvider.favoriteSong;
    return ListView.separated(
        itemCount: songs.length,
        separatorBuilder: (context, index) => const Divider(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final song = songs[index];
          return PlatformBuilder(
              web: GestureDetector(
                onTap: null,
                child: DismissibleWidget(
                  song: song,
                  onDismissed: () {
                    favoriteProvider.removeFromFavorites(song);
                  },
                  child: FavouriteListContent(song: song),
                ),
              ),
              other: GestureDetector(
                onTap: () {
                  String id = song.id;

                  GoRouter.of(context).push(
                      Uri(path: '/${routeNameMap[RouteName.detailMusic]!}$id')
                          .toString());
                },
                child: DismissibleWidget(
                  song: song,
                  onDismissed: () {
                    favoriteProvider.removeFromFavorites(song);
                  },
                  child: CustomListViewContent(
                    imageSection: ResponsiveBuilder(
                        narrow: 70.0,
                        medium: 90.0,
                        large: 90.0,
                        builder: (context, child, height) {
                          return CreateImageSection(song: song, height: height);
                        }),
                    titleSection: CreateSongTitle(
                      artistName: song.artistNames,
                      songTitle: song.title,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
              builder: (context, child, widget) {
                return widget;
              });
        });
  }
}
