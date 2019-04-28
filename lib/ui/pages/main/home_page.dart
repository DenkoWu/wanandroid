import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid/blocs/bloc_provider.dart';
import 'package:wanandroid/blocs/main_bloc.dart';
import 'package:wanandroid/model/banner_mdel.dart';
import 'package:wanandroid/model/home_list.dart';
import 'package:wanandroid/ui/widget/listview_item1.dart';
import 'package:wanandroid/ui/widget/refresh_scaffold.dart';
import 'package:wanandroid/ui/widget/widgets.dart';
import 'package:wanandroid/utils/navigator_util.dart';
export 'package:wanandroid/values/_res_index.dart';

import 'package:wanandroid/ui/widget/listview_item.dart';

class HomePage extends StatefulWidget {
  final String labelId;

  //重载构造方法
  const HomePage({Key key, this.labelId}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(labelId);
}

Widget buildBanner(BuildContext context, List<BannerModel> list) {
  //为空时返回空组件
  if (ObjectUtil.isEmpty(list)) {
    return new Container(height: 0.0);
  }
  return AspectRatio(
    aspectRatio: 16.0 / 9.0,
    child: Swiper(
      indicatorAlignment: AlignmentDirectional.topEnd,
      circular: true,
      interval: const Duration(seconds: 5),
//      indicator: NumberSwiperIndicator(),
      children: list.map((model) {
        return InkWell(
          onTap: () {
            LogUtil.e("BannerModel: " + model.toString());
            NavigatorUtil.pushWeb(context, title: model.title, url: model.url);
          },
          child: new CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: model.imagePath,
            placeholder: (context, url) => new ProgressView(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildHomeList(BuildContext context, List<DatasListBean> list) {
  BoxDecoration(
    borderRadius: BorderRadius.circular(3),
//    boxShadow: [offset:off],
  );

  List<Widget> widgets = list.map((model) {
    return ListViewItem(data: model);
    ;
  }).toList();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: widgets,
  );
}

class _HomePageState extends State<HomePage> {
  String labelId;
  RefreshController _controller = new RefreshController();

  _HomePageState(String content) {
    this.labelId = content;
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    bloc.getBanner();
    bloc.getHomeList(true);
    return StreamBuilder(
        stream: bloc.bannerStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<BannerModel>> snapshot) {
          return RefreshScaffold(
            labelId: labelId,
            isLoading: snapshot.data == null,
            controller: _controller,
            enablePullUp: false,
            onRefresh: () {
              return bloc.getBanner();
            },
            child: ListView(
              children: <Widget>[
                buildBanner(context, snapshot.data),
                StreamBuilder(
                  stream: bloc.homeStranm,
                  builder:
                      (BuildContext context, AsyncSnapshot<HomeBean> model) {
                    if (model.data == null) {
                      return new Container(
                        height: 0.0,
                      );
                    }
                    return buildHomeList(context, model.data.datas);
                  },
                ),
              ],
            ),
          );
        });
  }
}
