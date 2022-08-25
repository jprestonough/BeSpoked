Ext.define('App.View.ProductsList.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.App-View-ProductsList-Grid',
    controller: 'App-Controller-ProductsList-Grid',
    store: {
        proxy: {
            type: 'ajax',
            url: 'api/Product/GetProductsList',
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
        items: [
            { text: 'Name', dataIndex: 'productName' },
            { text: 'Manufacturer', dataIndex: 'manufacturer' },
            { text: 'Style', dataIndex: 'style' },
            { text: 'Purchase Price', dataIndex: 'purchasePrice', renderer: Ext.util.Format.usMoney, align: 'right' },
            { text: 'Sales Price', dataIndex: 'salePrice', renderer: Ext.util.Format.usMoney, align: 'right' },
            { text: 'Quantity Available', dataIndex: 'quantityNbr', xtype: 'numbercolumn', format: '0', align: 'right' },
            {
                text: 'Commission %', dataIndex: 'commissionPct',
                renderer: function (value, formatString) {
                    return (value * 100) + '%';
                },
                align: 'right'
            }
        ]
    }
});