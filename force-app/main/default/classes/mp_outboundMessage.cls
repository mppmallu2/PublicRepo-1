public class mp_outboundMessage {
    Public static void call(){
        List<Contact> cc=[select Id,email From Contact];
        List<String> EmailIds=new List<String>();
        for(Contact c:cc){
            if(c.Email!=null){
                EmailIds.add(c.Email);
            }
        }
        Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
        msg.setToAddresses(EmailIds);
        string[] bcc=new string[]{'mp1@hi2.in'};
            
            // msg.bccaddresses(bcc);
            msg.setCcAddresses(bcc);
        msg.setSubject('Welcome Mail');
       ContentVersion file =[SELECT Id, Title, FileExtension, ContentSize
FROM ContentVersion where title='Async Apex' limit 1];
        msg.setPlainTextBody(file.Description);
        msg.setSenderDisplayName('The MP Corp.');
        Messaging.Email[] emails=new Messaging.Email[]{msg};
            Messaging.sendEmail(emails);
    }
    
    Public static void send_document(){
        List<Contact> cc=[select Id,email From Contact where createdDate=Today];
        List<String> EmailIds=new List<String>();
        for(Contact c:cc){
            if(c.Email!=null){
                EmailIds.add(c.Email);
            }
        }
  
        // Query ContentVersion to access VersionData for the ContentDocument
ContentVersion contentVersion = [SELECT VersionData FROM ContentVersion WHERE ContentDocument.Title = 'Async Apex' LIMIT 1];
string documentContent=' '; 
if (contentVersion != null) {
    // Convert the VersionData (Blob) into a string.
    documentContent += contentVersion.VersionData.toString();
    
    // Now, 'documentContent' contains the content of the ContentDocument as a string.
    System.debug(documentContent); // Debug the string content here.
}
                   system.debug('email');
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(EmailIds);
        email.setSubject('OnBoard COntact Welcome');
        email.setPlainTextBody(documentContent);
        
    }
    
}