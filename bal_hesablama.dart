import 'dart:io';
import 'package:collection/collection.dart';

void main() {
   Map <String, List<num>> subjects = {
      'Az-dili' : [],
      'İngilis-dili' : [],
      'Kimya' : [],
      'Fizika' : [],
      'Riyaziyyat' : []
   };

   Map<String, int> AzII = {
      'Information Technology' : 611,
      'Computer Science' : 603,
      'Mechanical Engineering' : 234,
      'Electrical Engineering' : 387
   };

   Map<String, int> BMU = {
   'Information Technology' : 567,
   'Computer Engineering' : 532,
   'Geology' : 456,
   'Electrical Engineering' : 273
   };

   Map<String, int> AzTU = {
   'Information Technology' : 402,
   'Telecommunication Technology' : 289,
   'Radioelectronical Engineering' : 322,
   'Electrical Engineering' : 200
   };

String correctAnswer;
String incorrectAnswer;

int parsedCorrectAnswer=0;
int parsedIncorrectAnswer=0;
   for(var subject in subjects.keys){
      while(true){
         print("Please enter the number of correct answers from $subject");
         correctAnswer = stdin.readLineSync()!;
         if(int.tryParse(correctAnswer)!=null) {
            parsedCorrectAnswer = int.parse(correctAnswer);
         }
            else{
            print("***Please enter a valid number!");
            continue;
         }
            while(true){
               print("Please enter the number of incorrect answers from $subject");
               incorrectAnswer = stdin.readLineSync()!;
               if(int.tryParse(incorrectAnswer)!=null){
                  parsedIncorrectAnswer = int.parse(incorrectAnswer);
                  break;
               }
               else{
                  print("***Please enter a valid number!");
                  continue;
               }
            }

            int sumOfQuestions = parsedCorrectAnswer + parsedIncorrectAnswer;
            if(sumOfQuestions > 25){
               print("***Please enter the number of correct and incorrect answers correctly!");
               continue;
            } /// duzgun ve yanlis cavablarin sayi 25 olmalidir. maksimum sual sayi 25-dir
            else{
               subjects[subject]!.add(parsedCorrectAnswer);
               subjects[subject]!.add(parsedIncorrectAnswer);
               break; /// bele etmeyimin sebebi eger her tryParse-dan sonra add etseydim,
               /// o zaman evvel yanlis daxil etdiyim (cemi 25-den yuxari olan) cutler de list icine girecekdi
               /// o zaman da hesablama yanlis gedecekdi.
            }

      }

   }
subjects.forEach((a, b) {
   print("$a: $b\n");
});
num totalPoint = 0;
num result = 0;
   for(var sub in subjects.keys){
      num tamDuzgunCavabSayi = subjects[sub]![0] - subjects[sub]![1] * 0.25;
      result = tamDuzgunCavabSayi * 4;
      if(sub=='Fizika' || sub=='Riyaziyyat'){
         result = tamDuzgunCavabSayi * 8;
      }
      totalPoint = totalPoint + result;
      print("$sub: $result");

   }
print("Total point is $totalPoint");

   List<String> ixtisaslarAzii = [];
   List<String> ixtisaslarBmu = [];
   List<String> ixtisaslarAztu = [];

   for(int i = 0; i <AzII.values.length; i++) {
      if(totalPoint >= AzII.values.elementAt(i)){
         ixtisaslarAzii.add(AzII.keys.elementAt(i));
      }
   }
   for(int i = 0; i <BMU.values.length; i++) {
      if(totalPoint >= BMU.values.elementAt(i)){
         ixtisaslarBmu.add(BMU.keys.elementAt(i));
      }
   }
   for(int i = 0; i <AzTU.values.length; i++) {
      if(totalPoint >= AzTU.values.elementAt(i)){
         ixtisaslarAztu.add(AzTU.keys.elementAt(i));
      }
   }
   print("With this point you can access to $ixtisaslarAzii majors in AzII, $ixtisaslarBmu in BMU, $ixtisaslarAztu in AzTU\n XEYIRLI OLSUN BAJIOGLU!");

}

/// bu program istirakcinin her fenn uzre yazdigi suallarin umumi sayinin duzgunluyunu yoxlayir (25-den cox ola bilmez);
/// input ederken cemi 25-den cox ola bilecek ededler daxil edebilme ehtimalini nezere alaraq once yazilan sual sayinin duzgunluyunu yoxlayir,
/// eger cavablandirilan sual sayi 25-den kicik beraberdirse bu zaman list icine add edilir;
/// her fenni ayri, umumi bali ayri hesablayir;
/// yigdigin bala gore hansi universitetin hansi ixtisasina qebul ola bileceyini deyir.