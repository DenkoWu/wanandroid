import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:wanandroid/http/http_helper.dart';
import 'package:wanandroid/model/banner_mdel.dart';

import 'bloc_provider.dart';

class MainBloc implements BlocBase {
  HttpHelper httpHelper=new HttpHelper();

  BehaviorSubject<List<BannerModel>> _banner =
      BehaviorSubject<List<BannerModel>>();

  Sink<List<BannerModel>> get _bannerSink => _banner.sink;

  Stream<List<BannerModel>> get bannerStream => _banner.stream;
  Future getBanner(String labelId) {
    return httpHelper.getBanner().then((list) {
      _bannerSink.add(UnmodifiableListView<BannerModel>(list));
    });
  }

  Future getHomeData(String labelId) {
//    getRecRepos(labelId);
//    getRecWxArticle(labelId);
    return getBanner(labelId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _banner.close();
  }

//  @override
//  Future getData({String labelId, int page}) {
//      switch (labelId) {
//        case "主页":
//          return getHomeData(labelId);
//          break;
////        case Ids.titleRepos:
////          return getArticleListProject(labelId, page);
////          break;
////        case Ids.titleEvents:
////          return getArticleList(labelId, page);
////          break;
////        case Ids.titleSystem:
////          return getTree(labelId);
//          break;
//        default:
//          return Future.delayed(new Duration(seconds: 1));
//          break;
//      }
//    }
//
//  @override
//  Future onLoadMore({String labelId}) {
//    int _page = 0;
//    switch (labelId) {
//      case Ids.titleHome:
//        break;
////      case Ids.titleRepos:
////        _page = ++_reposPage;
////        break;
////      case Ids.titleEvents:
////        _page = ++_eventsPage;
////        break;
////      case Ids.titleSystem:
////        break;
//      default:
//        break;
//    }
//    LogUtil.e("onLoadMore labelId: $labelId" +
//        "   _page: $_page" +
//        "   _reposPage: ");
//    return getData(labelId: labelId, page: _page);
//  }
//
//  @override
//  Future onRefresh({String labelId}) {
//    switch (labelId) {
//      case Ids.titleHome:
////        getHotRecItem();
////        break;
////      case Ids.titleRepos:
////        _reposPage = 0;
////        break;
////      case Ids.titleEvents:
////        _eventsPage = 0;
////        break;
////      case Ids.titleSystem:
////        break;
//      default:
//        break;
//    }
////    LogUtil.e("onRefresh labelId: $labelId" + "   _reposPage: $_reposPage");
//    return getData(labelId: labelId, page: 0);
//  }
}
