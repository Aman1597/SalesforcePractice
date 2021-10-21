@isTest
public class testWordCount {
    @isTest static void test1(){
        //setup data
        String para = 'You know New York you need New York you know you need unique New York';
        String keys = 'you,new,york,need';
        flowInputValues fiv = new flowInputValues();
        fiv.para = para;
        fiv.keys = keys;
        List<flowInputValues> inputList = new List<flowInputValues>();
        inputList.add(fiv);
        flowInputVal finpt = new flowInputVal();
        finpt.inptList = inputList;
        List<flowInputVal> flowInput= new List<flowInputVal>();
        flowInput.add(finpt);
        //method call
        List<flowOutputVal> resultList = wordCount.getCountOccurrence(flowInput);
        
        //Compare expected output with actual output
        for(flowOutputVal res: resultList){
            system.assertEquals(15, res.totalWordCount);
            system.assertEquals(4, res.outptList[0].occ);
            system.assertEquals(3, res.outptList[1].occ);
            system.assertEquals(3, res.outptList[2].occ);
            system.assertEquals(2, res.outptList[3].occ);
        }
    }
}