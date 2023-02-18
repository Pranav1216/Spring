trigger UpdateAccountContactsTrigger on Contact (after insert, after update, after delete) {
    Set<Id> accountIds = new Set<Id>();
    
    if (Trigger.isInsert || Trigger.isUpdate) {
        for(Contact con : Trigger.new) {
            accountIds.add(con.AccountId);
        }
    } else if (Trigger.isDelete) {
        for(Contact con : Trigger.old) {
            accountIds.add(con.AccountId);
        }
    }
    
    // Calling the Apex class to update the "Number of Contacts" field on the related Account records
    if (!accountIds.isEmpty()) {
        UpdateAccountContacts.updateAccountContacts(new List<Account>([SELECT Id FROM Account WHERE Id IN :accountIds]));
    }
}