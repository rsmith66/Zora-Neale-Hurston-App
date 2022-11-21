import 'package:flutter/material.dart';

void main() {
  runApp(const WorksPage());
}
//Display selected works
class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

  //Building page for each work
  Widget buildWork(BuildContext context, String title, String bio, String publishedDate, String pic) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
          title: Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black),),
    ),
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            const Text('', style: TextStyle(fontSize: 15),),
            Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
              )
          ),
              Image.asset(pic),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                  )
              ),
            ),
              Text(bio,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20
                  )
              ),
              const Text('', style: TextStyle(fontSize: 20),),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Date Published: $publishedDate',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                  )
              ),
            ),
            ],
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,  //Set background to green
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('', style: TextStyle(fontSize: 60),),
            const Text('Selected Works',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40
                )
            ),
            const Text('', style: TextStyle(fontSize: 20),),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Books',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  decoration: TextDecoration.underline
              ),),
            ),
            SizedBox( //Creates a button that extends to side
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //Send to page for this work
                        return buildWork(context, 'Jonah\'s Gourd Vine', 'Jonah\'s Gourd Vine is a semi-autobiographical novel describing the migration of characters, similar to her parents, from Alabama to Hurston\'s home of Eatonville, Florida. This is Hurston\'s debut novel and took her only three to four months to write. Jonah\'s Gourd Vine takes inspiration from Jonah 4:6-10 and explores themes such as escapism, racial politics, and how the dysfunction of marriage can have multi-generational effects.', '1934', 'assets/images/38066.jpg');
                      }));
                    },
                    child: const Align(alignment: Alignment.centerLeft,child: Text('Jonah\'s Gourd Vine (1934)', style: TextStyle(color: Colors.black, fontSize: 20)))
                )),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return buildWork(context, 'Mules and Men', 'Mules and Men is a collection of African-American folklore collected during Hurston\'s anthropological trips to Florida, specifically Eatonville and Polk County, and New Orleans. This book portrays Hurston\'s desire to document these traditions for anthropological studies as well as her desire to re-immerse herself in the folklore of her childhood. Many of the folktales are written in the vernacular of the black communities Hurston studied.', '1935', 'assets/images/Mules_and_Men.jpg');
                      }));
                    },
                    child: const Align(alignment: Alignment.centerLeft,child: Text('Mules and Men (1935)', style: TextStyle(color: Colors.black, fontSize: 20)))
                ),
                ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Their Eyes Were Watching God', 'Their Eyes Were Watching God is considered Hurston\'s best known work and a classic of the Harlem Renaissance. This novel tells the story of Janie Crawford’s evolving selfhood through three marriages and highlights larger themes such as individuality, traditional gender roles, desire, love, and racism. It is written in the vernacular of the black communities being represented, an act that Hurston is known for in her writing.', '1937', 'assets/images/TheirEyesWereWatchingGod.jfif');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Their Eyes Were Watching God (1937)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Tell My Horse', 'Tell my Horse is based on Hurston\'s own personal experiences with voodoo while in Haiti and Jamaica during the 1930s. Hurston paints authentic pictures of the customs and ceremonies of these voodoo cultures as an actual participant rather than just as an observer.', '1938', 'assets/images/tellmyhorse.jfif');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Tell My Horse (1938)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Moses, Man of the Mountain', 'Moses, Man of the Mountain is a rewriting of the Biblical Book of Exodus through an Afro-American perspective. Addressing the commonly known stories of Moses and the Israelites, Hurston subverts the original story to address many common themes and motifs typically written about in African American literature.', '1939', 'assets/images/moses.jfif');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Moses, Man of the Mountain (1939)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Dust Tracks on a Road', 'Dust Tracks on a Road is the 1942 autobiography of Zora Neale Hurston. Although often regarded as unreliable and contradictory, Hurston spends most of the book discussing issues of race and segregation which are highly common themes throughout her writing. Hurston does not address much of her extensive literary career in this autobiography and other sections of the book were removed or toned down by the publisher due to the thoughts that they were unnecessary or too explicit.', '1942', 'assets/images/dust.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Dust Tracks on a Road (1942)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Seraph on the Suwanee', 'Seraph on the Suwanee follows the life of a white woman and the dysfunctional relationship she has with her husband and family. Hurston attempts to reveal the cultural and linguistic similarities between white and black people in the South as she explores the "white crackers" of Florida. This was Hurston\'s last published novel while she was alive and is the only one that focuses on white characters.', '1949', 'assets/images/seraph.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Seraph on the Suwanee (1949)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            const Text('', style: TextStyle(fontSize: 5)),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Barracoon: The Story of the Last "Black Cargo"', 'Barracoon is a piece of non-fiction based on Hurston\'s interviews in 1927 Cudjoe Lewis, the last presumed living survivor of the Middle Passage. It failed to find a publisher due to the vernacular Hurston wrote it in as well as the descriptions it gives of of African people being involved in the Atlantic slave trade. ', '2018', 'assets/images/barracoon.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Barracoon: The Story of the Last "Black Cargo" (2018)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('', style: TextStyle(fontSize: 10),),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Plays',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline
                ),),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return buildWork(context, 'Color Struck', '"Color Struck" was originally published in Fire!! magazine in 1926 and was written for a writing competition that it would win second place for. The play focuses on a dark skinned woman named Emma who plans to participate in a cakewalk with her lover and her battle with colorism as her lover leaves her for a lighter skinned woman. "Color Struck" is a melodramatic play that focuses on the battles of race prevalent in much of Hurston\'s work.', '1926', 'assets/images/colorstruck.jpg');
                      }));
                    },
                    child: const Align(alignment: Alignment.centerLeft,child: Text('Color Struck (1926)', style: TextStyle(color: Colors.black, fontSize: 20)))
                )),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Mule Bone', '"Mule Bone" was written by Hurston along with her friend at the time Langston Hughes. The play focuses on a courtroom trial that ensues following a fight between two men over a woman with themes of religious tolerance, friendship, and success woven throughout. The writing of the play led to the severing of the friendship between the two authors after Hurston abandoned Hughes and submitted the play for copyright with her as the sole author.', '1930', 'assets/images/Mule_Bone.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Mule Bone (1930)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('', style: TextStyle(fontSize: 10),),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Short Stories and Essays',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline
                ),),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return buildWork(context, 'Spunk', '"Spunk" is a short story by Hurston that was published in 1925 and is set in the rural United States. It follows the conflict that occurs when a man pursues another man\'s wife, and its publication started Hurston\'s establishment as a significant write during the Harlem Renaissance.', '1925', 'assets/images/spunk.jpg');
                      }));
                    },
                    child: const Align(alignment: Alignment.centerLeft,child: Text('Spunk (1925)', style: TextStyle(color: Colors.black, fontSize: 20)))
                )),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return buildWork(context, 'Muttsy', '"Muttsy" follows a young man in Harlem who becomes enamored with a young woman from Eatonville, Florida. The story is mostly told through dialogue and is filled with humor and intelligence as it shows the culture of Harlem during this time period.', '1926', 'assets/images/muttsy.jpg');
                      }));
                    },
                    child: const Align(alignment: Alignment.centerLeft,child: Text('Muttsy (1926)', style: TextStyle(color: Colors.black, fontSize: 20)))
                ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Sweat', '"Sweat" is a short story by Hurston published in the first and only issue of the newspaper Fire!!. It follows a washerwoman and her relationship with her unemployed husband. The story deals with heavy topics such as domestic abuse, empowerment, and the innate desire for individuality.', '1926', 'assets/images/sweat.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Sweat (1926)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'How It Feels to Be Colored Me', '"How It Feels to Be Colored Me" is an essay published in the journal "World Tomorrow" that portrays Hurston\'s circumstance being a black woman in the early 1900s. Hurston writes about her childhood in Eatonville and how growing up in an all black community impacted her view on race. She writes about the emotions and treatment she receives due to her race and encourages the reader to focus on the similarities we all possess.', '1928', 'assets/images/how.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('How It Feels to Be Colored Me (1928)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'Hoodoo in America', '"Hoodoo in America" focuses on Hurston\'s anthropological studies of voodoo and African American folklore in the deep South. Hurston discusses her experiences as both an observer and partaker in the various voodoo traditions and cultures of spots such as New Orleans, Alabama, Florida, and others.', '1931', 'assets/images/hoodoo.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('Hoodoo in America (1931)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'The Gilded Six Bits', '"The Gilded Six-Bits" is a short story by Hurston that portrays the life of two newlyweds whose relationship is tested when an outsider stays in their home. Themes such as love, betrayal, and forgiveness are all explored with help from Hurston\'s use of regional dialect as portrayed in the dialogue between characters. Hurston sets this story in her hometown of Eatonville, Florida, and draws influence from her multiple failed marriages.', '1933', 'assets/images/gsb.jpg');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('The Gilded Six Bits (1933)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            const Text('', style: TextStyle(fontSize: 5)),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return buildWork(context, 'What White Publishers Won\'t Print', 'Hurston wrote "What White Publishers Won\'t Print" in 1950 as a means to portray the lack of black people that appear in literature and film. She strongly vouched for the importance of accurate portrayal of marginalized groups and is enraged by the stereotypes commonly used to portray these groups. Hurston calls into question many of the underlying racist thoughts of society and in media. ', '1950', 'assets/images/white.jfif');
                  }));
                },
                child: const Align(alignment: Alignment.centerLeft,child: Text('What White Publishers Won\'t Print (1950)', style: TextStyle(color: Colors.black, fontSize: 20)))
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('', style: TextStyle(fontSize: 10),),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Poetry',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline
                ),),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return buildWork(context, 'Journey\'s End', '"Journey\'s End" is possibly Hurston\'s earliest published work as it was originally published in the Negro World newspaper that was started in Harlem to highlight the many talents coming out of the Harlem Renaissance. This poem lingers on many themes such as fate, success, life, and death.', '1922', 'assets/images/poem1.jpg');
                      }));
                    },
                    child: const Align(alignment: Alignment.centerLeft,child: Text('Journey\'s End (1922)', style: TextStyle(color: Colors.black, fontSize: 20)))
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      )
    );
  }
}