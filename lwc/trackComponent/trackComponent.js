import { LightningElement } from 'lwc';

export default class TrackComponent extends LightningElement {

    counter =0;

    increment(){
         this.counter += 1;
    }
    decrement(){
          this.counter -= 1
    }

}