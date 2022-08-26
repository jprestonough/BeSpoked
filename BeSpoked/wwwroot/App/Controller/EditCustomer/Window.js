Ext.define('App.Controller.EditCustomer.Window', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.App-Controller-EditCustomer-Window',

    control: {
        'App-View-EditCustomer-Window': {
            beforerender: 'beforerender'
        },
        'App-View-EditCustomer-Window #saveButton': {
            click: 'saveButtonClicked'
        },
        'App-View-EditCustomer-Window #cancelButton': {
            click: 'cancelButtonClicked'
        }
    },

    beforerender: function (me) {
        var form = me.down('form'),
            fields = form.query('field');

        if (me.customer) {
            fields.forEach(function (field) {
                if (me.customer.hasOwnProperty(field.name)) {
                    field.setValue(me.customer[field.name]);
                }
            });
        }
    },
    saveButtonClicked: function (me) {
        var win = me.up('window'),
            form = win.down('form');

        if (form.isValid()) {
            win.mainContainer.setLoading(true);

            Ext.Ajax.request({
                url: 'api/Customer/UpsertCustomer',
                method: 'POST',
                jsonData: form.getForm().getFieldValues(),

                callback: function (options, success, response) {
                    if (success) {
                        var result = Ext.JSON.decode(response.responseText);

                        if (result.ResultStatus == 1) {
                            Ext.Msg.alert('Success', 'Customer saved');
                            Ext.GlobalEvents.fireEvent('datachanged');
                            win.close();
                        } else {
                            Ext.Msg.alert('Error', result.ResultMessage);
                        }
                    } else {
                        Ext.Msg.alert('Error', 'Error occurred');
                    }
                    
                    win.mainContainer.setLoading(false);                    
                }
            });
        }
    },
    cancelButtonClicked: function (me) {
        me.up('window').close();
    }
});