Ext.define('App.View.Main.Container', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.App-View-Main-Container',

    title: 'BeSpoked Sales',

    items: [
        {
            title: 'Products',
            items: [
                { xtype: 'App-View-ProductsList-Container' }
            ]
        },
        {
            title: 'Salespeople',
            items: [
                { xtype: 'App-View-SalespersonList-Container' }
            ]
        },
        {
            title: 'Customers',
            items: [
                { xtype: 'App-View-CustomerList-Container' }
            ]
        },
        {
            title: 'Admin',
            items: [
                { xtype: 'App-View-Admin-Container' }
            ]
        }
    ]

});