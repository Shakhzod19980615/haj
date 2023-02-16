library translate;

class Translate{
  static List<String> lat_up = ["A", "B", "V", "G", "D", "E", "Yo", "J", "Z", "I", "Y", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "F", "X", "Ts", "Ch", "Sh", "Shch", "\"", "Y", "'", "E", "Yu", "Ya"];
  static List<String> lat_low = ["a", "b", "v", "g", "d", "e", "yo", "j", "z", "i", "y", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "f", "x", "ts", "ch", "sh", "shch", "\"", "y", "'", "e", "yu", "ya"];
  static List<String> rus_up = ["А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "\"", "Ы", "Ь", "Э", "Ю", "Я"];
  static List<String> rus_low = [ "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "\"", "ы", "ь", "э", "ю", "я"];

  static String toCyrilic(String value){
    value = value.replaceAll("sh","ш");
    value = value.replaceAll("yu","ю");
    value = value.replaceAll("ya","я");
    value = value.replaceAll("ch","ч");


    value = value.replaceAll("Sh","Ш");
    value = value.replaceAll("Yu","Ю");
    value = value.replaceAll("Ya","Я");
    value = value.replaceAll("Ch","Ч");
    // value = value.replaceAll("Yo","Ё");

    value = value.replaceAll("SH","Ш");
    value = value.replaceAll("YU","Ю");
    value = value.replaceAll("YA","Я");
    value = value.replaceAll("CH","Ч");
    // value = value.replaceAll("YO","Ё");

    value = value.replaceAll("h","ҳ");
    value = value.replaceAll("H","Ҳ");

    value = value.replaceAll("o'","ў");
    value = value.replaceAll("O'","Ў");

    value = value.replaceAll("oʹ","ў");
    value = value.replaceAll("Oʹ","Ў");

    value = value.replaceAll("o‘","ў");
    value = value.replaceAll("O‘","Ў");

    value = value.replaceAll("oʻ","ў");
    value = value.replaceAll("Oʻ","Ў");

    value = value.replaceAll("o`","ў");
    value = value.replaceAll("O`","Ў");

    value = value.replaceAll("g'","ғ");
    value = value.replaceAll("G'","Ғ");

    value = value.replaceAll("g‘","ғ");
    value = value.replaceAll("G‘","Ғ");

    value = value.replaceAll("g`","ғ");
    value = value.replaceAll("G`","Ғ");

    value = value.replaceAll("g‘","ғ");
    value = value.replaceAll("G‘","Ғ");

    value = value.replaceAll("gʻ","ғ");
    value = value.replaceAll("Gʻ","Ғ");

    value = value.replaceAll("q","қ");
    value = value.replaceAll("Q","Қ");


    for (int i = 0; i <= 32; i++)
    {
      value = value.replaceAll(lat_up[i],rus_up[i]);
      value = value.replaceAll(lat_low[i],rus_low[i]);
    }

    value = value.replaceAll("йо","ё");
    value = value.replaceAll("Йо","Ё");
    value = value.replaceAll("ЙО","Ё");

    value = value.replaceAll("йе","е");
    value = value.replaceAll("Йе","Е");
    value = value.replaceAll("ЙЕ","Е");

    value = value.replaceAll("Ь","ъ");
    value = value.replaceAll("ь","ъ");
    return value;
  }

