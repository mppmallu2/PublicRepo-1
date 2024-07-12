//@Mallikarjun Pujari
//@Description    A cllass that create .csv sobject templat with columns "Field Label,API Name,Data Type,Length,Description,Picklist Values" and store file in contetVersion (Files)

public class MpTempFile {
    public static void exportFieldMetadata(String objectName) {
       List<Schema.SObjectField> fields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().values();
    List<String> csvLines = new List<String>();

    // csv columns
    csvLines.add('Field Label,API Name,Data Type,Length,Description,Picklist Values');

    
    for(Schema.SObjectField field : fields) {
        Schema.DescribeFieldResult fieldDescribe = field.getDescribe();

        String fieldLabel = fieldDescribe.getLabel();
        String fieldApiName = fieldDescribe.getName();
        String fieldType = getFieldDataType(fieldDescribe);
        integer fieldLength=fieldDescribe.getLength();
        String fieldDescription = String.isNotBlank(fieldDescribe.getInlineHelpText()) ? fieldDescribe.getInlineHelpText() : '';
        String picklistValues = getPicklistValues(fieldDescribe);

      /**************************************************/
        csvLines.add('"' + fieldLabel + '","' + fieldApiName + '","' + fieldType + '","'+fieldLength+'","' + fieldDescription + '","' + picklistValues + '"');
    
        }

       
        String csvContent = String.join(csvLines, '\n');
        String fileName = objectName+'_Template_'+system.now() + '_MpTempFile.apxc.csv';
        ContentVersion version = new ContentVersion(
            Title = fileName,
            VersionData = Blob.valueOf(csvContent),
            PathOnClient = fileName
        );
        insert version;
    }

    private static String getFieldDataType(Schema.DescribeFieldResult fieldDescribe) {
        String fieldType = '';
        if(fieldDescribe.getType() == Schema.DisplayType.String) {
            fieldType = 'Text(' + fieldDescribe.getLength() + ')';
        } else if(fieldDescribe.getType() == Schema.DisplayType.TextArea) {
            fieldType = 'Long Text Area(' + fieldDescribe.getLength() + ')';
        } else if(fieldDescribe.getType() == Schema.DisplayType.Reference) {
            // Assuming there is only one related object for simplicity
            fieldType = 'Lookup(' + fieldDescribe.getReferenceTo()[0].getDescribe().getName() + ')';
        } else if(fieldDescribe.getType() == Schema.DisplayType.Currency || fieldDescribe.getType() == Schema.DisplayType.Double || fieldDescribe.getType() == Schema.DisplayType.Percent) {
            fieldType = 'Number(' + fieldDescribe.getPrecision() + ', ' + fieldDescribe.getScale() + ')';
        } else {
            fieldType = String.valueOf(fieldDescribe.getType());
        }
        return fieldType;
    }

    private static String getPicklistValues(Schema.DescribeFieldResult fieldDescribe) {
        String picklistValues = '';
        if(fieldDescribe.getType() == Schema.DisplayType.Picklist || fieldDescribe.getType() == Schema.DisplayType.MultiPicklist) {
            List<Schema.PicklistEntry> picklistEntries = fieldDescribe.getPicklistValues();
            for(Schema.PicklistEntry entry : picklistEntries) {
                picklistValues += entry.getValue() + ';';
            }
            picklistValues = picklistValues.removeEnd(';');
        }
        return picklistValues;
    }
}