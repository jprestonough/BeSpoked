Ext.define('App.View.CustomerList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-CustomerList-Container',
    controller: 'App-Controller-CustomerList-Container',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    items: [
        { xtype: 'App-View-CustomerList-Toolbar' },
        { xtype: 'App-View-CustomerList-Grid', flex: 1 }
    ]
});