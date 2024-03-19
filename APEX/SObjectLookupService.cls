public with sharing class SObjectLookupService {
    @AuraEnabled(cacheable=true)
    public static List<SObject> searchSObjects(String searchTerm, String sObjectApiName) {    
        List<SObject> foundRecords = new List<SObject>();
        String wildcardSearchTerm = '%' + searchTerm + '%';
        String soqlQuery = 'SELECT Id, Name FROM ' + sObjectApiName + ' WHERE Name LIKE :wildcardSearchTerm ORDER BY CreatedDate DESC LIMIT 10';
        
        for (SObject obj : Database.query(soqlQuery)) {
            foundRecords.add(obj);
        }
        
        return foundRecords;
    }
}
