import 'dart:math';


generatePassword(){
  Random random = new Random();
  int i=0;
  var password = "";
 List alp = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v',
             'w','x','y','z','A','B',
      'C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W',
             'X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
 for(i=0;i<=8;i++){
   int randomNumber = random.nextInt(alp.length);
   password = password+alp[randomNumber];
 }
  return password;
}