import 'package:wanandroid/http/api.dart';
import 'package:wanandroid/http/dio_util.dart';
import 'package:wanandroid/model/banner_mdel.dart';

class HttpHelper{
  Future<List<BannerMdel>> getBanner() async{
    BaseResp<List> baseResp=await DioUtil().request(Method.get, Api.getPath(path: Api.BANNER));
    List<BannerMdel> bannerList;
    if(baseResp.code!=Api.SUCCESS){
      return Future.error(baseResp.msg);
    }
    if(baseResp.data!=null){
      bannerList=baseResp.data.map((value){
        return BannerMdel.fromJson(value);
      }).toList();
    }
      return bannerList;
    }

}