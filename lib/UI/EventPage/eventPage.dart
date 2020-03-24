import 'package:excelapp_prototype/UI/EventPage/eventDescription.dart';
import 'package:flutter/material.dart';
import 'moreDetailsPage.dart';
import 'backgroundImage.dart';
import 'constants.dart';




class EventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventPageState();
  }
}

//Event Details
class EventPageState extends State<EventPage> {

  //All paddings made as multiples of _minpadding
final _minpadding = 5.0;

  @override
  Widget build(BuildContext context) {
    var deviceHeight=MediaQuery.of(context).size.height;
    var deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: <Widget>[
      //Background Image
      getBackgroundImage(eventDetails, [
        Color.fromRGBO(0, 0, 0, 0),
        Color.fromRGBO(23, 18, 41, .8),
        Color.fromRGBO(0, 0, 0, .8)
      ]),
      Container(
          child: ListView(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(left: _minpadding, top:deviceHeight*0.5),
              child: Row(
                children: <Widget>[

                  //BackButton
                  IconButton(
                    icon: new Icon(Icons.arrow_back),
                    iconSize: 40.0,
                    color: Colors.white,
                    onPressed: () {
                      debugPrint("BackButtonPressed");
                      Navigator.maybePop(context);
                    },
                  ),

                  //Event Name Details
                  Expanded(child: 
                  Hero(
                    tag: 'EventName',
                    child: Text(eventDetails['Name'],
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: fontBold,
                            height: 1.0,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),),
              
                  Hero(
                    tag: 'LikeButton',
                    child: Padding(padding: EdgeInsets.all(_minpadding*2),
                    child:  likeButton(eventDetails['isLiked']),
                    ),
                  ),
                ],
              )),

          //Event Details
          getEventDetails(eventDetails, _minpadding),
          SizedBox(height:deviceHeight*0.1 ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  //Bottom buttons
                  ButtonTheme(
                    minWidth: deviceWidth*0.4,
                    height: _minpadding * 7,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.white)),
                      color: Color.fromRGBO(21, 18, 41, 1),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(_minpadding *2),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreDetails()),
                        );
                      },
                      child: Text(
                        "More Details",
                        style: TextStyle(
                          fontFamily: fontLight,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: deviceWidth*.4,
                    height: _minpadding * 7,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.white)),
                      color: Colors.white,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(_minpadding * 2),
                      onPressed: () {},
                      child: Text(
                        "Book Tickets",
                        style: TextStyle(
                          fontFamily: fontLight,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
  

          //Invisible card to utilise hero widget and animate it when more details is clicked
          Hero(
              tag: 'Card',
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Container(
                    height: 0,
                  )))
        ],
      ))
    ]));
  }

//Like button functionality
  Widget likeButton(String isLiked) {
    bool likeState = isLiked == 'true';
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 2)),
        child: IconButton(
            iconSize: 32,
            color: Colors.white,
            icon: !likeState
                ? Icon(Icons.favorite_border)
                : Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              //Insert function that enables this event as favourite
              /*

                        Over Here

                    */
              setState(() {
                likeState = !likeState;
                eventDetails['isLiked'] = '$likeState';
              });
            }));
  }
}
