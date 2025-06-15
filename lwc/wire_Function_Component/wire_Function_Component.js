import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class Wire_Function_Component extends LightningElement {
    @api recordId;
    account;
    error;

    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name', 'Account.Phone'] })
    wiredAccount({ data, error }) {
        if (data) {
            this.account = data;
            this.error = undefined;
        } else {
            this.account = undefined;
            this.error = error;
        }
    }

    get getName() {
        return this.account?.fields?.Name?.value ?? '';
    }

    get getPhone() {
        return this.account?.fields?.Phone?.value ?? '';
    }
}