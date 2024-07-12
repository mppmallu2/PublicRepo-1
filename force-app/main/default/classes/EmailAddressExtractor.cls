public class EmailAddressExtractor {

    public static List<String> extractEmailAddressesFromStaticResource(String staticResourceName) {
        List<String> emailAddresses = new List<String>();
        String content = getContentFromStaticResource(staticResourceName);
        
        if (content != null && content != '') {
            emailAddresses = findEmailAddresses(content);
        }
        
        return emailAddresses;
    }

    private static String getContentFromStaticResource(String staticResourceName) {
        try {
            PageReference pageRef = PageReference.forResource(staticResourceName);
            Blob contentBlob = pageRef.getContent();
            return contentBlob.toString();
        } catch (Exception ex) {
            // Handle any exceptions or logging here
            return null;
        }
    }

    private static List<String> findEmailAddresses(String content) {
        List<String> emailAddresses = new List<String>();
        // Use regular expressions to find email addresses in the content
        Pattern emailPattern = Pattern.compile('[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}');
        Matcher matcher = emailPattern.matcher(content);
        
        while (matcher.find()) {
            emailAddresses.add(matcher.group());
        }

        return emailAddresses;
    }
}