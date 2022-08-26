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
                {
                    xtype: 'actioncolumn',
                    width: 50,
                    minWidth: 50,
                    align: 'center',
                    items: [
                        {
                            iconCls: 'fa fa-pencil',
                            tooltip: 'Edit',
                            handler: function (table, rowIndex, colIndex) {
                                var rec = table.getStore().getAt(rowIndex);
                                table.grid.fireEvent('customeredit', table.grid, rec.data);
                            }
                        }
                    ]
                },
                { text: 'First Name', dataIndex: 'firstName' },
                { text: 'Last Name', dataIndex: 'lastName' },
                { text: 'Address', dataIndex: 'address' },
                { text: 'Phone Number', dataIndex: 'phoneNumber' },
                { text: 'Start Date', dataIndex: 'startDate', xtype: 'datecolumn' }
            ]
    }
});