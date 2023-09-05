import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowingExample extends StatelessWidget {
  const ShowingExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AwsShowingScreen(
        contents: [
          AwsContentShowing(
              image: 'assets/imgs/loading1.jpg',
              title: 'title 1',
              body:
                  'Voluptate mollit tempor non consectetur minim elit. Et voluptate dolore veniam labore in nisi consequat ex aute labore occaecat. Officia nulla consequat et dolor veniam. Non aliqua reprehenderit eiusmod esse ipsum consequat deserunt duis aliqua Lorem adipisicing est.'),
          AwsContentShowing(
              image: 'assets/imgs/loading2.jpg',
              title: 'title 2',
              body:
                  'Voluptate mollit tempor non consectetur minim elit. Et voluptate dolore veniam labore in nisi consequat ex aute labore occaecat. Officia nulla consequat et dolor veniam. Non aliqua reprehenderit eiusmod esse ipsum consequat deserunt duis aliqua Lorem adipisicing est.'),
          AwsContentShowing(
              image: 'assets/imgs/loading3.jpg',
              title: 'title 3',
              body:
                  'Voluptate mollit tempor non consectetur minim elit. Et voluptate dolore veniam labore in nisi consequat ex aute labore occaecat. Officia nulla consequat et dolor veniam. Non aliqua reprehenderit eiusmod esse ipsum consequat deserunt duis aliqua Lorem adipisicing est.'),
        ],
        leading: AwsTextButtonShowing(
          text: 'Iniciar sesión',
          animation: AwsAnimation.zoomIn,
          confirmationDialog: CupertinoAlertDialog(
            title: const Text('Estas seguro?'),
            content: const Text(
                'Te recomendamos no hacerlo si eres un usuario nuevo.'),
            actions: [
              CupertinoButton(
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(color: CupertinoColors.destructiveRed),
                ),
                onPressed: () {},
              ),
              CupertinoButton(
                child: const Text(
                  'Continuar',
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        finishLeading: AwsTextButtonShowing(
          text: 'Iniciar sesión',
          onPressed: () {},
        ),
        trailing: AwsTextButtonShowing(
          text: 'Crear cuenta',
          filledColor: CupertinoColors.activeBlue,
          style: const TextStyle(color: CupertinoColors.white),
          isExpanded: true,
          animation: AwsAnimation.bounceInUp,
          onPressed: () {},
        ),
        theme: AwsThemeShowing(
          backgroundColor: Colors.white,
          indicator: AwsThemeIndicatorShowing(),
          nextButton: AwsThemeNextButtonShowing(),
          content: AwsThemeContentShowing(
            animationImage: AwsAnimation.zoomIn,
            animationTitle: AwsAnimation.elasticInLeft,
            animationBody: AwsAnimation.elasticInRight,
            titleStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class AwsConnectionExample extends StatelessWidget {
  AwsConnectionExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var net = AwsConnection();

    return Scaffold(
      body: Center(
        child: StreamBuilder<AwsConnectionStatus>(
          stream: net.onStatusChange,
          builder: (BuildContext context,
              AsyncSnapshot<AwsConnectionStatus> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == AwsConnectionStatus.connected) {
                return Text('Estado: Conectado');
              }
            }
            return Text('Estado: Fuera de linea');
          },
        ),
      ),
    );
  }
}

class AwsScreenSizeExample extends StatefulWidget {
  const AwsScreenSizeExample({super.key});

  @override
  State<AwsScreenSizeExample> createState() => _AwsScreenSizeExampleState();
}

class _AwsScreenSizeExampleState extends State<AwsScreenSizeExample> {
  TextEditingController width = TextEditingController(text: '100');
  TextEditingController height = TextEditingController(text: '100');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width(100),
        height: context.height(100),
        color: Colors.purple,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: context.width(double.parse(width.text)),
              height: context.height(double.parse(height.text)),
              color: Colors.amber,
            ),
            Positioned(
              bottom: 10,
              child: Center(
                child: Container(
                  width: context.width(100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: context.width(49),
                        child: CupertinoTextField(
                          controller: width,
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.number,
                          suffix: Icon(Icons.percent),
                          prefix: Text('Width:\t'),
                          placeholder: '1-100%',
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: context.width(49),
                        child: CupertinoTextField(
                          controller: height,
                          textInputAction: TextInputAction.go,
                          keyboardType: TextInputType.number,
                          suffix: Icon(Icons.percent),
                          prefix: Text('Height:\t'),
                          placeholder: '1-100%',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AwsFormatterExample extends StatelessWidget {
  const AwsFormatterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Original:\t${DateTime.now().toString()}',
              ),
              Text(
                'YMD:\t${AwsFormatter.ymd.format(
                  DateTime.now(),
                )}',
              ),
              Text(
                'YM:\t${AwsFormatter.ym.format(
                  DateTime.now(),
                )}',
              ),
              Text(
                'KMA:\t${AwsFormatter.kma.format(
                  DateTime.now(),
                )}',
              ),
              Text(
                'COMPLETTIME:\t${AwsFormatter.completTime(hour: 12, minute: 5)}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AwsGeneratorsExample extends StatelessWidget {
  const AwsGeneratorsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AwsGenerators.year().toString()),
            Text('start: 1923'),
            Text('finish:2023'),
          ],
        ),
      ),
    );
  }
}

