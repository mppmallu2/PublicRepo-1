public class mp_wrapper_child {
    public string orderId;
    public decimal amount;
    public mp_wrapper_child(string orderId,decimal amount){
        this.orderId=orderId;
        this.amount=amount;
    }
    public static void method1(mp_wrapper_child orde){
        decimal total=orde.amount*10000;
        system.debug(total);
        
    }

}
//Notes
/*
Apex static methods cannot directly access instance (class-level) variables
because they do not operate on any specific instance of the class. 
Static methods belong to the class itself,
and they are independent of any particular object (instance) of the class. 
Therefore, they cannot access instance variables, 
which are associated with specific instances of the class.

When a method is static, it is bound to the class and not to any object. 
This means that the method can be called without creating an instance of the class. 
Since instance variables are part of the object's state and 
each object has its own copy of these variables, 
it would be ambiguous for a static method to access instance variables directly. 
Which instance's variable should it access if there is no specific instance to refer to?

If you want to use an instance variable within a static method, 
you need to pass the instance variable as a parameter to the method.
This way, the method can work with the specific 
*/