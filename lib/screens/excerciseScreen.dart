import 'package:flutter/material.dart';
import 'package:heath_matthews_physio/NavBar.dart';
class excerciseScreen extends StatefulWidget {
  const excerciseScreen({Key? key}) : super(key: key);

  @override
  _excerciseScreenState createState() => _excerciseScreenState();
}

class _excerciseScreenState extends State<excerciseScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:NavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
        iconTheme: IconThemeData(color: Color(0xFF2F3F70)),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Container(
                    child: Padding(
                      padding:EdgeInsets.fromLTRB(20, 5,0, 0),
                      child: Text('Foam Rolling - Lower back',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily:'DMSans',
                          color: Colors.blue[900],
                        ),
                      ),),

                  ),
                  child:
                  Text(
                    'Foam Rolling - Lower Back',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue.shade900,
                      fontFamily: 'DMSans',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.11,
                  ),
                  child: Text(
                    'Start by lossing tight muscles in your back before you start your exercises.\nJust 1 minute of rolling will be enough.',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue.shade900,
                      fontFamily: 'DMSans'
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Image.asset('assets/rec.png'),
                ),
                SizedBox(height: 25.0,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width*0.14),
                        topRight: Radius.circular(MediaQuery.of(context).size.width*0.14),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Text('Set - 1',
                        style: TextStyle(
                          fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'DMSans',
                        ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Text('Time - 00:01:00'
                          ,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'DMSans',
                          ),),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Text('Side/Bilateral'
                          ,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'DMSans',
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: SizedBox(
                          height: 40.0,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
                              hintText: '00:01:00',

                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.blue.shade900,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade900 ,width: 2.0),
                                borderRadius: BorderRadius.circular(6.0),

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Text('Rest Time - 00:00:00'
                          ,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'DMSans',
                          ),),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Text(
                          'Add Note to Exercie (Optional)',

                          style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        color: Colors.grey,
                          fontFamily: 'DMSans',
                        ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            focusColor: Colors.blue.shade900,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade900 ,width: 2.0),
                                borderRadius: BorderRadius.circular(6.0)
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Text('Save'
                              ,
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontFamily: 'DMSans',
                              ),),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