class AwsHasExample extends StatefulWidget {
  const AwsHasExample({super.key});

  @override
  State<AwsHasExample> createState() => _AwsHasExampleState();
}

class _AwsHasExampleState extends State<AwsHasExample> {
  TextEditingController controllerHas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Respueta:\t${controllerHas.text}'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                textInputAction: TextInputAction.done,
                clearButtonMode: OverlayVisibilityMode.editing,
                onChanged: (value) {
                  if (AwsHas.url(value)) {
                    controllerHas.text = 'Es una url';
                  }
                  if (AwsHas.email(value)) {
                    controllerHas.text = 'Es Email';
                  }
                  if (AwsHas.password(value)) {
                    controllerHas.text = 'Es un password valido';
                  }
                  if (controllerHas.text.isEmpty) {
                    controllerHas.text = '';
                  }
                  setState(() {});
                },
                keyboardType: TextInputType.text,
                prefix: Text('Has:\t'),
                placeholder: 'Ingrese un texto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AwsAniWidgetExample extends StatefulWidget {
  const AwsAniWidgetExample({super.key});

  @override
  State<AwsAniWidgetExample> createState() => _AwsAniWidgetExampleState();
}

class _AwsAniWidgetExampleState extends State<AwsAniWidgetExample>
    with TickerProviderStateMixin {
  AnimationController? controller;

  AwsAnimation seletectedAnimation = AwsAnimation.bounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Algunás animaciones no son compatibles entre si, en todo caso requiere ejecutarla de forma manual. (Example)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              AwsAniWidget(
                setting: AwsAniSetting(
                  animation: seletectedAnimation,
                  controller: (cont) => controller = cont,
                  manualTrigger: true,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: context.height(10),
        width: context.width(100),
        padding: EdgeInsets.all(10),
        alignment: Alignment.bottomCenter,
        child: DropdownButton<AwsAnimation>(
          underline: Container(),
          value: seletectedAnimation,
          isExpanded: true,
          dropdownColor: Colors.transparent,
          elevation: 0,
          items: List.generate(
              AwsAnimation.values.length,
              (index) => DropdownMenuItem(
                  value: AwsAnimation.values[index],
                  child: Text(AwsAnimation.values[index].name))),
          onChanged: (value) {
            setState(() {
              seletectedAnimation = value!;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            controller
              ?..reset()
              ..forward();
          }),
    );
  }
}

class AwsCheckextButtonExample extends StatefulWidget {
  const AwsCheckextButtonExample({super.key});

  @override
  State<AwsCheckextButtonExample> createState() =>
      _AwsCheckextButtonExampleState();
}

class _AwsCheckextButtonExampleState extends State<AwsCheckextButtonExample> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AwsCheckextButton',
                  style: TextStyle(fontSize: 25),
                ),
                AwsCheckextButton(
                  value: check,
                  text: Text('Checkext'),
                  onChanged: (v) => setState(() => check = !check),
                ),
                AwsCheckextButton(
                  value: check,
                  text: Text('textCheck'),
                  textCheck: true,
                  onChanged: (v) => setState(() => check = !check),
                ),
                AwsCheckextButton(
                  value: false,
                  text: Text('textCheck'),
                ),
                AwsCheckextButton(
                  value: false,
                  textCheck: true,
                  text: Text('textCheck'),
                ),
                AwsCheckextButton(
                  value: check,
                  expanded: true,
                  onChanged: (v) => setState(() => check = !check),
                  text: Text('textCheck'),
                ),
                AwsCheckextButton(
                  value: check,
                  expanded: true,
                  textCheck: true,
                  onChanged: (v) => setState(() => check = !check),
                  text: Text('textCheck'),
                ),
                AwsCheckextButton(
                  value: check,
                  expanded: true,
                  text: Text('textCheck'),
                ),
                AwsCheckextButton(
                  value: check,
                  expanded: true,
                  textCheck: true,
                  text: Text('textCheck'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AwsDuoButtonExample extends StatelessWidget {
  const AwsDuoButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black.withOpacity(.4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AwsDuoButton',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  AwsDuoButton(
                    icon: Icons.book,
                    text: 'Book',
                    animationOnLongPress: AwsAnimation.dance,
                    animations: [
                      AwsAniSetting(animation: AwsAnimation.bounceInLeft),
                      AwsAniSetting(
                          animation: AwsAnimation.bounceInLeft,
                          delay: Duration(milliseconds: 550)),
                    ],
                    onPressed: () {
                      print('object');
                    },
                  ),
                  SizedBox(height: 50),
                  AwsDuoButton(
                    icon: Icons.book,
                    text: 'Book',
                    animationOnLongPress: AwsAnimation.dance,
                    standalone: true,
                    onPressed: () {
                      print('object');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AwsDynaflotButtonExample extends StatelessWidget {
  const AwsDynaflotButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AwsDynaflotButton(
          child: Center(
            child: Container(
              child: Text('Body'),
            ),
          ),
          icon: AwsIconDynaflot(open: Icons.add, closed: Icons.close),
          options: [
            AwsDuoButton(
              icon: Icons.book,
              text: 'Book Prim',
              animationOnLongPress: AwsAnimation.dance,
              animations: [
                AwsAniSetting(animation: AwsAnimation.bounceInLeft),
                AwsAniSetting(
                    animation: AwsAnimation.bounceInLeft,
                    delay: Duration(milliseconds: 550)),
              ],
              onPressed: () {
                print('object');
              },
            ),
            AwsDuoButton(
              icon: Icons.book,
              text: 'Book Duo',
              animationOnLongPress: AwsAnimation.dance,
              animations: [
                AwsAniSetting(animation: AwsAnimation.bounceInLeft),
                AwsAniSetting(
                    animation: AwsAnimation.bounceInLeft,
                    delay: Duration(milliseconds: 550)),
              ],
              onPressed: () {
                print('object');
              },
            ),
            AwsDuoButton(
              icon: Icons.book,
              text: 'Book Plan',
              animationOnLongPress: AwsAnimation.dance,
              animations: [
                AwsAniSetting(animation: AwsAnimation.bounceInLeft),
                AwsAniSetting(
                    animation: AwsAnimation.bounceInLeft,
                    delay: Duration(milliseconds: 550)),
              ],
              onPressed: () {
                print('object');
              },
            ),
            AwsDuoButton(
              icon: Icons.book,
              text: 'Book Uni',
              animationOnLongPress: AwsAnimation.dance,
              animations: [
                AwsAniSetting(animation: AwsAnimation.bounceInLeft),
                AwsAniSetting(
                    animation: AwsAnimation.bounceInLeft,
                    delay: Duration(milliseconds: 550)),
              ],
              onPressed: () {
                print('object');
              },
            ),
            AwsDuoButton(
              icon: Icons.book,
              text: 'Book Save',
              animationOnLongPress: AwsAnimation.dance,
              animations: [
                AwsAniSetting(animation: AwsAnimation.bounceInLeft),
                AwsAniSetting(
                    animation: AwsAnimation.bounceInLeft,
                    delay: Duration(milliseconds: 550)),
              ],
              onPressed: () {
                print('object');
              },
            ),
          ],
          animation: AwsAnimationSettingDynaflot(),
          setting: AwsSettingDynaflot(
            type: AwsActionDynaflot.ola,
          ),
        ),
      ),
    );
  }
}

class AwsFlolinkButtonExample extends StatelessWidget {
  const AwsFlolinkButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AwsFlolinkButton(
          text: 'enlace',
          decoration: TextDecoration.none,
          onPressed: () {
            print('click');
          },
        ),
      ),
    );
  }
}

