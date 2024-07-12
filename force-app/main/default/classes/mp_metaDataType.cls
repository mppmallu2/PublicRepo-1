public class mp_metaDataType {
    public static void metadata_test(){
        list<product_Category__mdt> mdft=[select ID,developerName,prcent__c from product_Category__mdt];
        integer i=0;
        for(product_Category__mdt tt:mdft){
            if(tt.prcent__c==123){
                account acc=new account();
                i=i+1;
                acc.Name='electronics'+i;
                insert acc;
            }
        }
    }
    
}