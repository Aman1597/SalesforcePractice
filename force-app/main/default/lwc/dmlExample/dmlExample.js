import { LightningElement , wire, track} from 'lwc';
import contacts from '@salesforce/apex/getContacts.getContacts';
import {refreshApex} from '@salesforce/apex';
/* function dekho(){
    console.log('sss'+ this);
}
let x = this;
console.log('sssAAAA'+ x);
dekho(); */
const columns = [
    { label: 'Name', fieldName: 'lName' , type: 'url' ,
    typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
    { label: 'Account Name', fieldName: 'accLink', type: 'url',
    typeAttributes: {label: { fieldName: 'Account.Name' }, target: '_blank'}},
    { label: 'Birthdate', fieldName: 'Birthdate', type: 'date' },
    { label: 'Department', fieldName: 'Department'},
    { label: 'Mobile', fieldName: 'MobilePhone', type: 'phone' },
    
]
// export class Dml11 extends LightningElement{
//     dx;
    
//     abc(){
//         this.dx = this;
//         consol.log('DX '+dx);
//     }
// }   { label: 'Test', fieldName: 'test'}

export default class DmlExample extends LightningElement {
    
    @track recs = []; 
    @track error;
    x = 2;
    columns = columns;
    @track wiredContactList = [];
    //console.log('sss1'+this);   {data, error }

    @wire(contacts)
    wiredRecs(result) {
        this.wiredContactList = result;
        console.log('sss2'+this);
        if (result.data) {
            let contactsArray = [];
            
            for (let row of result.data) {
                 // this const stroes a single flattened row. 
                 const flattenedRow = {}
                 flattenedRow.lName = '/' + row.Id;
                 flattenedRow.accLink = '/' + row.AccountId;
                 //flattenedRow.test = this.Name + ' ' + globalThis.Name;
                 // get keys of a single row — Name, Phone, LeadSource and etc
                 let rowKeys = Object.keys(row); 
                
                 //iterate 
                 rowKeys.forEach((rowKey) => {
                     
                     //get the value of each key of a single row. John, 999-999-999, Web and etc
                     const singleNodeValue = row[rowKey];
                     
                     //check if the value is a node(object) or a string
                     if(singleNodeValue.constructor === Object){
                         
                         //if it's an object flatten it
                         this._flatten(singleNodeValue, flattenedRow, rowKey);
                     }else{
                         
                         //if it’s a normal string push it to the flattenedRow array
                         flattenedRow[rowKey] = singleNodeValue;
                     }
                     
                 });
                
                 //push all the flattened rows to the final array 
                 contactsArray.push(flattenedRow);
             }
             
             //assign the array to an array that's used in the template file
             this.recs = contactsArray;
        } else if (result.error) {
            this.error = result.error;
            this.recs = undefined;
        }
    }
    _flatten = (nodeValue, flattenedRow, nodeName) => {        
        let rowKeys = Object.keys(nodeValue);
        rowKeys.forEach((key) => {
            let finalKey = nodeName + '.'+ key;
            flattenedRow[finalKey] = nodeValue[key];
        })
    }

    validateFields() {
        this.template.querySelectorAll('lightning-input-field').forEach(element => {
            element.reportValidity();
        });
        console.log('sssValidateFields'+ this);
    }
    
    handleSuccess(){
        refreshApex(this.wiredContactList);
        console.log('sssRefresh'+ this);
    }
}


