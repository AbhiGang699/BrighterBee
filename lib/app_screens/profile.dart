import 'package:brighter_bee/app_screens/post.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black12)
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.search),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Text('Search',style: TextStyle(color: Colors.grey,fontSize: 18),),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView (
          children: <Widget>[
            Center(child: CircleAvatar(radius: 90,backgroundColor: Colors.grey,)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Ashutosh Chitranshi',softWrap: true,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10),
              child: Center(child: Text('Fallen Cherub, to be weak is miserable, Doing or suffering',softWrap: true,style: TextStyle(color: Colors.grey,fontSize: 18),)),
            ),
            Padding(
              padding:EdgeInsets.only(top:8.0,bottom: 8.0),
              child:Container(
                height:1.0,
                width:double.infinity,
                color:Colors.black12,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.school),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0,),
                  child: SizedBox (
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text(
                      'Studies Computer Science and Engineering at Motilal Nehru National Institute of Technology',

                      style: TextStyle(color: Colors.black,fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.school),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'Went to K. V. No. 2 J.L.A Bareilly cantt Bareilly',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'Lives in Allahabad, India',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'From Bareilly, India',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'Joined September 2020',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.check_box),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,bottom: 8.0),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'Followed by 108 people',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.link),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                    child: SizedBox (
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'ashu12chi.github.io',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: FlatButton(
                child: Text('Edit details',style: TextStyle(color: Colors.blueAccent,fontSize: 18),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.lightBlueAccent)
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top:8.0,bottom: 4.0),
              child:Container(
                height:1.0,
                width:double.infinity,
                color:Colors.black12,
              ),
            ),
            Text('Communities',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
            Text('23 communities',style: TextStyle(fontSize: 18,color: Colors.grey),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Card(

                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Card(

                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Card(

                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Center(child: Text('Flutter',overflow: TextOverflow.ellipsis,))
                ),
                SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Center(child: Text('Github',softWrap: true,))
                ),
                SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Center(child: Text('NP Devs',softWrap: true,))
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Card(

                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Card(

                  ),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width/3 - 10,
                  child: Card(

                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width/3 - 10,
                    child: Center(child: Text('Flutter',softWrap: true,))
                ),
                SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width/3 - 10,
                    child: Center(child: Text('Github',softWrap: true,))
                ),
                SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width/3 - 10,
                    child: Center(child: Text('NP Devs',softWrap: true,))
                )
              ],
            ),
            Padding(
              padding:EdgeInsets.only(top:8.0,bottom: 4.0),
              child:Container(
                height:1.0,
                width:double.infinity,
                color:Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
