Ext.define('App.View.CustomerList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-CustomerList-Container',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    items: [
        { xtype: 'App-View-CustomerList-Grid' }
    ]
});