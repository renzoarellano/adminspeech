
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_recognition_example/pages/home_page.dart';
import 'package:speech_recognition_example/loader/loader1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return new LoadingPageState();
  }
}

class LoadingPageState extends State<LoadingPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => checkDevices(context));
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //body: Center(child: Text("Loading here...|"),),
      body: Builder(
      builder: (BuildContext context){
        if(getData() == 'true'){
          Navigator
              .of(context)
              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => HomePage()));
          //print('Me fui');
        }else{
          getData();
          print(getData());
         print('Entre');
          return checkDevices(context);
        }

      } ,
      ),
    );
  }

   /* String getIp(){
      return "aaa";
  }*/
  Future<bool> getData() async {
    //String ip = getIp();
    http.Response response = await http.get(Uri.encodeFull("https://jsonplaceholder.typicode.com/posts")
    );
    //print(response.contentLength);
    List data = json.decode(response.body);
    //print(response);
    if(data != null){
      return true;
    }else{
      return false;
    }
  }

  checkDevices(BuildContext context) {
    //timer = new Timer(const Duration(seconds: 5), () => {

        /*showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Hola"),
            content: new Text("nonon"),
            actions: <Widget>[
              new FlatButton(
                child: new Text('DISMISS'),
                onPressed: () => /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                )*/
                Navigator
                    .of(context)
                    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => HomePage()))
              )
            ],
          );
        });*/
          return Scaffold(
              backgroundColor: Colors.white,
              body: new Center(
                    child: new Column(
                      children: <Widget>[
                        Divider(
                          height: 200.0,
                          color: Colors.white,
                        ),
                        ColorLoader3(
                          radius: 20.0,
                          dotRadius: 5.0,
                        ),
                          //mainAxisAlignment: MainAxisAlignment.center,
                            new Text("Buscando dispositvos"),
                         new Row (

                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             new RaisedButton(
                               child: const Text('Conectar Manualmente'),
                               color: Theme.of(context).accentColor,
                               elevation: 4.0,
                               splashColor: Colors.white,
                               onPressed: () {

                               }

                               ,
                             ),

                           ],
                         ),
                            new Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new RaisedButton(
                                  child: const Text('Reintentar Conexiòn'),
                                  color: Theme.of(context).accentColor,
                                  elevation: 4.0,
                                  splashColor: Colors.white,
                                  onPressed: () =>
                                      Navigator
                                          .of(context)
                                          .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => HomePage()))
                                  ,
                                ),
                              ],

                            ),



                      ],
                    ),
              ),
          );

    //});
  }

}