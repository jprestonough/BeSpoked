Ext.define('App.Controller.CustomerList.Container', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.App-Controller-CustomerList-Container',

    control: {
        'App-View-CustomerList-Toolbar #addButton': {
            click: 'addButtonClicked'
        },
        'App-View-CustomerList-Grid': {
            customeredit: 'customerEdit'
        }
    },

    addButtonClicked: function (me) {
        var mainContainer = me.up('App-View-Main-Container');

        Ext.create('App.View.EditCustomer.Window', {
            mainContainer: mainContainer,
            customer: {
                customerId: 0
            }
        }).show();
    },
    customerEdit: function (grid, record) {
        var mainContainer = grid.up('App-View-Main-Container');

        if (record.startDate)
            record.startDate = new Date(record.startDate);

        Ext.create('App.View.EditCustomer.Window', {
            mainContainer: mainContainer,
            customer: record
        }).show();
    }
});