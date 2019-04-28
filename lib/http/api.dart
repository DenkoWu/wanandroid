class Api{
  /// 成功码
  static const int SUCCESS=0;

  /// Baseulr
  static const String BaseURL="https://www.wanandroid.com/";

  /// 首页banner banner/json
  static const String BANNER="banner";

  ///首页文章列表
  static const String HOME_LIST="article/list/";

  /// 提供获取方法，方便补充、修改参数
  static String getPath({String path='',int page,String resType:'json'}){
    StringBuffer stringBuffer=new StringBuffer(path);
    if(page!=null){
      stringBuffer.write('$page');
    }
    if(resType!=null&&resType.isNotEmpty){
      stringBuffer.write('/$resType');
    }
    return stringBuffer.toString();
  }
}