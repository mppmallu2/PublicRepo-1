public class mp_ApexCalloutExample {
    public static void makeHttpCallout() {
        // URL of the JSONPlaceholder API to retrieve a post with ID 1
        String url = 'https://jsonplaceholder.typicode.com/posts/1';

        // Create an HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET'); // Use 'POST', 'PUT', etc. for other methods

        // Create an HTTP object to send the request
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Handle the response
        if (response.getStatusCode() == 200) {
            // Successful response, process the data
            String responseBody = response.getBody();
            System.debug('Response: ' + responseBody);

            // If the response is JSON, you can deserialize it into Apex objects using JSON.deserialize or JSON.deserializeUntyped
            // Example: Map<String, Object> parsedResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
        } else {
            // Error response, handle accordingly
            System.debug('Callout error: ' + response.getStatusCode() + ' ' + response.getStatus());
        }
    }
}