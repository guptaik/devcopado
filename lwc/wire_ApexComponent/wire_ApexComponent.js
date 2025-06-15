import getAccountList from '@salesforce/apex/AccountHelperLWC.getAccountList';
import { LightningElement,api,wire } from 'lwc';

export default class Wire_ApexComponent extends LightningElement {

    @api recordId;
    @wire (getAccountList,{accId:'$recordId'}) accounts;

}