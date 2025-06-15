import { LightningElement } from 'lwc';

export default class ForeachLooping extends LightningElement {


    // object
    employeeList =[ {
        fName : 'Test',
        lName :'Name 1',
        loopType:'foreach',
        Age: 35
    },
     {
        fName : 'Test',
        lName :'Name 2',
        loopType:'foreach',
        Age: 30
    }, {
         fName : 'Test',
        lName :'Name 3',
        loopType:'foreach',
        Age: 29
    }, {
         fName : 'Test',
        lName :'Name 4',
        loopType:'foreach',
        Age: 25
    }
]
}