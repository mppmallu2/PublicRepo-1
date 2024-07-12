public class TempClass {
     Public static integer num=10;
        public final static string name='mp';
    Public static void temps(){
        List<Parent_Object__c> pList=new List<Parent_Object__c>();
        string[] Fath=new string[]{'Shankar','Anjani','Ganga','Drithrashtr','Pandu','Shri Ram','Ravana','Ghatodgaj','Yashoda','Radha'};
            
            for(integer i=0;i<10;i++){
                Parent_Object__c itr=new Parent_Object__c();
                itr.Parent_Label__c=Fath[i];
                pList.add(itr);
            }
        Database.saveresult[] Result=Database.insert(pList,false);
        
        string[] sons=new string[]{'Ganesha','Hanuman','Bhishma','Duryodhana','Arjun','Kush','Meghraj','BarBarik','Krishna','Karna'};
            List<child_object__c> cList=new List<child_object__c>();
        integer k=0;
        for(Database.saveResult rre:Result){
            
            if(rre.isSuccess()){
                system.debug(rre);
                child_object__c itc= new child_object__c();
                itc.Child_Label__c=sons[k];
                itc.age__C=10+k;
                itc.Father_Lookup__c=rre.getId();
                cList.add(itc);
                
            }
         k++;
        }
           
            Database.saveResult[] Resultc=Database.insert(cList,false);
            system.debug('child Operation Size:'+Resultc.size());
             
    }
         
        
// select id,name,Parent_Label__c ,(select id,name,age__c,Child_Label__c from Father_relation__r) from Parent_Object__c    
    Public static void method_ti(){
	system.debug(num);
    system.debug(name);
    }
    
}