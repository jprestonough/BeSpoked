Ext.define('App.View.SalesList.Toolbar', {
    extend: 'Ext.container.Container',
    alias: 'widget.App-View-SalesList-Toolbar',
    controller: 'App-Controller-SalesList-Toolbar',

    padding: 5,

    items: [
        {
            xtype: 'button',
            itemId: 'addButton',
            text: 'Add Sale'
        }
    ]
});