public class MpFieldMetadataExporter {
    public static void exportFieldMetadata(String objectName) {
        List<Schema.SObjectField> fields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().values();
        List<String> csvLines = new List<String>();
        
        // csv columns
        csvLines.add('Field Label,API Name,Data Type,Description,Picklist Values');
        
        // Iterate through fields
        for(Schema.SObjectField field : fields) {
            Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
            String fieldLabel = fieldDescribe.getLabel();
            integer fieldLength=fieldDescribe.getLength();
            String fieldApiName = fieldDescribe.getName();
            String fieldType = String.valueOf(fieldDescribe.getType());
            String fieldDescription = String.isNotBlank(fieldDescribe.getInlineHelpText()) ? fieldDescribe.getInlineHelpText() : '';
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
            csvLines.add('"' + fieldLabel + '","' + fieldApiName + '","' + fieldType + '","' + fieldDescription +'","'+ fieldLength + '","' + picklistValues + '"');
        }
        
        // Create CSV file
        String csvContent = String.join(csvLines, '\n');
        String fileName = objectName +'_mp'+ '_metadata.csv';
        ContentVersion version = new ContentVersion(
            Title = fileName,
            VersionData = Blob.valueOf(csvContent),
            PathOnClient = fileName
        );
        insert version;
    }
}