  static String toLatin(String value){

    value = value.replaceAll("ҳ","h");
    value = value.replaceAll("Ҳ","H");
    value = value.replaceAll("ъ","'");
    value = value.replaceAll("Ъ","'");

    value = value.replaceAll("ў","o'");
    value = value.replaceAll("Ў","O'",);

    value = value.replaceAll("ғ","g'",);
    value = value.replaceAll("Ғ","G'");

    value = value.replaceAll("қ","q");
    value = value.replaceAll("Қ","Q");

    for (int i = 0; i <= 32; i++)
    {
      value = value.replaceAll(rus_up[i],lat_up[i]);
      value = value.replaceAll(rus_low[i],lat_low[i]);
    }


    return value;
  }
  static String toCyrilicKeys(String value){

    value = value.replaceAll("Q","Й");
    value = value.replaceAll("q","й");
    value = value.replaceAll("W","Ц");
    value = value.replaceAll("w","ц");


    value = value.replaceAll("E","У");
    value = value.replaceAll("e","у");
    value = value.replaceAll("R","К");
    value = value.replaceAll("r","к");

    value = value.replaceAll("T","Е");
    value = value.replaceAll("t","е");
    value = value.replaceAll("Y","Н");
    value = value.replaceAll("y","н");

    value = value.replaceAll("U","Г");
    value = value.replaceAll("u","г");

    value = value.replaceAll("I","Ш");
    value = value.replaceAll("i","ш");

    value = value.replaceAll("O","Щ");
    value = value.replaceAll("o","щ");

    value = value.replaceAll("P","З");
    value = value.replaceAll("p‘","з");

    value = value.replaceAll("{","Х");
    value = value.replaceAll("[","х");
    value = value.replaceAll("}","Ъ");
    value = value.replaceAll("]","ъ");
    value = value.replaceAll("|","Ё");
    value = value.replaceAll("\\","ё");

    value = value.replaceAll("A","Ф");
    value = value.replaceAll("a","ф");
    value = value.replaceAll("S","Ы");
    value = value.replaceAll("s","ы");
    value = value.replaceAll("D","В");
    value = value.replaceAll("d","в");
    value = value.replaceAll("F","А");
    value = value.replaceAll("f","а");
    value = value.replaceAll("G","П");
    value = value.replaceAll("g","п");
    value = value.replaceAll("H","Р");
    value = value.replaceAll("h","р");
    value = value.replaceAll("J","О");
    value = value.replaceAll("j","о");
    value = value.replaceAll("K","Л");
    value = value.replaceAll("k","л");
    value = value.replaceAll("L","Д");
    value = value.replaceAll("l","д");
    value = value.replaceAll(":","Ж");
    value = value.replaceAll(";","ж");
    value = value.replaceAll("\"","Э");
    value = value.replaceAll("\'","э");

    value = value.replaceAll("Z","Я");
    value = value.replaceAll("z","я");
    value = value.replaceAll("X","Ч");
    value = value.replaceAll("x","ч");
    value = value.replaceAll("C","С");
    value = value.replaceAll("c","с");
    value = value.replaceAll("V","М");
    value = value.replaceAll("v","м");
    value = value.replaceAll("B","И");
    value = value.replaceAll("b","и");
    value = value.replaceAll("N","Т");
    value = value.replaceAll("n","т");
    value = value.replaceAll("M","Ь");
    value = value.replaceAll("m","ь");
    value = value.replaceAll("<","Б");
    value = value.replaceAll(",","б");
    value = value.replaceAll(">","Ю");
    value = value.replaceAll(".","ю");
    return value;
  }
  static String toLatinKeys(String value){

    value = value.replaceAll("Й","Q");
    value = value.replaceAll("й","q");
    value = value.replaceAll("Ц","W");
    value = value.replaceAll("ц","w");
    value = value.replaceAll("У","E",);
    value = value.replaceAll("у","e",);
    value = value.replaceAll("К","R",);
    value = value.replaceAll("к","r",);
    value = value.replaceAll("Е","T",);
    value = value.replaceAll("е","t",);
    value = value.replaceAll("Н","Y",);
    value = value.replaceAll("н","y",);
    value = value.replaceAll("Г","U",);
    value = value.replaceAll("г","u",);
    value = value.replaceAll("Ш","I",);
    value = value.replaceAll("ш","i",);
    value = value.replaceAll("Щ","O",);
    value = value.replaceAll("щ","o",);
    value = value.replaceAll("З","P",);
    value = value.replaceAll("з","p",);
    value = value.replaceAll("Х","{",);
    value = value.replaceAll("х","[",);
    value = value.replaceAll("Ъ","}",);
    value = value.replaceAll("ъ","]",);
    value = value.replaceAll("Ё","|",);
    value = value.replaceAll("ё","\\",);

    value = value.replaceAll("Ф","A",);
    value = value.replaceAll("ф","a",);
    value = value.replaceAll("Ы","S",);
    value = value.replaceAll("ы","s",);
    value = value.replaceAll("В","D",);
    value = value.replaceAll("в","d",);
    value = value.replaceAll("А","F",);
    value = value.replaceAll("а","f",);
    value = value.replaceAll("П","G",);
    value = value.replaceAll("п","g",);
    value = value.replaceAll("Р","H",);
    value = value.replaceAll("р","h",);
    value = value.replaceAll("О","J",);
    value = value.replaceAll("о","j",);
    value = value.replaceAll("Л","K",);
    value = value.replaceAll("л","k",);
    value = value.replaceAll("Д","L",);
    value = value.replaceAll("д","l",);
    value = value.replaceAll("Ж",":",);
    value = value.replaceAll("ж",";",);
    value = value.replaceAll("Э","\"",);
    value = value.replaceAll("э","\'",);

    value = value.replaceAll("Я","Z",);
    value = value.replaceAll("я","z",);
    value = value.replaceAll("Ч","X",);
    value = value.replaceAll("ч","x",);
    value = value.replaceAll("С","C",);
    value = value.replaceAll("с","c",);
    value = value.replaceAll("М","V",);
    value = value.replaceAll("м","v",);
    value = value.replaceAll("И","B",);
    value = value.replaceAll("и","b",);
    value = value.replaceAll("Т","N",);
    value = value.replaceAll("т","n",);
    value = value.replaceAll("Ь","M",);
    value = value.replaceAll("ь","m",);
    value = value.replaceAll("Б","<",);
    value = value.replaceAll("б",",",);
    value = value.replaceAll("Ю",">",);
    value = value.replaceAll("ю",".",);
    return value;
  }
}