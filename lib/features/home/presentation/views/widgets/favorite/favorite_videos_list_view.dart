import 'package:autism/features/home/data/model/favorite_video_response_model.dart';
import 'package:autism/features/home/viewModel/favorateCubit/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'favorite_video_item.dart';

class FavoriteVideosListView extends StatefulWidget {
  const FavoriteVideosListView({super.key, required this.favoriteData});
  final List<FullData> favoriteData;

  @override
  State<FavoriteVideosListView> createState() => _FavoriteVideosListViewState();
}

class _FavoriteVideosListViewState extends State<FavoriteVideosListView> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (!_isLoadingMore &&
          _hasMoreData &&
          !_hasError &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200) {
        setState(() {
          _isLoadingMore = true;
        });

        BlocProvider.of<FavoriteCubit>(context).getFavoriteVideos(
            skipVideo: widget.favoriteData
                .expand((element) => element.videos)
                .toList()
                .length);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is Success) {
          setState(() {
            _isLoadingMore = false;
            // If no new data is returned, we've reached the end
            if (state.data.fullData.videos.isEmpty) {
              _hasMoreData = false;
            }
            _hasError = false;
          });
        } else if (state is Error) {
          setState(() {
            _isLoadingMore = false;
            _hasError = true;
            _errorMessage = state.error;
          });
        }
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount:
            widget.favoriteData.length + (_hasMoreData || _hasError ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index >= widget.favoriteData.length) {
            if (_hasError) {
              return _buildErrorWidget();
            } else {
              return _buildLoadingWidget();
            }
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                if (widget.favoriteData[index].videos.isNotEmpty) {
                  context.push('/video',
                      extra: widget.favoriteData[index].videos.first.id);
                }
              },
              child: FavoriteVideoItem(fullDatum: widget.favoriteData[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoadingMore
            ? const CircularProgressIndicator()
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(height: 8),
          Text(
            'Failed to load more videos: $_errorMessage',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _hasError = false;
                _isLoadingMore = true;
              });
              BlocProvider.of<FavoriteCubit>(context).getFavoriteVideos(
                  skipVideo: widget.favoriteData
                      .expand((element) => element.videos)
                      .toList()
                      .length);
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
