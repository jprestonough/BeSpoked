Ext.define('App.View.CustomerList.Toolbar', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-CustomerList-Toolbar',

    padding: 5,

    items: [
        {
            xtype: 'button',
            itemId: 'addButton',
            text: 'Add Customer'
        }
    ]
});