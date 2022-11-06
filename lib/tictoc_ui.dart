import 'linker.dart';

class TicTocUi extends StatefulWidget {
  String firstName;
  String secondName;
  TicTocUi({super.key, required this.firstName, required this.secondName});

  @override
  State<TicTocUi> createState() => _TicTocUiState();
}

int player = 1;
int count = 0;
List<String> assignList = ['', '', '', '', '', '', '', '', ''];
List<bool> buttonClicked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

class _TicTocUiState extends State<TicTocUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TOP CONTAINER

          Expanded(
            flex: 30,
            child: Container(
              color: topColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // First Player Row
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: player == 1
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.firstName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Second Player Row

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: player == 2
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.secondName,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    // Which player have turn
                    Text(
                      player == 1
                          ? 'Turn ${widget.firstName}'
                          : 'Turn ${widget.secondName}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Bottom Container

          Expanded(
            flex: 70,
            child: Container(
              color: bottomColor,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          gameButton(0),
                          gameButton(1),
                          gameButton(2),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          gameButton(3),
                          gameButton(4),
                          gameButton(5),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          gameButton(6),
                          gameButton(7),
                          gameButton(8),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  gameButton(int index) {
    return Expanded(
        child: InkWell(
      onTap: () {
        print(index);
        if (player == 1 && buttonClicked[index] == false) {
          assignList[index] = 'X';
          player = 2;
          buttonClicked[index] = true;
        } else if (player == 2 && buttonClicked[index] == false) {
          assignList[index] = 'O';
          player = 1;
          buttonClicked[index] = true;
        }
        setState(() {});
        checking();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        color: buttonColor,
        child: Center(
          child: Text(
            assignList[index].toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ));
  }

// This function will tell which user win the match
  checking() {
    count = count + 1;

    // Player One Conditions
    if (assignList[0] == 'X' && assignList[1] == 'X' && assignList[2] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[3] == 'X' &&
        assignList[4] == 'X' &&
        assignList[5] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[6] == 'X' &&
        assignList[7] == 'X' &&
        assignList[8] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[0] == 'X' &&
        assignList[3] == 'X' &&
        assignList[6] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[1] == 'X' &&
        assignList[4] == 'X' &&
        assignList[7] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[2] == 'X' &&
        assignList[5] == 'X' &&
        assignList[8] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[0] == 'X' &&
        assignList[4] == 'X' &&
        assignList[8] == 'X') {
      winDialogue("${widget.firstName} Won");
    } else if (assignList[2] == 'X' &&
        assignList[4] == 'X' &&
        assignList[6] == 'X') {
      winDialogue("${widget.firstName} Won");
    }

    // Player Two Conditions
    if (assignList[0] == 'O' && assignList[1] == 'O' && assignList[2] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[3] == 'O' &&
        assignList[4] == 'O' &&
        assignList[5] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[6] == 'O' &&
        assignList[7] == 'O' &&
        assignList[8] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[0] == 'O' &&
        assignList[3] == 'O' &&
        assignList[6] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[1] == 'O' &&
        assignList[4] == 'O' &&
        assignList[7] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[2] == 'O' &&
        assignList[5] == 'O' &&
        assignList[8] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[0] == 'O' &&
        assignList[4] == 'O' &&
        assignList[8] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (assignList[2] == 'O' &&
        assignList[4] == 'O' &&
        assignList[6] == 'O') {
      winDialogue("${widget.secondName} Won");
    } else if (count == 9) {
      winDialogue('Match Draw');
    }
  }

  winDialogue(String winner) {
    return Get.defaultDialog(
      backgroundColor: bottomColor,
      radius: 8,
      title: 'Result',
      middleText: '',
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      content: Column(
        children: [
          Text(
            winner,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              player = 1;
              count = 0;
              assignList = ['', '', '', '', '', '', '', '', ''];
              buttonClicked = [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
              ];

              setState(() {});
              Get.back();
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: topColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
