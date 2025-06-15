import { LightningElement,api } from 'lwc';

export default class ApiChildComponent extends LightningElement {
    
    //@api used: i want to update the text in parent component but if its not @api it will be local to childComponent and not parent component and to make any update we will have to navigate to the child component and update it 
   @api name = "Ritik Gupta"
   
}