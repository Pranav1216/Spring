import { LightningElement, wire } from 'lwc';
import getRecentlyCreatedAccounts from '@salesforce/apex/AccountController.getRecentlyCreatedAccounts';

export default class RecentlyCreatedAccounts extends LightningElement {
    accounts;

    @wire(getRecentlyCreatedAccounts)
    wiredAccounts({error, data}) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error(error);
        }
    }
}
