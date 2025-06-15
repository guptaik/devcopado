import { LightningElement } from 'lwc';

export default class Iteratorloop extends LightningElement {


    // object
    employeeList =[ {
        fName : 'Test',
        lName :'Name 1',
        loopType:'ITERATOR',
        Age: 35
    },
     {
        fName : 'Test',
        lName :'Name 2',
        loopType:'ITERATOR',
        Age: 30
    }, {
         fName : 'Test',
        lName :'Name 3',
        loopType:'ITERATOR',
        Age: 29
    }, {
         fName : 'Test',
        lName :'Name 4',
        loopType:'ITERATOR',
        Age: 25
    }
]
}