Ext.define('App.View.SalesList.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.App-View-SalesList-Grid',
    store: {
        proxy: {
            type: 'ajax',
            url: 'api/Sales/GetSalesList',
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
                { text: 'Sales Date', dataIndex: 'salesDate', xtype: 'datecolumn' },
                { text: 'Salesperson Name', dataIndex: 'salespersonFullname' },
                { text: 'Customer Name', dataIndex: 'customerFullname' },
                { text: 'Purchase Price', dataIndex: 'purchasePrice', renderer: Ext.util.Format.usMoney, align: 'right' },
                { text: 'Final Price', dataIndex: 'finalPrice', renderer: Ext.util.Format.usMoney, align: 'right' },
                { text: 'Final Commission', dataIndex: 'finalCommission', renderer: Ext.util.Format.usMoney, align: 'right' },
            ]
    }
});