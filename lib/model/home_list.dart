class HomeBean {
  bool over;
  int curPage;
  int offset;
  int pageCount;
  int size;
  int total;
  List<DatasListBean> datas;

  HomeBean({this.over, this.curPage, this.offset, this.pageCount, this.size, this.total, this.datas});

  HomeBean.fromJson(Map<String, dynamic> json) {
    this.over = json['over'];
    this.curPage = json['curPage'];
    this.offset = json['offset'];
    this.pageCount = json['pageCount'];
    this.size = json['size'];
    this.total = json['total'];
    this.datas = (json['datas'] as List)!=null?(json['datas'] as List).map((i) => DatasListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['over'] = this.over;
    data['curPage'] = this.curPage;
    data['offset'] = this.offset;
    data['pageCount'] = this.pageCount;
    data['size'] = this.size;
    data['total'] = this.total;
    data['datas'] = this.datas != null?this.datas.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class DatasListBean {
  String apkLink;
  String author;
  String chapterName;
  String desc;
  String envelopePic;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  String superChapterName;
  String title;
  bool collect;
  bool fresh;
  int chapterId;
  int courseId;
  int id;
  int superChapterId;
  int type;
  int userId;
  int visible;
  int zan;
  num publishTime;
  DatasListBean({this.apkLink, this.author, this.chapterName, this.desc, this.envelopePic, this.link, this.niceDate, this.origin, this.prefix, this.projectLink, this.superChapterName, this.title, this.collect, this.fresh, this.chapterId, this.courseId, this.id, this.superChapterId, this.type, this.userId, this.visible, this.zan, this.publishTime});

  DatasListBean.fromJson(Map<String, dynamic> json) {
    this.apkLink = json['apkLink'];
    this.author = json['author'];
    this.chapterName = json['chapterName'];
    this.desc = json['desc'];
    this.envelopePic = json['envelopePic'];
    this.link = json['link'];
    this.niceDate = json['niceDate'];
    this.origin = json['origin'];
    this.prefix = json['prefix'];
    this.projectLink = json['projectLink'];
    this.superChapterName = json['superChapterName'];
    this.title = json['title'];
    this.collect = json['collect'];
    this.fresh = json['fresh'];
    this.chapterId = json['chapterId'];
    this.courseId = json['courseId'];
    this.id = json['id'];
    this.superChapterId = json['superChapterId'];
    this.type = json['type'];
    this.userId = json['userId'];
    this.visible = json['visible'];
    this.zan = json['zan'];
    this.publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apkLink'] = this.apkLink;
    data['author'] = this.author;
    data['chapterName'] = this.chapterName;
    data['desc'] = this.desc;
    data['envelopePic'] = this.envelopePic;
    data['link'] = this.link;
    data['niceDate'] = this.niceDate;
    data['origin'] = this.origin;
    data['prefix'] = this.prefix;
    data['projectLink'] = this.projectLink;
    data['superChapterName'] = this.superChapterName;
    data['title'] = this.title;
    data['collect'] = this.collect;
    data['fresh'] = this.fresh;
    data['chapterId'] = this.chapterId;
    data['courseId'] = this.courseId;
    data['id'] = this.id;
    data['superChapterId'] = this.superChapterId;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['visible'] = this.visible;
    data['zan'] = this.zan;
    data['publishTime'] = this.publishTime;
    return data;
  }
}


