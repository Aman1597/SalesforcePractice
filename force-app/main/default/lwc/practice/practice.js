import { LightningElement } from 'lwc';
import {
    EXAMPLES_COLUMNS_DEFINITION_BASIC,
    EXAMPLES_DATA_BASIC,
} from './sampleData';

export default class Practice extends LightningElement {
    // definition of columns for the tree grid
    gridColumns = EXAMPLES_COLUMNS_DEFINITION_BASIC;
   
    // data provided to the tree grid
    gridData = EXAMPLES_DATA_BASIC;
    
}


// import { LightningElement , wire, track} from 'lwc';
// import accounts from '@salesforce/apex/TreeData.getTreeData';


// export default class Practice extends LightningElement {
    
//     @track treeItems = [];
//     @track error;
//     @track columns = [
//         { label: 'Name', fieldName: 'Name' },
//         { label: 'Account Number', fieldName: 'AccountNumber'},
//         { label: 'Industry', fieldName: 'Industry'},
//         { label: 'Contact name', fieldName: 'Name'},
//         { label: 'Birthdate', fieldName: 'Birthdate'},
//         { label: 'Department', fieldName: 'Department'},
//         { label: 'Mobile', fieldName: 'MobilePhone', type: 'phone' },
//     ];

//     @wire(accounts)
//     wiredRecs({ error, data }) {
//         if (data){
//             let tempjson = JSON.parse(JSON.stringify(data));
//             //console.log('asx'+JSON.stringify(data))
//             //let tempjson = JSON.parse(JSON.stringify(data).split('items').join('_children'));
//             for ( let i = 0; i < tempjson.length; i++ ) {
//                 if(tempjson[ i ].Contacts){
//                     tempjson[i].expanded = "true";
//                 tempjson[ i ]._children = tempjson[ i ][ 'Contacts' ];
//                 //tempjson[ i ]._children['Birthdate'] = tempjson[ i ]._children['Birthdate'].toISOString();
//                 // for(let j = 0; j<tempjson[ i ]._children.length; j++){
//                 //     tempjson[ i ]._children[j].Birthdate = tempjson[ i ]._children[j]['Birthdate'].toISOString();
//                 // }
//                 delete tempjson[ i ].Contacts;
//                 }
//             }
//             // let finalData;
//             // for ( let ac of tempjson) {
//             //     // ac.Contacts.forEach(con => {
//             //     //     ac._children._children = con;
//             //     // });
//             //     ac._children = ac['Contacts'];
//             //     //tempData[ i ]._children = tempData[ i ][ 'Contacts' ];
//             //     delete ac.Contacts;
//             //     finalData.push(ac);
//             // }
//             console.log('Temp json'+JSON.stringify(tempjson));
//             this.treeItems = tempjson ; //data;
//             //this.error = undefined;
//             //console.log('data'+ Data);
//             console.log('tree items'+this.treeItems);
//         }else if (error) {
//             this.error = error;
//             //this.treeItems = undefined;
//         }
//     }
// }