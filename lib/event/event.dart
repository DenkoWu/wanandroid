import 'package:pull_to_refresh/pull_to_refresh.dart';

///用于持续监听
class StatusEvent {
//  int status;
  int cid;
  RefreshStatus status;

  StatusEvent(this.status, {this.cid});
}
