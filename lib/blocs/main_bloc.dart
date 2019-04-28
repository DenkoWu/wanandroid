import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:wanandroid/http/http_helper.dart';
import 'package:wanandroid/model/banner_mdel.dart';
import 'package:wanandroid/model/home_list.dart';

import 'bloc_provider.dart';

class MainBloc implements BlocBase {
  HttpHelper httpHelper = new HttpHelper();

  BehaviorSubject<List<BannerModel>> _banner =
      BehaviorSubject<List<BannerModel>>();

  Sink<List<BannerModel>> get _bannerSink => _banner.sink;

  Stream<List<BannerModel>> get bannerStream => _banner.stream;

  Future getBanner() {
    return httpHelper.getBanner().then((list) {
      _bannerSink.add(UnmodifiableListView<BannerModel>(list));
    });
  }

  BehaviorSubject<HomeBean> _home = BehaviorSubject<HomeBean>();

  Sink<HomeBean> get _homeSink => _home.sink;

  Stream<HomeBean> get homeStranm => _home.stream;

  Future getHomeList(bool isRefresh) {
    int page = 0;
    if (isRefresh) {
      page = 0;
    } else {
      page++;
    }
    httpHelper.getHome(page).then((bean) {
      _homeSink.add(bean);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _banner.close();
    _home.close();
  }
}
