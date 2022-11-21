import 'package:flutter/material.dart';

void main() {
  runApp(const TimelinePage());
}

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Info to be displayed in timeline including color of icon, dates of cards, descriptions on cards, and icon
    List<Color> colors = [Colors.blue, Colors.red, Colors.orange, Colors.red, Colors.purple, Colors.orange, Colors.purple, Colors.blue, Colors.lightGreen, Colors.orange, Colors.blue, Colors.blue, Colors.orange, Colors.red, Colors.orange, Colors.purple, Colors.purple, Colors.orange, Colors.blue, Colors.blue, Colors.orange, Colors.red, Colors.purple, Colors.blue, Colors.orange, Colors.blue, Colors.blue, Colors.blue, Colors.blue];
    List<String> dates = ["January 7, 1891", "1919-1924", "1925", "1925-1927", "1926", "Summer 1926", "February 1927", "May 19, 1927", "December 1927", "1931", "February 1931", "July 7, 1931", "May 1934", "January 1935", "October 1935", "April - September 1936", "September - March 1937", "September 1937", "June 27, 1939", "February 1940", "Spring-July 1941", "March 1943", "May 1947", "September 1948", "April 1950", "Winter 1950-1951", "Early 1959", "October 1959", "January 28, 1960"];
    List<String> descriptions = ["Born in Notasulga, Alabama, the fifth of eight children to John Hurston and Lucy Potts", "Attends Howard University; receives an associate degree in 1920", "Submits short story, \"Spunk,\" and a play, Color Struck, to Opportunity's literary contest", "Attends Barnard College, studying anthropology with Franz Boas", "Begins field work for Boas in Harlem", "Organizes \"Fire!\" with Langston Hughes and Wallace Thurman; they publish one issue which includes Hurston's \"Sweat\"", "Goes to Florida to collect folklore", "Marries Herbert Sheen", "Signs a contract with Charlotte Osgood Mason, enabling her to return to the South to collect folklore", "Publishes \"Hoodoo in America\" in the \"Journal of American Folklore\"", "Breaks with Langston Hughes over the authorship of \"Mule Bone\"", "Divorces Sheen", "Publishes \"Jonah's Gourd Vine\"; it is a Book-of-the-Month Club Selection", "Makes an abortive attempt to study for Ph.D in anthropology at Columbia but seldom attends classes", "Mules and Men is published", "In Jamaica on Guggenheim Fellowship", "In Haiti; writes Their Eyes Were Watching God in seven weeks", "Returns to the United States; Their Eyes Were Watching God is published", "Marries Albert Price III in Florida", "Files for divorce from Price", "Writes Dust Tracks on a Road", "Receives Howard University's Distinguished Alumni Award", "Goes to British Honduras to research black communities in Central America; writes Seraph on the Suwanee", "Falsely accused of molesting a ten-year-old boy and arrested; case dismissed in March 1949", "Publishes \"What White Publishers Won't Print\"", "Moves to Belle Glade, Florida", "Suffers a stroke", "Forced to enter the St. Lucie County Welfare Home", "Dies of hypersensitive heart disease and is buried in an unmarked grave in the Garden of Heavenly Rest, Fort Pierce"];
    List<IconData> icons = [Icons.child_care, Icons.school, Icons.book_outlined, Icons.school, Icons.explore, Icons.book_outlined, Icons.explore, Icons.girl, Icons.attach_money, Icons.book_outlined, Icons.girl, Icons.girl, Icons.book_outlined, Icons.school, Icons.book_outlined, Icons.explore, Icons.explore, Icons.book_outlined, Icons.girl, Icons.girl, Icons. book_outlined, Icons.school, Icons.explore, Icons.girl, Icons.book_outlined, Icons.girl, Icons.girl, Icons.girl, Icons.no_accounts];

    return Scaffold(
      backgroundColor: Colors.green,  //Set background to green
      body: ListView.builder(
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                    children: index!=0 ? <Widget>[  //For the timeline cards that aren't the first one (do this for Chronology header)
                    Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(  //Line connecting icons
                              width: 2,
                              height: 50,
                              color: index == 0 ? Colors.green : Colors.black,  //So line on side doesn't extend above first icon
                            ),
                            Container(  //Create icon circle
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Icon(icons[index], color: Colors.white,),
                            ),
                            Container(  //Lines coming out of icon
                              width: 2,
                              height: 50,
                              color: index == dates.length-1 ? Colors.green : Colors.black  //If last icon, don't extend line
                            )
                          ],
                        ),
                        Expanded(   //Create timeline cards
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(top: BorderSide(width: 4, color: Colors.blueAccent)),
                              boxShadow: [BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26
                              )]
                            ),
                            height: 100,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(dates[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Text(descriptions[index], style: const TextStyle(fontSize: 16),),
                              ],
                            ))
                          ),
                        )
                      ],
                    )
                  )] : <Widget>[
                    const Text('', style: TextStyle(fontSize: 17),),    //Set title above First timeline card
                    const Text('Chronology', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
                    Container(    //Create first timeline card
                        child: Row(
                        children: <Widget>[
                            Column(
                                children: <Widget>[
                                      Container(
                                          width: 2,
                                          height: 50,
                                          color: index == 0 ? Colors.green : Colors.black,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(left: 5, right: 5),
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                          color: colors[index],
                                          borderRadius: BorderRadius.circular(50)
                                              ),
                                          child: Icon(icons[index], color: Colors.white,),
                                      ),
                                      Container(
                                          width: 2,
                                          height: 50,
                                          color: index == dates.length ? Colors.white : Colors.black
                                      )
                                  ],
                              ),
                                  Expanded(
                                      child: Container(
                                          margin: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                          color: Colors.white,
                                              border: Border(top: BorderSide(width: 4, color: Colors.blueAccent)),
                                              boxShadow: [BoxShadow(
                                                  blurRadius: 10,
                                                  color: Colors.black26
                                              )]
                                          ),
                                          height: 100,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(dates[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                  Text(descriptions[index], style: const TextStyle(fontSize: 16),),
                                                ],
                                              ))
                                      ),
                                  )
                        ],
                        )
                    )]));
                }),
    );
  }
}