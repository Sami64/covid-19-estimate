import 'package:covid_impact/injection_container.dart';
import 'package:covid_impact/presentation/bloc/show_estimates_bloc.dart';
import 'package:covid_impact/presentation/widgets/input_widget.dart';
import 'package:covid_impact/presentation/widgets/loading_widget.dart';
import 'package:covid_impact/presentation/widgets/results_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputEstimatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estimate COVID-19'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: bodyBuild(context)),
    );
  }
}

BlocProvider<ShowEstimatesBloc> bodyBuild(BuildContext context) {
  final halfWidth = MediaQuery.of(context).size.width / 2.0;
  return BlocProvider(
    create: (_) => sl<ShowEstimatesBloc>(),
    child: Center(
      child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              BlocBuilder<ShowEstimatesBloc, ShowEstimatesState>(
                builder: (context, state) {
                  if (state is ShowEstimatesInitial) {
                    return InputWidget(halfWidth: halfWidth);
                  } else if (state is ShowEstimatesLoading) {
                    return LoadingWidget();
                  } else if (state is ShowEstimatesLoaded) {
                    return ResultsSheet(
                      estimates: state.estimates,
                    );
                  }
                },
              )
            ],
          )),
    ),
  );
}
