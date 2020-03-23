import 'package:flutter/material.dart';

//Dictionary contains details of the event
var eventDetails = {
  'ImageDir': './assets/kryptos.png',
  'Name': 'Kryptos',
  'Time': '12th November 2019 | 12pm -2pm',
  'Venue': 'Room No.301-304',
  'Contact': '+91 90642658845',
  'Fee': '₹100',
  'About':
      'Excel 2019 presents Treasure Hunt , a union of mutiple diverse rounds designed to test the skills of contestants. Be it a quest around Kochi, make campus or perhaps even around Kochi, make sure you are prepared! Get ready to accomplishdifferent tasks to be declared the winner. Spread over two days , the event is guarenteed to push you to your limts',
  'Format': 'This is the format of the event',
  'Rules': 'This is the rules of the event',
  'Contacts': 'This is the contact details of the event'
};

//All paddings made as multiples of _minpadding
final _minpadding = 5.0;

//LikeState of like button
bool likeState = false;

//Stores the current active tab in more details
String active = 'About';

class EventPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EventPageState();
  }
}

//Event Details
class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      //Background Image
      Hero(
        tag: 'EventImage',
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(eventDetails['ImageDir']),
                fit: BoxFit.fitHeight),
          ),
        ),
      ),

      //Gradient effect
      Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.transparent,
          Color.fromRGBO(23, 18, 41, .8),
          Color.fromRGBO(0, 0, 0, .8)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      )),
      Container(
          child: ListView(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(left: _minpadding, top: _minpadding * 61),
              child: Row(
                children: <Widget>[
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
                  Hero(
                    tag: 'EventName',
                    child: Text(eventDetails['Name'],
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'Quicksand-Bold',
                            height: 1.0,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                  Container(padding: EdgeInsets.only(left: _minpadding * 24)),
                  Hero(
                    tag: 'LikeButton',
                    child: likeButton(likeState),
                  ),
                ],
              )),
          Hero(
            tag: 'EventDescription',
            child: Padding(
                padding: EdgeInsets.only(
                    left: _minpadding * 8, top: _minpadding * 3),
                child: Column(
                  children: <Widget>[
                    Row(
                      
                      //Event Time Details
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Time'])
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: _minpadding * 2)),

                    //Event Venue Details
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.add_location,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Venue'])
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: _minpadding * 2)),

                    //EventContacts
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Contact'])
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: _minpadding * 2)),

                    //Event Fee Details
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.label,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Fee'])
                      ],
                    ),
                  ],
                )),
          ),
          Container(
              padding: EdgeInsets.only(top: _minpadding * 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Bottom buttons
                  ButtonTheme(
                    minWidth: _minpadding * 36,
                    height: _minpadding * 8,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0),
                          side: BorderSide(color: Colors.white)),
                      color: Color.fromRGBO(21, 18, 41, 1),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(_minpadding * 2),
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
                          fontFamily: 'Quicksand-light',
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: _minpadding * 36,
                    height: _minpadding * 8,
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
                          fontFamily: 'Quicksand-light',
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Container(margin: EdgeInsets.only(top: _minpadding * 50)),

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
  Widget likeButton(bool newlikeState) {
    if (likeState == true) {
      return IconButton(
        icon: Icon(Icons.favorite),
        iconSize: 45,
        color: Colors.red,
        onPressed: () {
          setState(() {
            likeState = !newlikeState;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border),
        iconSize: 45.0,
        color: Colors.white,
        onPressed: () {
          setState(() {
            likeState = !newlikeState;
          });
        },
      );
    }
  }
}

//Event Description's text styling (Common to both)
Widget eventDescriptionText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      decoration: TextDecoration.none,
      fontFamily: 'Quicksand-Light',
      fontWeight: FontWeight.w300,
    ),
  );
}

class MoreDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoreDetailsState();
  }
}

