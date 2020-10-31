import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_weather/actions/home_action.dart';
import 'package:my_weather/common/app_theme.dart';
import 'package:my_weather/common/constants.dart';
import 'package:my_weather/models/weather_forecast.dart';
import 'package:redux/redux.dart';

import '../../models/states/app_state.dart';
import '../../models/user.dart';

class WeatherForecastContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (Store<AppState> store) =>
          store.dispatch(RetrieveWeatherForecast()),
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return _buildBody(context, viewModel);
      },
    );
  }
}

Widget _buildBody(BuildContext context, _ViewModel viewModel) {
  return Scaffold(body: OrientationBuilder(builder: (_, orientation) {
    if (orientation == Orientation.portrait)
      return _buildPortraitLayout(context,
          viewModel); // if orientation is portrait, show your portrait layout
    else
      return _buildLandscapeLayout(
          context, viewModel); // else show the landscape one
  }));
}

Widget _buildHeader(_ViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      Labels.WEATHER_FORECAST,
      style: AppTheme.instance.h2Bold,
    ),
  );
}

Widget _buildPortraitTable(BuildContext context, _ViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
        child: Table(
      defaultColumnWidth:
          FixedColumnWidth((MediaQuery.of(context).size.width - 32) / 2),
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: _buildTableRowsForPortrait(viewModel.forecasts),
    )),
  );
}

Widget _buildLandscapeTable(BuildContext context, _ViewModel viewModel) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
        child: Table(
      defaultColumnWidth:
          FixedColumnWidth((MediaQuery.of(context).size.width - 32) / 6),
      border: TableBorder.all(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 2,
      ),
      children: _buildTableRowsForLandscape(viewModel.forecasts),
    )),
  );
}

Widget _buildPortraitLayout(BuildContext context, _ViewModel viewModel) {
  return Container(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildHeader(viewModel),
          _buildPortraitTable(context, viewModel),
        ],
      ),
    ),
  );
}

List<TableRow> _buildTableRowsForPortrait(List<WeatherForecast> forecasts) {
  List<TableRow> weatherForecastRows = List<TableRow>();
  weatherForecastRows.add(TableRow(
    children: _buildTableHeaderForPortrait(),
  ));
  forecasts.forEach((forecast) {
    weatherForecastRows.add(TableRow(
      children: _buildConcatenatedListForPortrait(forecast),
    ));
  });
  return weatherForecastRows;
}

List<TableRow> _buildTableRowsForLandscape(List<WeatherForecast> forecasts) {
  List<TableRow> weatherForecastRows = List<TableRow>();
  weatherForecastRows.add(TableRow(
    children: _buildTableHeaderForLandscape(),
  ));
  forecasts.forEach((forecast) {
    weatherForecastRows.add(TableRow(
      children: _buildConcatenatedListForLandscape(forecast),
    ));
  });
  return weatherForecastRows;
}

List<Widget> _buildTableHeaderForPortrait() {
  List<Widget> weatherForecastRows = List<Widget>();
  weatherForecastRows.add(Column(
      children: [Text('Date (mm/dd/yyy)', style: AppTheme.instance.h2Bold)]));
  weatherForecastRows.add(Column(
      children: [Text('Temperature (F)', style: AppTheme.instance.h2Bold)]));
  return weatherForecastRows;
}

List<Widget> _buildTableHeaderForLandscape() {
  List<Widget> weatherForecastRows = List<Widget>();
  weatherForecastRows.add(Column(
      children: [Text('Date (mm/dd/yyy)', style: AppTheme.instance.h2Bold)]));
  weatherForecastRows.add(
      Column(children: [Text('Temp (F)', style: AppTheme.instance.h2Bold)]));
  weatherForecastRows.add(
      Column(children: [Text('Description', style: AppTheme.instance.h2Bold)]));
  weatherForecastRows
      .add(Column(children: [Text('Main', style: AppTheme.instance.h2Bold)]));
  weatherForecastRows.add(
      Column(children: [Text('Pressure', style: AppTheme.instance.h2Bold)]));
  weatherForecastRows.add(
      Column(children: [Text('Humidity', style: AppTheme.instance.h2Bold)]));
  return weatherForecastRows;
}

List<Widget> _buildConcatenatedListForPortrait(WeatherForecast forecast) {
  List<Widget> weatherForecastRows = List<Widget>();
  weatherForecastRows.add(Column(
      children: [Text('${forecast.date}', style: AppTheme.instance.text)]));
  weatherForecastRows.add(Column(
      children: [Text('${forecast.tempInF}', style: AppTheme.instance.text)]));
  return weatherForecastRows;
}

List<Widget> _buildConcatenatedListForLandscape(WeatherForecast forecast) {
  List<Widget> weatherForecastRows = List<Widget>();
  weatherForecastRows.add(Column(
      children: [Text('${forecast.date}', style: AppTheme.instance.text)]));
  weatherForecastRows.add(Column(
      children: [Text('${forecast.tempInF}', style: AppTheme.instance.text)]));
  weatherForecastRows.add(Column(children: [
    Text('${forecast.description}', style: AppTheme.instance.text)
  ]));
  weatherForecastRows.add(Column(
      children: [Text('${forecast.main}', style: AppTheme.instance.text)]));
  weatherForecastRows.add(Column(
      children: [Text('${forecast.pressure}', style: AppTheme.instance.text)]));
  weatherForecastRows.add(Column(
      children: [Text('${forecast.humidity}', style: AppTheme.instance.text)]));
  return weatherForecastRows;
}

Widget _buildLandscapeLayout(BuildContext context, _ViewModel viewModel) {
  return Container(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildHeader(viewModel),
          _buildLandscapeTable(context, viewModel),
        ],
      ),
    ),
  );
}

// Todo: Put to a different file to be re-usable

class _ViewModel {
  final bool isAuthenticated;
  final User user;
  final List<WeatherForecast> forecasts;

  _ViewModel({
    @required this.isAuthenticated,
    @required this.user,
    this.forecasts,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isAuthenticated: store.state.authState.isAuthenticated,
      user: store.state.authState.user,
      forecasts: store.state.homeState.forecasts,
    );
  }
}
