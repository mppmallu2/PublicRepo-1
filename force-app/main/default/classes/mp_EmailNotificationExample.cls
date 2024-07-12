public class mp_EmailNotificationExample {

    public static void sendSingleEmailNotification() {
        
        // Create a new SingleEmailMessage object
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        // Set the recipient's email address
        email.setToAddresses(new List<String>{'sachtikke@gmail.com','mppmallu2@gmail.com','avinash.shirgire.solapur@gmail.com' });

        // Set the email subject
        email.setSubject('email from mp_Apex');

        // Set the email body
        email.setPlainTextBody('This is the content of the email.');

        // Optional: You can set the email body in HTML format as well
        // email.setHtmlBody('<p>This is the content of the email.</p>');

        // Send the email
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email });
    }
}