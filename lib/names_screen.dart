import 'linker.dart';

class NamesScreeb extends StatelessWidget {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  NamesScreeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: firstController,
                decoration: const InputDecoration(
                    hintText: "Enter First Player Name",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: secondController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Second Player Name",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                Get.to(TicTocUi(firstName: firstController.text, secondName: secondController.text,));
              },
              child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: buttonColor,
                  ),
                  child: const Center(
                    child: Text(
                      "JOIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ))),
        ]),
      ),
    );
  }
}
