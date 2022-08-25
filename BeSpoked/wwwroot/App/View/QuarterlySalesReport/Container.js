Ext.define('App.View.QuarterlySalesReport.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-QuarterlySalesReport-Container',

    layout: 'fit',

    items: [
        { xtype: 'App-View-QuarterlySalesReport-Grid' }
    ]
});