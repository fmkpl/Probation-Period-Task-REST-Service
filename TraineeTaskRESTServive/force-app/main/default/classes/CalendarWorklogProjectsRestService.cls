@RestResource(urlMapping='/Project__c/*')
global with sharing class CalendarWorklogProjectsRestService {

    @HttpGet
    global static Project__c getRecordData() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String projectId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        if (req.headers.get('XAuth') == System.Label.JETBI_Calendar_Worklog_XAuth_c) {
            Project__c result =  [select Id, Name, Priority__c
            FROM Project__c
            WHERE Id = :projectId];
            return result;
        } else {
            res.statusCode = 401;
            res.responseBody = Blob.valueOf('Unauthorized');
            return null;
        }
    }
}
