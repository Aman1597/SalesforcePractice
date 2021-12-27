public class wordCount {
  @InvocableMethod(label='Count Occurrence' description='Returns count of occurrence of words')
  public static List<flowOutputVal> getCountOccurrence(List<flowInputVal> flowinput) {
     List<flowOutputVal> result = new List<flowOutputVal>();
      List<flowOutputValues> m1 = new List<flowOutputValues>();
      
     for(flowInputVal finpt: flowinput){
       for(flowInputValues fiv: finpt.inptList){
          List<String> str = fiv.para.split(' ');
          Set<String> x = new Set<String>(fiv.keys.split(','));
          List<String> keyList = new List<String>(x);
           flowOutputVal res = new flowOutputVal();
      
     if(keyList.size()>0 && str.size()>0){
          
        for(String k: keyList){
            Integer count = 0;
            for (String s: str)
            {
            if (k.toUpperCase().equals(s.toUpperCase()))
                count++;
            }
          flowOutputValues addValue= new flowOutputValues();
          addValue.key=k;
          addValue.occ= count;
            m1.add(addValue);
          }
         res.totalWordCount=str.size();
         res.outptList=m1;
       }
               result.add(res); //res
      }
     }
      return result;
  }
}
//cng2