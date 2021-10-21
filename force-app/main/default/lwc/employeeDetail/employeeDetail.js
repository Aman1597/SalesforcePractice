import { LightningElement } from 'lwc';

export default class EmployeeDetail extends LightningElement {
    name; dob; age; salary;
    nameHandler(event){
        this.name=event.target.value;
    }
    ageCalculator(event){
        this.dob=event.target.value;
        this.age= new Date().toISOString();
    }
    salaryHandler(event){
        this.salary=event.target.value;
    }
}