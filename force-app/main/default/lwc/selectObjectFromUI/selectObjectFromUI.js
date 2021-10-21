import { LightningElement, api, wire, track } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class SelectObjectFromUI extends LightningElement {
    @api objName;
    @api 
    inputValue;
    //@api account;
    //@api T;
    arr=[];
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    wiredRecs(result) {
        if (result.data) {
            let mpFields = result.data.fields;
            let a= mpFields.keys();
            
            a.forEach((key) => {
                this.arr.push(key.value);
            });
             
            
             
        } else if (result.error) {
            this.error = result.error;
            this.arr = undefined;
        }
    }
}