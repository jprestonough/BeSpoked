Ext.define('App.View.SalesList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-SalesList-Container',

    layout: 'fit',

    items: [
        { xtype: 'App-View-SalesList-Grid' }
    ]
});