Ext.define('App.View.Admin.Container', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-Admin-Container',
    controller: 'App-Controller-Admin-Container',

    padding: 10,

    items: [
        {
            xtype: 'button',
            itemId: 'resetButton',
            text: 'Reset sample data'
        }
    ]
});