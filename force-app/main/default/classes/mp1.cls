public class mp1 {
    public static void exportFieldMetadata(String objectName) {
        List<Schema.SObjectField> fields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().values();
        List<String> csvLines = new List<String>();
        
        // Add header
        csvLines.add('Field Label,API Name,Data Type,Field Length,Description,Picklist Values');
        
        // Iterate through fields
        for(Schema.SObjectField field : fields) {
            Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
            String fieldLabel = fieldDescribe.getLabel();
            String fieldApiName = fieldDescribe.getName();
            String fieldType = getFieldType(fieldDescribe);
            Integer fieldLength = fieldDescribe.getLength();
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
            csvLines.add('"' + fieldLabel + '","' + fieldApiName + '","' + fieldType + '",' + fieldLength + ',"' + fieldDescription + '","' + picklistValues + '"');
        }
        
        // Create CSV file
        String csvContent = String.join(csvLines, '\n');
        String fileName = objectName + '_metadata.csv';
        ContentVersion version = new ContentVersion(
            Title = fileName,
            VersionData = Blob.valueOf(csvContent),
            PathOnClient = fileName
        );
        insert version;
    }
    
    // Method to get Salesforce-specific field type
    private static String getFieldType(Schema.DescribeFieldResult fieldDescribe) {
        switch on fieldDescribe.getType() {
            when BOOLEAN {
                return 'Checkbox';
            }
            when DATETIME {
                return 'DateTime';
            }
            when DATE {
                return 'Date';
            }
            when integer {
                return 'Number';
            }
            when DOUBLE {
                return 'Number';
            }
            when ID {
                return 'Id';
            }
            
            when PERCENT {
                return 'Percent';
            }
            when STRING {
                return 'Text';
            }
            when TIME {
                return 'Time';
            }
            when ADDRESS {
                return 'Address';
            }
            when else {
                return 'Other';
            }
        }
    }
}