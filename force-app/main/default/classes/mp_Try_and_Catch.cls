public class mp_Try_and_Catch {
     public static void performDivision(Integer dividend, Integer divisor) {
        try {
            Integer result = dividend / divisor;
            System.debug('Result: ' + result);
        } catch (Exception e) {
            System.debug('An error occurred: ' + e.getMessage());
        }
    }

}