PrintWriter output;

int COLUMN_NUMBER = 36;
int ROW_NUMBER = 44;
String[][] answer;
String[][] order;
String[][] result;

void setup() {
  output = createWriter("result.csv"); 

  String answer_file[] = loadStrings("data1.csv");
  String order_file[] = loadStrings("data2.csv");
  answer = new String[answer_file.length][COLUMN_NUMBER];
  order = new String[order_file.length][COLUMN_NUMBER];
  result = new String[ROW_NUMBER][COLUMN_NUMBER];

  if (answer_file.length != ROW_NUMBER || order_file.length != ROW_NUMBER) {
    println("*****CSV FILE ERROR*****");
  } else {
    for (int i=0; i < answer_file.length; i++) {
      String tmp[] = split(answer_file[i], ",");
      for (int j=0; j < tmp.length; j++) {
        answer[i][j] = tmp[j];
      }
    }
    println("=====ANSWER DATA=====");
    for (int i=0; i < answer_file.length; i++) {
      for (int j=0; j < COLUMN_NUMBER; j++) {
        print(" " + answer[i][j]);
      }
      println();
    }

    for (int i=0; i < order_file.length; i++) {
      String tmp[] = split(order_file[i], ",");
      for (int j=0; j < tmp.length; j++) {
        order[i][j] = tmp[j];
      }
    }
    println("=====ORDER DATA=====");
    for (int i=0; i < order_file.length; i++) {
      for (int j=0; j < COLUMN_NUMBER; j++) {
        print(" " + order[i][j]);
      }
      println();
    }
    replace();
  }
}

void draw() {
}

void replace() {
  for (int i=0; i < ROW_NUMBER; i++) {
    for (int j=0; j < COLUMN_NUMBER; j++) {
      int var = int(order[i][j])-1;
      result[i][j] = answer[i][var];
    }
  }
  println("=====REPLACED DATA=====");
  for (int i=0; i < ROW_NUMBER; i++) {
    for (int j=0; j < COLUMN_NUMBER; j++) {
      print(" " + result[i][j]);
      output.print(result[i][j]+",");
    }
    println();
    output.println();
  }
  output.flush();
  output.close();
  exit();
}