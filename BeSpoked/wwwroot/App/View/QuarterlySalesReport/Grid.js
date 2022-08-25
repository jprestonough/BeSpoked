Ext.define('App.View.QuarterlySalesReport.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.App-View-QuarterlySalesReport-Grid',
    store: {
        proxy: {
            type: 'ajax',
            url: 'api/Report/GetQuarterlySalesReport',
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
                { text: 'Salesperson Name', dataIndex: 'salespersonFullname' },
                { text: 'Quarter', dataIndex: 'salesQuarterYear' },
                { text: 'Sales Count', dataIndex: 'totalSalesCount', align: 'right' },
                { text: 'Total Sales', dataIndex: 'totalSalesPrice', renderer: Ext.util.Format.usMoney, align: 'right' },
                { text: 'Total Commission', dataIndex: 'totalSalesCommission', renderer: Ext.util.Format.usMoney, align: 'right' }
            ]
    }
});