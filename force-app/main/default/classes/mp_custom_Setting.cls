public class mp_custom_Setting {
/***********************************************************
*Custom Setting List has created in CRM with lablel studnet*
* **********************************************************/
    public static void CustomList(){
        list<student__c> varx=student__c.getAll().Values();
        for(student__c asd1:varx){
            system.debug(asd1);
        }
        // to get a single record of Custom setting List
        student__C varx1=student__C.getinstance('Amar');
        system.debug('single Record:'+varx1);      
    }
/**************************************************************************** 
* 	Custom Setting Hierarchy has created in Front End with lablel Industry  *
*****************************************************************************/
    public static void CustomHierarchy(){
        Industry__c indHir1=Industry__c.getValues(UserInfo.getProfileId());
        system.debug(indHir1);       
    }
}