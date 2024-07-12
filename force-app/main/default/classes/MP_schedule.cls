global class MP_schedule implements Schedulable {
    private String someParameter;
    
    global MP_schedule(String param) {
        someParameter = param;
    }
    
    global void execute(SchedulableContext context) {
        system.debug(someParameter);
    }
}