class AwsIconButtonExample extends StatelessWidget {
  const AwsIconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AwsIconButton(
          icon: Icons.near_me,
          backgroundColor: Colors.white,
          iconColor: Colors.black,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Click'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AwsMotleyButtonExample extends StatelessWidget {
  const AwsMotleyButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AwsMotleyButton(
          child: Text(
            'Presiona',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Click'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AwsProcessButtonExample extends StatelessWidget {
  const AwsProcessButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AwsProcessButton(
              actions: () async {
                await Future.delayed(Duration(milliseconds: 1500));
                return true;
              },
            ),
            SizedBox(height: 20),
            AwsProcessButton(
              actions: () async {
                await Future.delayed(Duration(milliseconds: 1500));
                return false;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AwsTexlinkButtonExample extends StatelessWidget {
  const AwsTexlinkButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AwsTexlinkButton(
          text: 'en el',
          link: 'link',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Click'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AwsMarkdownEditorExample extends StatelessWidget {
  const AwsMarkdownEditorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AwsMarkdownEditor(
            content: TextEditingController(),
            imageWidget: (value) {
              return FadeInImage(
                placeholder: AssetImage('assets/loading/jar-loading.gif'),
                image: NetworkImage(value),
                imageErrorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              );
            }),
      ),
    );
  }
}

class AwsFieldsAndPickersExample extends StatefulWidget {
  const AwsFieldsAndPickersExample({super.key});

  @override
  State<AwsFieldsAndPickersExample> createState() =>
      _AwsFieldsAndPickersExampleState();
}

class _AwsFieldsAndPickersExampleState
    extends State<AwsFieldsAndPickersExample> {
  DateTime timeController = DateTime.now();
  DateTime dateController = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AwsDateField(
                dateTime: dateController,
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return AwsDatePicker(
                        day: AwsSettingChildDatePicker(
                            prefix: 'Dia', hint: 'D:'),
                        month: AwsSettingChildDatePicker(
                            prefix: 'Mes', hint: 'M:'),
                        year: AwsSettingChildDatePicker(
                          prefix: 'Año',
                          hint: 'A:',
                          isYear: true,
                        ),
                        onSelectedDateChanged: (date) {
                          if (!date.isEmpty()) {
                            setState(() {
                              dateController = DateTime(int.parse(date.year!),
                                  int.parse(date.month!), int.parse(date.day!));
                            });
                          }
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              AwsTimeField(
                initial: DateTime.now(),
                dialogAwsTimePicker: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AwsTimePicker(
                          textBack: Text('back'),
                          onTimeChanged: (time) {
                            setState(() {
                              timeController = time;
                            });
                          },
                          onBack: () {
                            Navigator.pop(context);
                          });
                    },
                  );
                  return AwsFormatter.completTime(
                      hour: timeController.hour, minute: timeController.minute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AwsBridgeNavigatorExample extends StatefulWidget {
  const AwsBridgeNavigatorExample({super.key});

  @override
  State<AwsBridgeNavigatorExample> createState() =>
      _AwsBridgeNavigatorExampleState();
}

class _AwsBridgeNavigatorExampleState extends State<AwsBridgeNavigatorExample> {
  List<Widget> views = [
    Container(
      child: Center(
        child: Text('Home'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Chat'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Source'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Edit'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Settings'),
      ),
    ),
  ];

  int selectedView = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AwsBridgeNavigator<int>(
            direction: Axis.vertical,
            expanded: true,
            //spaceBetween: true,
            padding: EdgeInsets.all(7),
            theme: AwsThemeBridge(
              bar: AwsBarThemeBridge(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple,
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 5,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              item: AwsItemThemeBridge(
                isSelectedColor: Colors.white,
              ),
            ),
            header: AwsHeaderButtonBridge(
              title: 'Name',
              leading: Icon(Icons.person),
              onTap: () {
                print('header');
              },
            ),
            /* footer: AwsFooterButtonBridge(
              title: Text('footer'),
              leading: Icon(Icons.adobe_outlined),
              onTap: () {
                print('footer');
              },
            ), */
            items: [
              AwsItemButtonBridge(value: 0, icon: Icons.home, label: 'Home'),
              AwsItemButtonBridge(value: 1, icon: Icons.chat, label: 'chat'),
              AwsItemButtonBridge(
                  value: 2, icon: Icons.source_outlined, label: 'Source'),
              AwsItemButtonBridge(value: 3, icon: Icons.edit, label: 'Edit'),
              AwsItemButtonBridge(
                  value: 4, icon: Icons.settings, label: 'Settings'),
            ],
            initValue: selectedView,
            onSelected: (value) {
              setState(() {
                selectedView = value;
              });
            },
          ),
          Expanded(child: views[selectedView]),
        ],
      ),
    );
  }
}

class AwsBridgeNavigatorExampleDos extends StatefulWidget {
  const AwsBridgeNavigatorExampleDos({super.key});

  @override
  State<AwsBridgeNavigatorExampleDos> createState() =>
      _AwsBridgeNavigatorExampleDosState();
}

class _AwsBridgeNavigatorExampleDosState
    extends State<AwsBridgeNavigatorExampleDos> {
  List<Widget> views = [
    Container(
      child: Center(
        child: Text('Home'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Chat'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Source'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Edit'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Settings'),
      ),
    ),
  ];

  int selectedView = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedView],
      bottomNavigationBar: Container(
        width: context.width(100),
        child: AwsBridgeNavigator<int>(
          direction: Axis.horizontal,
          expanded: true,
          spaceBetween: true,
          padding: EdgeInsets.all(7),
          theme: AwsThemeBridge(
            bar: AwsBarThemeBridge(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple,
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 5,
                ),
              ],
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            item: AwsItemThemeBridge(
              isSelectedColor: Colors.white,
            ),
          ),
          header: AwsHeaderButtonBridge(
            title: 'Name Append Down',
            onTap: () {
              print('header');
            },
            leading: Icon(Icons.person),
            titleStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          /* footer: AwsFooterButtonBridge(
            onTap: () {
              print('footer');
            },
            title: Text('data'),
            leading: Icon(Icons.app_registration_sharp),
          ), */
          items: [
            AwsItemButtonBridge(value: 0, icon: Icons.home, label: 'Home'),
            AwsItemButtonBridge(value: 1, icon: Icons.chat, label: 'chat'),
            AwsItemButtonBridge(
                value: 2, icon: Icons.source_outlined, label: 'Source'),
            AwsItemButtonBridge(value: 3, icon: Icons.edit, label: 'Edit'),
            AwsItemButtonBridge(
                value: 4, icon: Icons.settings, label: 'Settings'),
          ],
          initValue: selectedView,
          onSelected: (value) {
            setState(() {
              selectedView = value;
            });
          },
        ),
      ),
    );
  }
}
