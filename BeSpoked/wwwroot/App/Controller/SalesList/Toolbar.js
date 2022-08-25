Ext.define('App.Controller.SalesList.Toolbar', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.App-Controller-SalesList-Toolbar',

    control: {
        'App-View-SalesList-Toolbar #addButton': {
            click: 'addButtonClicked'
        }
    },


    addButtonClicked: function (me) {
        var mainContainer = me.up('App-View-Main-Container');

        Ext.create('App.View.AddSale.Window', {
            mainContainer: mainContainer
        }).show();
    }
});