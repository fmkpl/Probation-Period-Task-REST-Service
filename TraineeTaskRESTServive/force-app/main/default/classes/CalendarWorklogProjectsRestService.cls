@RestResource(urlMapping='/Project__c/*')
global with sharing class CalendarWorklogProjectsRestService {
    @HttpGet
    global static Project__c getRecordData() {
        RestRequest request = RestContext.request;

        String projectId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Project__c result =  [select Id, Name, Priority__c
                        FROM Project__c
                        WHERE Id = :projectId];
        return result;
    }
}
