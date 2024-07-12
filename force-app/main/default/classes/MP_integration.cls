public class MP_integration {
    public static void makeAPICallout() {
         String accessToken='579b464db66ec23bdd00000112b7a691bc7041676075b63ecf129f12';
        String apiUrl = 'https://api.data.gov.in/resource/8d3b6596-b09e-4077-aebf-425193185a5b?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json&offset=1&limit=10';
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setMethod('GET'); // Change to the appropriate HTTP method
        
        // If you need to set headers, you can do so like this:
       request.setHeader('Authorization', 'Bearer ' + accessToken);
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) { // Check if the response is successful
            String responseBody = response.getBody();
            System.debug('API Response: ' + responseBody);
            
            // If the response is in JSON, you might want to parse it:
             Map<String, Object> jsonResponse = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
            System.debug('Parsed JSON: ' + jsonResponse);
            List<Object> records = (List<Object>)jsonResponse.get('records'); // Get the records array from the response
            
            if (records != null && !records.isEmpty()) {
                List<mpAccount__c> customObjectRecords = new List<mpAccount__c>();
                
                for (Object record : records) {
                    Map<String, Object> recordData = (Map<String, Object>)record;
                    
                    mpAccount__c customRecord = new mpAccount__c();
                    customRecord.Month__c = (String)recordData.get('month');
                    customRecord.Year__c = (String)recordData.get('year');
                    customRecord.OIL_companies__c = (String)recordData.get('oil_companies_');
                    customRecord.metric_tonnes__c = (string)recordData.get('quantity_000_metric_tonnes_');
                    customRecord.last_modified__c = Date.valueOf((String)recordData.get('last_updated'));
                    
                    customObjectRecords.add(customRecord);
                }
                
                // Insert the custom object records
                if (!customObjectRecords.isEmpty()) {
                    insert customObjectRecords;
                    System.debug('Custom records inserted: ' + customObjectRecords.size());
                }
        } else {
            System.debug('API Callout Failed with status code: ' + response.getStatusCode());
            System.debug('Response body: ' + response.getBody());
        }
    }
}
}