class MoreDetailsState extends State<MoreDetails> {
  //To check whether which tab is in currently clicked in more details
  bool fClick = false, rClick = false, cClick = false, aClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      // Background Image
      Hero(
          tag: 'EventImage',
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(eventDetails['ImageDir']),
                  fit: BoxFit.fitHeight),
            ),
          )),

      // Gradient effect
      Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.transparent,
          Color.fromRGBO(23, 18, 41, .8),
          Color.fromRGBO(0, 0, 0, .8)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      )),
      Container(
          child: Column(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(left: _minpadding, top: _minpadding * 28.8),
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          left: _minpadding * 8, top: _minpadding * 5)),

                  //Event Name Details
                  Hero(
                    tag: 'EventName',
                    child: Text(eventDetails['Name'],
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'Quicksand-Bold',
                            height: 1.0,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                  Container(padding: EdgeInsets.only(left: _minpadding * 24)),
                  Hero(
                    tag: 'LikeButton',

                    //Code to make the button under a Material widget during animation which otherwise throws error
                    flightShuttleBuilder: (BuildContext flightContext,
                            Animation<double> animation,
                            HeroFlightDirection flightDirection,
                            BuildContext fromHeroContext,
                            BuildContext toHeroContext) =>
                        Material(
                            type: MaterialType.transparency,
                            child: toHeroContext.widget),
                    child: likeButton(likeState),
                  ),
                ],
              )),
          Hero(
            tag: 'EventDescription',
            child: Padding(
                padding:
                    EdgeInsets.only(left: _minpadding * 8, top: _minpadding),
                child: Column(
                  children: <Widget>[
                    Row(

                      //Event Time Details
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Time'])
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: _minpadding * 2)),

                    //Event Venue Details
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.add_location,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Venue'])
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: _minpadding * 2)),

                    //EventContacts
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Contact'])
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: _minpadding * 2)),

                    //Event Fee Details
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.label,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(right: _minpadding * 2)),
                        eventDescriptionText(eventDetails['Fee'])
                      ],
                    ),
                  ],
                )),
          ),
          Container(padding: EdgeInsets.only(top: _minpadding * 5)),
          Expanded(
              child: Hero(
                  tag: 'Card',
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(23),
                                  topRight: Radius.circular(23))),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding:
                                      EdgeInsets.only(top: _minpadding * 2)),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[

                                    
                                    //Tabs in the More Details section
                                    Padding(
                                      padding: EdgeInsets.all(_minpadding),
                                      child: ButtonTheme(
                                        minWidth: _minpadding * 5,
                                        height: _minpadding * 8,
                                        child: FlatButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        17.0),
                                                side: BorderSide(
                                                    color: Colors.transparent)),
                                            color: aClick
                                                ? Colors.grey[200]
                                                : Colors.transparent,
                                            padding:
                                                EdgeInsets.all(_minpadding * 2),
                                            onPressed: () {
                                              setState(() {
                                                active = 'About';
                                                aClick = true;
                                                fClick = false;
                                                rClick = false;
                                                cClick = false;
                                              });
                                            },
                                            child: getMoreDetailsText(
                                                'About', aClick)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(_minpadding),
                                      child: ButtonTheme(
                                        minWidth: _minpadding * 5,
                                        height: _minpadding * 8,
                                        child: FlatButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        16.0),
                                                side: BorderSide(
                                                    color: Colors.transparent)),
                                            color: fClick
                                                ? Colors.grey[200]
                                                : Colors.transparent,
                                            padding:
                                                EdgeInsets.all(_minpadding * 2),
                                            onPressed: () {
                                              setState(() {
                                                active = 'Format';
                                                aClick = false;
                                                fClick = true;
                                                rClick = false;
                                                cClick = false;
                                              });
                                            },
                                            child: getMoreDetailsText(
                                                'Format', fClick)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(_minpadding),
                                      child: ButtonTheme(
                                        minWidth: _minpadding * 5,
                                        height: _minpadding * 8,
                                        child: FlatButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        16.0),
                                                side: BorderSide(
                                                    color: Colors.transparent)),
                                            color: rClick
                                                ? Colors.grey[200]
                                                : Colors.transparent,
                                            padding:
                                                EdgeInsets.all(_minpadding * 2),
                                            onPressed: () {
                                              setState(() {
                                                active = 'Rules';
                                                aClick = false;
                                                fClick = false;
                                                rClick = true;
                                                cClick = false;
                                              });
                                            },
                                            child: getMoreDetailsText(
                                                'Rules', rClick)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(_minpadding),
                                      child: ButtonTheme(
                                        minWidth: _minpadding * 5,
                                        height: _minpadding * 8,
                                        child: FlatButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        16.0),
                                                side: BorderSide(
                                                    color: Colors.transparent)),
                                            color: cClick
                                                ? Colors.grey[200]
                                                : Colors.transparent,
                                            padding:
                                                EdgeInsets.all(_minpadding * 2),
                                            onPressed: () {
                                              setState(() {
                                                active = 'Contacts';
                                                aClick = false;
                                                fClick = false;
                                                rClick = false;
                                                cClick = true;
                                              });
                                            },
                                            child: getMoreDetailsText(
                                                'Contacts', cClick)),
                                      ),
                                    ),
                                  ]),
                              Container(
                                  padding: EdgeInsets.only(
                                      top: _minpadding * 3,
                                      left: _minpadding * 6,
                                      right: _minpadding * 6,
                                      bottom: _minpadding * 3),
                                  child: Text(
                                    eventDetails[active],
                                    style: TextStyle(
                                      fontFamily: 'Quicksand-Light',
                                      color: Color.fromRGBO(23, 18, 41, 1),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ))
                            ],
                          )))))
        ],
      )),
    ]));
  }

//Like button functionality
  Widget likeButton(bool newlikeState) {
    if (likeState == true) {
      return IconButton(
        icon: Icon(Icons.favorite),
        iconSize: 45,
        color: Colors.red,
        onPressed: () {
          setState(() {
            likeState = !newlikeState;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.favorite_border),
        iconSize: 45.0,
        color: Colors.white,
        onPressed: () {
          setState(() {
            likeState = !newlikeState;
          });
        },
      );
    }
  }

  //More details text styling
  Widget getMoreDetailsText(String text, bool click) {
    if (click)
      return Text(text,
          style: TextStyle(
              height: 1.0,
              fontSize: 20.0,
              fontFamily: 'Quicksand-Bold',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(23, 18, 41, 1)));
    else
      return Text(text,
          style: TextStyle(
              height: 1.0,
              fontSize: 20.0,
              fontFamily: 'Quicksand-Light',
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(23, 18, 41, 0.4)));
  }
}
