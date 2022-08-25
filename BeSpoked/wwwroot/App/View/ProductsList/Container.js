Ext.define('App.View.ProductsList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-ProductsList-Container',

    layout: 'fit',

    items: [
        { xtype: 'App-View-ProductsList-Grid' }
    ]
});