public class mp_annotation {
    @TestVisible
    private static String privateMethod() {
        return 'This is a private method.';
    }

    @TestVisible
    protected String protectedVariable = 'This is a protected variable.';
}