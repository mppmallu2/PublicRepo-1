public class mp_incursion {
    Public static Integer count=0;
    Public static void method(){
        count+=1;
        system.debug(count);
        method1();
    }
    Public static void method1(){
        count+=1;
        if(count<999){
     method();   
        }
    }
    

}