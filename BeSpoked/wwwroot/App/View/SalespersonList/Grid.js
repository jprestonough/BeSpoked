Ext.define('App.View.SalespersonList.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.App-View-SalespersonList-Grid',
    store: {
        proxy: {
            type: 'ajax',
            url: 'api/Salesperson/GetSalespersonList',
            reader: {
                type: 'json'
            }
        },
        autoLoad: true
    },
    columns: {
        defaults: {
            minWidth: 150
        },
        items:
            [
                { text: 'First Name', dataIndex: 'firstName' },
                { text: 'Last Name', dataIndex: 'lastName' },
                { text: 'Address', dataIndex: 'address' },
                { text: 'Phone Number', dataIndex: 'phoneNumber' },
                { text: 'Start Date', dataIndex: 'startDate', xtype: 'datecolumn' },
                { text: 'Termination Date', dataIndex: 'terminationDate', xtype: 'datecolumn', minWidth: 150 },
                { text: 'Manager Name', dataIndex: 'managerName' }
            ]
    }
});