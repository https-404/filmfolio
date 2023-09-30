import 'dart:ui';

import 'package:filmfolio/controllers/mainpage_dataController.dart';
import 'package:filmfolio/model/mainpage_data.dart';
import 'package:filmfolio/model/movie_data.dart';
import 'package:filmfolio/res/theme/theme.dart';
import 'package:filmfolio/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:filmfolio/model/Search_Category.dart';

//controller state provider
final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, MainPageData>((ref) {

  return MainPageDataController();
});

 // Provider<MainPageDataController>((ref) {
 //   return MainPageDataController();
 // });

class Mainpage extends ConsumerWidget {
  double? _deviceHeight;
  double? _deviceWidth;
  MainPageDataController? _mainPageDataController;
  MainPageData? _mainPageData;

  TextEditingController? _searchtextcontroller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    _mainPageDataController = ref.watch(mainPageDataControllerProvider.notifier);
    _mainPageData = ref.watch(mainPageDataControllerProvider);
    _searchtextcontroller = TextEditingController();

    return _UIbuild();
  }

  Widget _UIbuild() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(),
            _foregroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzNtJ1TV8Ycnmkg2mBHUlnfKyFTjK-tIQnrw&usqp=CAU"),
            fit: BoxFit.cover,
          )),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight! * 0.02, 0, 0),
      width: _deviceWidth! * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topbarWidget(),
          Container(
            height: _deviceHeight! * 0.83,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.01),
            child: _moviesListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _topbarWidget() {
    return Container(
      height: _deviceHeight! * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SearchBarWidget(),
          _categorySelection(),
        ],
      ),
    );
  }

  Widget _SearchBarWidget() {
    final _border = InputBorder.none;
    return Container(
      width: _deviceWidth! * 0.5,
      height: _deviceHeight! * 0.05,
      child: TextField(
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        controller: _searchtextcontroller,
        onSubmitted: (_input) {},
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white54,
            ),
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            filled: false,
            fillColor: Colors.white24,
            hintText: ("Search....")),
      ),
    );
  }

  Widget _categorySelection() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {},
      items: [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(
              color: Colors.white24,
            ),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(
              color: Colors.white24,
            ),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(
              color: Colors.white24,
            ),
          ),
          value: SearchCategory.none,
        )
      ],
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie>? _movies = _mainPageData?.movie;

    if (_movies?.isEmpty ?? true) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }

    return ListView.builder(
      itemCount: _movies!.length,
      itemBuilder: (BuildContext _context, int _count) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: _deviceHeight! * 0.01,
            horizontal: 0,
          ),
          child: GestureDetector(
            onTap: () {
              // Handle item tap here
            },
            child: MovieTile(
              movie: _movies[_count],
              height: _deviceHeight! * 0.20,
              width: _deviceWidth! * 0.85,
            ),
          ),
        );
      },
    );
  }

}
