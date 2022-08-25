Ext.define('App.View.SalespersonList.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-SalespersonList-Container',

    layout: 'fit',

    items: [
        { xtype: 'App-View-SalespersonList-Grid' }
    ]
});