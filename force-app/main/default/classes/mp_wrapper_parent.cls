public class mp_wrapper_parent {
    public list<mp_wrapper_child> ord=new list<mp_wrapper_child>();
    public void method1(){
        ord.add(new mp_wrapper_child('0001',1111));
        ord.add(new mp_wrapper_child('0001',1111));
        ord.add(new mp_wrapper_child('2222',2222));
        ord.add(new mp_wrapper_child('3333',3333));
        ord.add(new mp_wrapper_child('4444',4444));
        ord.add(new mp_wrapper_child('5555',5555));
        
    }
    public static void method2(mp_wrapper_parent clsVar){
        for(mp_wrapper_child mpw:clsVar.ord){
            system.debug(mpw);
            
        }
    }
    
}


//@Notes
/*   execute from Anonymous window
 
mp_wrapper_parent bm=new mp_wrapper_parent();
bm.method1();
mp_wrapper_parent.method2(bm); 
*/


//@Notes:Static methods
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