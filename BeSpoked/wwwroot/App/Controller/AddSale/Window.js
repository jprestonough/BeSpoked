Ext.define('App.Controller.AddSale.Window', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.App-Controller-AddSale-Window',

    control: {
        'App-View-AddSale-Window #saveButton': {
            click: 'saveButtonClicked'
        },
        'App-View-AddSale-Window #cancelButton': {
            click: 'cancelButtonClicked'
        }
    },


    saveButtonClicked: function (me) {
        var win = me.up('window'),
            form = win.down('form');

        if (form.isValid()) {
            win.mainContainer.setLoading(true);
            win.hide();

            Ext.Ajax.request({
                url: 'api/Sales/InsertSale',
                method: 'POST',
                jsonData: form.getForm().getFieldValues(),

                callback: function (options, success, response) {
                    if (success) {
                        Ext.Msg.alert('Success', 'Sale saved');
                    } else {
                        Ext.Msg.alert('Error', 'Error occurred');
                    }

                    win.mainContainer.setLoading(false);
                    win.close();
                }
            });
        }
    },
    cancelButtonClicked: function (me) {
        me.up('window').close();
    }
});