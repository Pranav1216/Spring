public class UpdateAccountContacts {
    
    public static void updateAccountContacts(List<Account> accounts) {
        
        // Querying for related contacts for all accounts in the list
        List<Account> accountList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accounts];
        
        // Looping through the account records and update the "Number of Contacts" field
        for(Account acc : accountList) {
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        
        // Updating the account records in the database
        update accountList;
    }
}