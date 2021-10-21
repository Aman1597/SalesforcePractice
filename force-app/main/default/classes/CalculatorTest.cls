@isTest
private class CalculatorTest {
	private static Calculator calcObj = new Calculator();
    
    private static testMethod void testAddWithPositiveNumbers(){
        Integer expected = 10;
        Integer actual = calcObj.add(3,7);
        
        System.assertEquals(expected, actual, 'Expected - ' + expected + ' but Actual - ' + actual);
    }
    
    private static testMethod void testAddWithOneNegativeNumber(){
        Integer expected = 10;
        Integer actual = calcObj.add(3,-7);
        
        System.assertEquals(expected, actual, 'Expected - ' + expected + ' but Actual - ' + actual);
    }
}