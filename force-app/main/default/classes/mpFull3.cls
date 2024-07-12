public class mpFull3 {

    public static void exportFieldMetadata(String objectName) {
        // Get all fields for the specified object
        List<Schema.SObjectField> fields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().values();

        // List to hold CSV lines
        List<String> csvLines = new List<String>();

        // Add header line to the CSV
        csvLines.add('Field Label,API Name,Data Type,Description,Length,Picklist Values');

        // Iterate through fields
        for(Schema.SObjectField field : fields) {
            // Describe field
            Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
            
            // Extract field metadata
            String fieldLabel = fieldDescribe.getLabel();
            String fieldApiName = fieldDescribe.getName();
            String fieldType = String.valueOf(fieldDescribe.getType());
            String fieldDescription = String.isNotBlank(fieldDescribe.getInlineHelpText()) ? fieldDescribe.getInlineHelpText() : '';
            Integer fieldLength = fieldDescribe.getLength();
            String picklistValues = '';

            // Check if field is picklist or multipicklist
            if(fieldDescribe.getType() == Schema.DisplayType.Picklist || fieldDescribe.getType() == Schema.DisplayType.MultiPicklist) {
                List<Schema.PicklistEntry> picklistEntries = fieldDescribe.getPicklistValues();
                for(Schema.PicklistEntry entry : picklistEntries) {
                    picklistValues += entry.getValue() + ';';
                }
                picklistValues = picklistValues.removeEnd(';');
            }

            // Add line to CSV
            csvLines.add('"' + fieldLabel + '","' + fieldApiName + '","' + fieldType + '","' + fieldDescription + '",' + fieldLength + ',"' + picklistValues + '"');
        }
        
        // Generate CSV content
        String csvContent = String.join(csvLines, '\n');
        String fileName = objectName +system.now()+ '_metadata.csv';
        
        // Create CSV file
        ContentVersion csvFile = new ContentVersion();
        csvFile.Title = fileName;
        csvFile.VersionData = Blob.valueOf(csvContent);
        csvFile.PathOnClient = fileName;
        insert csvFile;
    }
}