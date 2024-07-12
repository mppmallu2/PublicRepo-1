public class MP_GoogleSearchAPI {
    
    public static List<GoogleSearchResult>  search(String query) {
        String apiKey = 'AIzaSyC6rkP-6ks9Ho8_1hxOWh6Q6o5cMt53ONs';
        String cx = '26e330c915a2e423c';
        String endpoint = 'https://www.googleapis.com/customsearch/v1';
        String searchString = EncodingUtil.urlEncode(query, 'UTF-8');
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint + '?key=' + apiKey + '&cx=' + cx + '&q=' + searchString);
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            System.debug('Parsed JSON: ' + jsonResponse);
            ///////////////////////////////////////////////////////           
            List<GoogleSearchResult> searchResults = new List<GoogleSearchResult>();
            List<Object> items = (List<Object>) jsonResponse.get('items');
            
            for (Object item : items) {
                Map<String, Object> itemMap = (Map<String, Object>) item;
                GoogleSearchResult result = new GoogleSearchResult();
                result.displayLink = (String) itemMap.get('displayLink');
                result.formattedUrl = (String) itemMap.get('formattedUrl');
                result.htmlFormattedUrl = (String) itemMap.get('htmlFormattedUrl');
                result.htmlSnippet = (String) itemMap.get('htmlSnippet');
                result.htmlTitle = (String) itemMap.get('htmlTitle');
                searchResults.add(result);
            } 
            return searchResults;
            
        } else {
            // Handle non-200 response status code (e.g., log an error message)
            return new List<GoogleSearchResult>();
        }
    }
}