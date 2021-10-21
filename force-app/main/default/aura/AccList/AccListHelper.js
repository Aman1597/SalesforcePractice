({
	sortData : function(cmp, fieldName, sortDirection) {
		var data = cmp.get("v.accList");
        var reverse = sortDirection !== 'asc';
        
        data.sort(this.sortBy(fieldName, reverse));
        cmp.set("v.accList", data);
	},
    
    sortBy : function(field, reverse, primer) {
        var key = primer ? function(a) { return primer(a[field])} : function(x) { return x[field]; };
        reverse = !reverse ? 1 : -1;
        
        return function(a, b){
            return a = key(a), b = key(b), reverse * ((a>b) - (b>a));
        }
    }
})