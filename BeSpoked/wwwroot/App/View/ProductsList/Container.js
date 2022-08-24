Ext.define('App.View.ProductsList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-ProductsList-Container',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    items: [
        { xtype: 'App-View-ProductsList-Grid' }
    ]
});