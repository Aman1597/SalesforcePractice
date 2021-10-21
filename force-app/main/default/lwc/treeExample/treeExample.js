import { LightningElement , wire, track} from 'lwc';
import accounts from '@salesforce/apex/TreeData.getTreeData';


export default class TreeExample extends LightningElement {
    
    @track treeItems;
    @track error;
    @track columns = [
        { label: 'Account Name', fieldName: 'accLink', type: 'url',
        typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
        { label: 'Account Number', fieldName: 'AccountNumber'},
        { label: 'Industry', fieldName: 'Industry'},
        { label: 'Contact name', fieldName: 'conLink', type: 'url',
        typeAttributes: {label: { fieldName: 'ConName' }, target: '_blank'}},
        { label: 'Birthdate', fieldName: 'Birthdate', type: 'date' },
        { label: 'Department', fieldName: 'Department'},
        { label: 'Mobile', fieldName: 'MobilePhone', type: 'phone' },
    ];

    @wire(accounts)
    wiredRecs({ error, data }) {
        if (data){
            let tempjson = JSON.parse(JSON.stringify(data));
            for ( let i = 0; i < tempjson.length; i++ ) {
                tempjson[ i ].accLink = '/' + tempjson[ i ]['Id'];
                if(tempjson[ i ].Contacts){
                tempjson[ i ]._children = tempjson[ i ][ 'Contacts' ];
                for(let j = 0; j < tempjson[ i ]._children.length; j++){
                    tempjson[ i ]._children[ j ].conLink = '/' + tempjson[ i ]._children[ j ]['Id'];
                    tempjson[ i ]._children[ j ].ConName = tempjson[ i ]._children[ j ]['Name'];
                    delete tempjson[ i ]._children[ j ].Name;
                }
                delete tempjson[ i ].Contacts;
                }
            }
            console.log('Temp json'+JSON.stringify(tempjson));
            this.treeItems = tempjson ;
            console.log('tree items'+this.treeItems);
        }else if (error) {
            this.error = error;
        }
        
    }

    //renderedCallback(){
        //this.template.querySelector('lightning-icon').iconName = 'utility:add';
        //let grid =  this.template.querySelector('lightning-tree-grid');

        //this.template.querySelectorAll('svg')[0].dataKey = 'add';
        //console.log('treeGrid'+grid.querySelector('lightning-datatable').querySelector('div').querySelector('div').querySelector('div').querySelector('table').querySelector('tbody').querySelector('tr').querySelector('th').querySelector('lightning-primitive-cell-factory').querySelector('span').querySelector('div').querySelector('lightning-primitive-treegrid-cell-toggle').querySelector('button').querySelector('lightning-primitive-icon').querySelector('svg').dataKey);

        //console.log('aaa'+this.template.querySelectorAll('lightning-primitive-icon')[0].querySelector('svg').datakey);
        
        //console.log('grid.data'+JSON.stringify(grid.data));
        //console.log('Query Result'+this.template.querySelectorAll('svg'));
    //}
}
