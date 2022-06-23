import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
          scrimColor: Colors.black,
        ),
    ),
    home: regis(),
  ));
}
class regis extends StatefulWidget {
  const regis({Key? key}) : super(key: key);

  @override
  State<regis> createState() => _regisState();
}

class _regisState extends State<regis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,


      appBar: AppBar(
           backgroundColor: Colors.transparent,
        elevation:0,
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.format_list_bulleted_rounded,
              color: Colors.blue[900],
              ),

            );
          }
        ),
        // leading: Icon( Icons.format_list_bulleted_rounded,
        // color: Colors.grey,
        // ),

    ),
      drawer: Drawer(


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
                 ],
               ),
                ),
             SizedBox(height: 20.0),

        Container(

          child: Padding(
            padding:EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Text('Start by loosening tight muscles in your back before you start your exercises.Just 1 minute of rolling will be enough.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily:'DMSans',
                color: Colors.blue[900],
              ),
            ),),
        ),
        SizedBox(height: 20.0,),

        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.08,
            right: MediaQuery.of(context).size.width*0.08,
          ),
          child: Image(image: AssetImage('assets/rec.png'),
          fit:BoxFit.fill ,

          ),
        ),
             SizedBox(height: 20.0,),


             Container(

               decoration: BoxDecoration(
                 color: Colors.grey[200],
                 borderRadius: BorderRadius.only(
                   topLeft:Radius.circular(50),
                   topRight: Radius.circular(50),


                 ),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children:
                 [
                   SizedBox(height: 40.0,),
                    Padding(
                      padding:EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*0.08,
                        right: MediaQuery.of(context).size.width*0.08,
                      ),
                      child: Text('Set-1',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DMSans',
                            ),),
                    ),
                   SizedBox(height: 20.0,),
                   Padding(
                     padding:EdgeInsets.only(
                   left: MediaQuery.of(context).size.width*0.08,
               right: MediaQuery.of(context).size.width*0.08,
             ),
                     child: Text('Time-00:01:00',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w400,
                      ),),
                   ),
                   SizedBox(height: 20.0,),
                   Padding(
                     padding:  EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.08,
                       right: MediaQuery.of(context).size.width*0.08,
                     ),
                     child: Text('Side/Bilateral',
                       style: TextStyle(
                         fontSize: 12,
                         fontFamily: 'DMSans',
                         fontWeight: FontWeight.w400,
                       ),),
                   ),
                   SizedBox(height: 10.0,),
                   Padding(
                     padding:EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.08,
                       right: MediaQuery.of(context).size.width*0.08,
                     ),

                     child: Center(
                       child: Container(
                         height: 40.0,

                         child: TextFormField(
                           textAlignVertical: TextAlignVertical.center,
                           decoration:InputDecoration(
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                             hintText: '00-01-00',
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0,),
                   Padding(
                     padding:EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.08,
                       right: MediaQuery.of(context).size.width*0.08,
                     ),
                     child: Text('Rest Time - 00:00:00',
                       style: TextStyle(
                         fontSize: 12,
                         fontFamily: 'DMSans',
                         fontWeight: FontWeight.w400,
                       ),),
                   ),
                   SizedBox(height: 20.0,),
                   Padding(
                     padding:EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.08,
                       right: MediaQuery.of(context).size.width*0.08,
                     ),
                     child: Text('Add Note to Exercise (Optional)',

                       style: TextStyle(
                         color: Colors.grey,
                         fontSize: 10,
                         fontFamily: 'DMSans',
                         fontWeight: FontWeight.w400,
                       ),),
                   ),
                   SizedBox(height: 5.0,),
                   Padding(
                     padding:EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.08,
                       right: MediaQuery.of(context).size.width*0.08,
                     ),
                     child: Container(
                       height: 100.0,

                       child: TextField(
                         keyboardType: TextInputType.multiline,
                         maxLines: 5,
                         decoration:InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: '',
                         ),
                       ),
                     ),
                   ),
                   SizedBox(height: 0.0,),
                   Padding(
                     padding:EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*0.05,
                       right: MediaQuery.of(context).size.width*0.05,
                     ),
                     child: ElevatedButton( onPressed: () {},
                       style: ButtonStyle(
                         shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),

                                )),
                         backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                       ),
                       child: Text('SAVE',
                         style: TextStyle(
                           fontSize: 17,
                           fontFamily: 'DMSans',
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                         ),),



                       // 3



                     ),
                   ),



                 ],
               ),

             ),
           ],


        ),
      ),
    );
  }
}
