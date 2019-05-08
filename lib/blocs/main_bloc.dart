import 'dart:collection';

import 'package:common_utils/common_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wanandroid/event/event.dart';
import 'package:wanandroid/http/api.dart';
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

  BehaviorSubject<List<DatasListBean>> _home =
      BehaviorSubject<List<DatasListBean>>();

  Sink<List<DatasListBean>> get _homeSink => _home.sink;

  Stream<List<DatasListBean>> get homeStranm => _home.stream;

  List<DatasListBean> _homeList;
  int page = 0;

  Future getHomeList(bool isRefresh) {
    return httpHelper.getHome(page).then((bean) {
      if (_homeList == null) {
        _homeList = new List();
      }
      if (isRefresh) {
        page = 0;
        _homeList.clear();
      } else {
        page++;
      }
      _homeList.addAll(bean.datas);
      _homeSink.add(_homeList);
      LogUtil.e("首页发起请求page=" +
          page.toString() +
          "------------------------" +
          bean.datas.length.toString());
      //最多加载5页
      _homeEventSink.add(new StatusEvent(
          bean.datas != null && bean.datas.length > 5 && page <= 3
              ? RefreshStatus.idle
              : RefreshStatus.noMore));
    }).catchError((_) {
      page--;
      _homeEventSink.add(new StatusEvent(RefreshStatus.failed));
    });
  }

  BehaviorSubject<StatusEvent> _homeEvent = BehaviorSubject<StatusEvent>();

  Sink<StatusEvent> get _homeEventSink => _homeEvent.sink;

  Stream<StatusEvent> get homeEventStream =>
      _homeEvent.stream.asBroadcastStream();

  @override
  void dispose() {
    // TODO: implement dispose
    _banner.close();
    _home.close();
    _homeEvent.close();
  }
}
