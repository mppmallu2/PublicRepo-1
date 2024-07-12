@isTest
public class mp_alltest {
    @testSetup
    static void method1(){
        List<Opportunity> opport=new List<Opportunity>();
        List<Account> accounts=new List<Sobject>();
        for(integer i=0;i<100;i++){
            Account acc=new Account();
            acc.Name='test mp'+i;
            acc.AccountSource='web';
            acc.BillingCity='Pune';
            acc.BillingCountry='India';
            acc.BillingStreet='Kartavya Path';
            acc.BillingState='Maharashtra';
            acc.Industry='Finance';
            acc.Phone='+91-91832345'+i+i;
            acc.Type='Prospect';
            acc.Rating='Hot';
            acc.Description='Dummy data created for Indian Accounts';
            accounts.add(acc);
            Opportunity opp=new Opportunity();
            opp.Name='mp'+i;
            opp.CloseDate=date.today();
            opp.StageName='Qualification';    
            opport.add(opp);
        } 
        insert accounts; 
        insert opport;
    }
    @isTest
    static void method2(){
        test.startTest();
        mp_SOBJECT.Accountmethod();
        List<Account> ac2=[select Id from Account];
         mpAccount_Handler.inserting(ac2);
        mp_SOBJECT.insertTwo();
        List<Opportunity> op1=[select Id,Name,AccountID From Opportunity];
        mp_opportunity_rollupSummary.insOpp(op1);
        mp_insertDummyRecords.insertDummyData();
        mp_insertDummyRecords.method_dummy();
        mp_annotation.privateMethod();
        //mp_Annotation.protectedVariable;
        mp_allconcepts.method_avi_commerce();
        mp_allconcepts.method_database();
        mp_allconcepts.method_SOQL();
        mp_allconcepts.method_SOQLchild();
        mp_allconcepts acmp=new mp_allconcepts();
        acmp.methodShowAccount();
        mp_allconcepts.try_catch();
        test.stopTest();     
    }
    @isTest
    static void method3(){
        test.startTest();
        mp_allCollection.mapMethod();
        mp_allCollection.mapMethod2();
        mp_allCollection.listMethod();
        mp_allCollection.arrayMethod();
        mp_allcollection asf=new mp_allcollection();
        mp_metaDataType.metadata_test();
        mp_UtilFutureDemo.insertUser();
        test.stopTest();  
    }
    @isTest
    static void method4(){
        test.startTest();
        mp_AccountUpdateBatchJob ccd=new mp_AccountUpdateBatchJob();
        database.executeBatch(ccd);
        test.stopTest();
    }
    
    @isTest
    static void method5(){
        test.startTest();
        mp1_AccountBAtch1   batch = new mp1_AccountBAtch1();
        Database.executeBatch(batch);
        test.stopTest();
    }
    @isTest
    static void method6(){
        test.startTest();
        mp_govLimitcheck bb=new mp_govLimitcheck();
        Database.executeBatch(bb);
        test.stopTest();
    }
     @isTest
    static void method7(){
        test.startTest();
               
        mp_AccountUpdateBatchJob ccd=new mp_AccountUpdateBatchJob();
        database.executeBatch(ccd);
        test.stopTest();
    }
}