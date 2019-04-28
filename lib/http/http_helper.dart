import 'package:common_utils/common_utils.dart';
import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_util.dart';
import 'package:wanandroid/model/banner_mdel.dart';
import 'package:wanandroid/model/home_list.dart';

class HttpHelper{
  Future<List<BannerModel>> getBanner() async{
    LogUtil.e("发起请求==》"+ Api.getPath(path: Api.BANNER));
    BaseResp<List> baseResp=await DioUtil().request(Method.get, Api.getPath(path: Api.BANNER));
    List<BannerModel> bannerList;
    if(baseResp.code!=Api.SUCCESS){
      return Future.error(baseResp.msg);
    }

    if(baseResp.data!=null){
      bannerList=baseResp.data.map((value){
        return BannerModel.fromJson(value);
      }).toList();
    }
      return bannerList;
    }

    Future<HomeBean> getHome(int page) async{
      LogUtil.e("首页发起请求"+Api.getPath(path: Api.HOME_LIST,page: page));
    BaseResp baseResp=await DioUtil().request(Method.get, Api.getPath(page: page,path: Api.HOME_LIST));
    HomeBean bean;
      if (baseResp.code!=Api.SUCCESS) {
        return Future.error(baseResp.msg);
      }
      if(baseResp.data!=null){
        bean=HomeBean.fromJson(baseResp.data);
      }
      return bean;
    }
}