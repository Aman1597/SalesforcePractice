public class revScore {
	String score = null;
         
    /*public PageReference test() {
        return null;
    }*/
                
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('1','1')); 
        options.add(new SelectOption('CANADA','Canada')); 
        options.add(new SelectOption('MEXICO','Mexico'));
        options.add(new SelectOption('4','4'));
       
        
        return options; 
    }
                   
    public String getScore() {
        return score;
    }
                    
    public void setScore(String score) { this.score = score; }
}