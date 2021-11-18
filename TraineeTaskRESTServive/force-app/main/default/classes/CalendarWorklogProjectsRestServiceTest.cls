@isTest
private class CalendarWorklogProjectsRestServiceTest {
    @isTest
    static void getRecordDataTestPositive() {
        Id recordId = createTestRecord();

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        RestContext.response = response;

        request.requestUri = 'https://mindful-raccoon-838otp-dev-ed.lightning.force.com/services/apexrest/Project__c/'  + recordId;
        request.httpMethod = 'GET';
        request.addParameter('XAuth', 'randomstring');
        RestContext.request = request;
        Project__c thisProj = CalendarWorklogProjectsRestService.getRecordData();
        
        System.assert(thisProj != null);
        System.assertEquals('Unit test project record', thisProj.Name);
    }

    @isTest
    static void getRecordDataTestNegative() {
        Id recordId = createTestRecord();

        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        RestContext.response = response;

        request.requestUri = 'https://mindful-raccoon-838otp-dev-ed.lightning.force.com/services/apexrest/Project__c/'  + recordId;
        request.httpMethod = 'GET';
        request.addParameter('XAuth', 'errorstring');
        RestContext.request = request;
        Project__c thisProj = CalendarWorklogProjectsRestService.getRecordData();
        
        System.assert(thisProj == null);
    }


    // Helper method
    static Id createTestRecord() {
        // Create test record
        Project__c projectTest = new Project__c(Name='Unit test project record', Priority__c='Low');
        insert projectTest;
        return projectTest.Id;
    }         
}
