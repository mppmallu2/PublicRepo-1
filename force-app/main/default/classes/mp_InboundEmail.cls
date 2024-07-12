public class mp_InboundEmail implements Messaging.InboundEmailHandler {
    Public Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result=new Messaging.InboundEmailResult();
        system.debug('email service activated');
        try{
            case newCase=new Case();
            newCase.Origin='Email';
            newCase.Subject=email.subject;
            newCase.Description=email.plainTextBody;
            newCase.Product__c='High';
            newCase.Status='New';
            result.success=true;
            insert newCase;
      		// Process email attachments
            List<Attachment> attachments = new List<Attachment>();
            if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
                for (Messaging.InboundEmail.BinaryAttachment files : email.binaryAttachments) {
                    Attachment file = new Attachment();
                    file.ParentId = newCase.Id; // Attach to the case
                    file.Name = files.fileName;
                    file.Body = files.body;
                    attachments.add(file);
                }
            }
            insert attachments;
            
            
        }catch(Exception e){
            system.debug(e.getCause());
            system.debug(e.getLineNumber());
            result.success=false;
        }
        return result;
    }
}