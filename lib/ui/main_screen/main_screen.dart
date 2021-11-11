import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitty_world/model/fetch_result.dart';
import 'package:kitty_world/resources/animation_util.dart';
import 'package:kitty_world/resources/general_theme.dart';
import 'package:kitty_world/resources/text_resources.dart';
import 'package:kitty_world/ui/main_screen/views/error/error_view.dart';
import 'package:kitty_world/ui/main_screen/views/fact/facts_view.dart';
import 'package:kitty_world/ui/main_screen/views/loading/loading_view.dart';
import 'package:kitty_world/viewModel/main/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatefulWidget {
  ///
  /// Main screen of the application - Containing the [MainLayout] and the [FactList]
  ///
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// It's used for,
  ///
  /// a. starting to fetch new data from the next page
  ///
  /// b. triggering the background animation
  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (viewModel) {
        _requestNewContent(viewModel, firstTime: true);
        _registerForMoreData(viewModel);
      },
      builder: (context, viewModel, child) {
        return AnimatedSwitcher(
          duration: AnimationUtil.longPeriod,
          child: _onFetchResultChanged(viewModel),
        );
      },
    );
  }

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  ///
  /// It chooses sub-view based on the latest [FetchResult] of [MainViewModel]
  ///
  ///
  Widget _onFetchResultChanged(MainViewModel vm) {
    if (vm.latestResult is FetchContent) {
      var result = vm.latestResult as FetchContent;
      return FactsView(
        scrollController: scrollController,
        fetchListSize: result.perPage,
        imageUrl: (index) => vm.getRandomImageUrl(index),
        facts: result.facts,
        onTap: (details) =>
            vm.onItemTap(context, details),
      );
    } else if (vm.latestResult is Fetching) {
      return const LoadingView();
    } else {
      var error = (vm.latestResult as FetchError).error;
      return ErrorView(error: error);
    }
  }


  ///
  /// It request contents from viewModel.
  ///
  /// [firstTime] - If it is false, by requesting new content, it fires scroll animation
  void _requestNewContent(MainViewModel viewModel, {required bool firstTime}) {
    viewModel.getContent().whenComplete(() {
      if (!firstTime) {
        _animateListView();
      }
      ScaffoldMessenger.of(context).clearSnackBars();
    }).catchError((e,s){setState(() {viewModel.latestResult=FetchError("error");});});
  }


  ///
  /// It scrolls to new fetched content
  void _animateListView() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent +
          (MediaQuery.of(context).size.height),
      duration: AnimationUtil.shortPeriod,
      curve: Curves.linearToEaseOut,
    );
  }


  ///
  /// It setup listView listener to respond to scroll-up for load new data
  void _registerForMoreData(MainViewModel viewModel) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              padding: AppTheme.edge16,
              backgroundColor: Theme.of(context).primaryColor,
              content: Text(
                TextResource.snackBarText,
                style: AppTheme.textStyleLarge21,
              )),
        );
        _requestNewContent(viewModel, firstTime: false);
      }
    });
  }
}
