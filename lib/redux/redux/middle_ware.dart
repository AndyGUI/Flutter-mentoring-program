import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';
import 'package:flutter_mentoring_programm/redux/redux/some_epic.dart';
import 'package:redux_epics/redux_epics.dart';

final epicMiddleware = EpicMiddleware<AppStore>(mainAppEpic());

Epic<AppStore> mainAppEpic() {
  return (Stream<dynamic> actions, EpicStore<AppStore> store) {
    return StreamGroup.merge([
      someFancyEpic

      /// You can add here as many separate epics as
      /// you want
      /** Stream<dynamic> connectionEpic(
                                   Stream<dynamic> actions,
                                   EpicStore<AppStore> store,
                                   ) {}
                                */
    ].map((epic) => epic(actions, store)));
  };
}
