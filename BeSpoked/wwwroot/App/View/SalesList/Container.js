Ext.define('App.View.SalesList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-SalesList-Container',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    items: [
        { xtype: 'App-View-SalesList-Toolbar' },
        { xtype: 'App-View-SalesList-Grid', border: true, flex: 1 }
    ]
});