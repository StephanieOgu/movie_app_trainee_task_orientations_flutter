import 'package:films_app_trainee_task/localisation.dart';
import 'package:films_app_trainee_task/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neonBlue,
      child: OrientationBuilder(builder: (context, orientation) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildBigBcCircle(context),
            _buildSmallBcCircle(context),
            Positioned(
              top: 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLogoImage(context),
                    if (orientation == Orientation.portrait)
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: _buildButtonChildren(context),
                          ))
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildButtonChildren(context),
                      )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildBigBcCircle(BuildContext context) {
    return Positioned(
        top: -350,
        right: -350,
        width: 700,
        height: 700,
        child: _buildBcCircle());
  }

  List<Widget> _buildButtonChildren(BuildContext context) {
    return [
      buildButton(MovieAppLocalizations.mainScreenBlocBtnText, context),
      buildButton(MovieAppLocalizations.mainScreenMVVMBtnText, context),
    ];
  }

  Widget _buildSmallBcCircle(BuildContext context) {
    return Positioned(
        bottom: -250,
        left: -250,
        width: 500,
        height: 500,
        child: _buildBcCircle());
  }

  Container _buildBcCircle() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSlateBlue,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildButton(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }

  Image _buildLogoImage(BuildContext context) {
    return Image(
      height: 2 * MediaQuery.of(context).size.height / 3,
      image: const AssetImage('assets/images/logo.png'),
    );
  }
}
