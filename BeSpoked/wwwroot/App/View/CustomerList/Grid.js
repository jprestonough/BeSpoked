Ext.define('App.View.CustomerList.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.App-View-CustomerList-Grid',
    store: {
        proxy: {
            type: 'ajax',
            url: 'api/Customer/GetCustomerList',
            reader: {
                type: 'json'
            }
        },
        autoLoad: true
    },
    scrollable: true,
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
                { text: 'Start Date', dataIndex: 'startDate', xtype: 'datecolumn' }
            ]
    }
});