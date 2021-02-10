import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';

class OnLoadingBuilder extends StatelessWidget {
  final Function(BuildContext context, bool isLoading) builder;

  OnLoadingBuilder({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.isLoading,
      builder: builder,
    );
  }
}
