
/** I am Learning Flutter and this Code is Just to Reuse in future.. i am saving it here ... */

import 'package:flutter/material.dart';
import 'package:signtry/psychicNew.dart';
import 'package:signtry/utils/app_bar.dart';
import 'package:signtry/utils/colors.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({Key? key}) : super(key: key);

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  //var _userDetails = PsychicDetails();

  List<PsychicNew> newList = [];
  List<String> selectedItem = <String>[];


   delete()
   {
    for(int i = 0;i<selectedItem.length;i++)
       {
         String j = selectedItem[i];
         newList.removeWhere((element) => element.images==j);
     }

   }

   @override
  void initState() {

    super.initState();
    newList.add(PsychicNew('lib/assets/images/james.png', "Cat"));
    newList.add(PsychicNew('lib/assets/images/jhn.png', "Dog"));
    newList.add(PsychicNew('lib/assets/images/jimmy.png', "Hen"));
    newList.add(PsychicNew('lib/assets/images/keng.png', "CSt"));
    newList.add(PsychicNew('lib/assets/images/keng.png', "Qwe"));
    newList.add(PsychicNew('lib/assets/images/keng.png', "sdasd"));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Nearby Psychic',
              icon: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'lib/assets/images/bacjk.png',
                  scale: 1.5,
                ),
              ),
              icon2: InkWell(
                  onTap: () {
                   setState(() {
                     delete();
                   });
                    },
                  child: const Icon(
                    Icons.close,
                    color: Colour.whiteColor,
                  )),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colour.lightTheme, Colour.themeColor],
                    begin: FractionalOffset(0.0, 1.0),
                    end: FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colour.whiteColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Search",
                                prefixIcon: const Icon(Icons.search),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: List.generate(
                             // _userDetails.storyList.length,
                              newList.length,
                              (index) {
                                return
                                    // Padding(
                                    // padding: const EdgeInsets.only(right: 9),
                                    // child
                                    Column(
                                  // key: key(_userDetails.storyList[index].toString());toString
                                  children: <Widget>[
                                    GestureDetector(

                                      onTap: () {
                                       // if (selectedItem.contains(_userDetails.names[index])) {
                                        if (selectedItem.contains(newList[index].images)) {
                                          setState(() {
                                            selectedItem.removeWhere(
                                                (val) => val == newList[index].images);
                                          });
                                        }
                                        else{
                                          if (!selectedItem.contains(newList[index].images)) {
                                            setState(() {
                                              selectedItem.add(newList[index].images);
                                            });
                                          }
                                        }
                                      },
                                      child: Container(
                                        color: selectedItem.contains(newList[index].images)
                                            ? Colors.green
                                            : Colors.grey,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              height: 70,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          newList[index].names,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  newList[index].images,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
