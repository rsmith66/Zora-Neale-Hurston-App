import 'package:flutter/material.dart';

void main() {
  runApp(const BioPage());
}

//Builds bio page of app
class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.green,  //Set background to green
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('', style: TextStyle(fontSize: 60),),
            const Text('Zora Neale Hurston',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                )
            ),
            const Text('', style: TextStyle(fontSize: 20),),
            Image.asset('assets/images/zoranealehurston.jpg'),  //Import image in assets folder
            const Text('', style: TextStyle(fontSize: 10),),
            const Text('Who is Zora Neale Hurston?',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    decoration: TextDecoration.underline
              ),),
            const Text('Zora Neale Hurston is regarded as one of the pre-eminent writers of twentieth-century African-American literature. She was an American author, anthropologist, and filmmaker that created many works regarding racial struggles in the early 1900s. She also published research on hoodoo and African American folklore and is most recognized for her novel Their Eyes Were Watching God, published in 1937. She is also credited with writing more than 50 short stories, plays, and essays.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),),
            const Text('', style: TextStyle(fontSize: 15),),
            const Text('Early Life and Education',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline
              ),),
            const Text('Hurston was the fifth of eight children of John Hurston and Lucy Ann Hurston. She was born in Notasulga, Alabama, on January 7, 1891, where her father grew up and her paternal grandfather was the preacher of a Baptist church. When she was three, her family moved to Eatonville, Florida, one of the first all-Black towns incorporated in the United States. After being sent to boarding school in Jacksonville, Florida, Hurston would later attend Howard University where she would join Alain Locke\'s literary club and earn herself an associate degree in 1920. Hurston left Howard in 1924 and accepted a scholarship to Barnard College of Columbia University where she conducted ethnographic research with noted anthropologist Franz Boas and, after receiving a B.A. in anthropology in 1928, would study with him as a graduate student.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              ),),
            const Text('', style: TextStyle(fontSize: 15),),
            const Text('Literary Career',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline
              ),),
            const Text('Hurston would move to Harlem, New York City in 1925 when the Harlem Renaissance was in full force and would soon find herself at the center of the movement. In 1926, a group of young black writers including Hurston, Langston Hughes, and Wallace Thurman founded a literary magazine named Fire!! that featured many of the young artists and writers of the Harlem Renaissance. In 1927, Hurston traveled to the Deep South to collect African-American folk tales where she collected stories from the last known person to be transported in the Transatlantic slave trade as well as several hundred other stories that would be posthumously published.In the 1930s, Hurston published many short stories and novels including her most famous work, Their Eyes were Watching God. She began to adapt her anthropological work for the performing arts and was awarded a Guggenheim Fellowship to conduct ethnographic research in Jamaica and Haiti.In the 40s and 50s, Hurston published periodicals; her last published novel, Seraph on the Suwanee; and worked as a journalist for the Pittsburgh Courier.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              )),
            const Text('', style: TextStyle(fontSize: 15),),
            const Text('Patrons and Relationships',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline
              ),),
            const Text('Initially relying on foundation grants, those ended during the Great Depression and Hurston and her friend Langston Hughes both received patronage from Charlotte Osgood Mason, a white literary philanthropist and patron. From 1928 to 1932, Mason supported much of Hurston\'s anthropological expeditions into the deep South, pursuing African American folklore. However, this relationship came to an end after Mason took more of a controlling position in Hurston\'s work, demanding that she forfeit all publishing rights and agree to strict edits by Mason. Other important relationships include that with Langston Hughes in which the two not only shared a patron but also a close friendship. The two worked on the play Mule Bone: A Comedy of Negro Life, but the collaboration would result in the end of their friendship.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20
              )),
            const Text('', style: TextStyle(fontSize: 15),),
            const Text('Death',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline
              ),),
            const Text('Zora Neale Hurston would die of hypertensive heart disease on January 28, 1960, and was buried at the Garden of Heavenly Rest in Fort Pierce, Florida. Her remains were in an unmarked grave until 1973. After her death, Hurston\'s papers were ordered to be burned. However, a law office and friend, Patrick DuVal, passing by Hurston\'s house, stopped and put out the fire, thus saving an invaluable collection of literary documents for posterity.',
                style: TextStyle(
                color: Colors.black,
                fontSize: 20
            )),
            const Text('', style: TextStyle(fontSize: 40),),
          ],
        ),
      ))
    );
  }
}