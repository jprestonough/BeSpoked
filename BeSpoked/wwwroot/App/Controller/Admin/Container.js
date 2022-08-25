Ext.define('App.Controller.Admin.Container', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.App-Controller-Admin-Container',

    control: {
        'App-View-Admin-Container button[itemId=resetButton]': {
            click: 'saveClicked'
        }
    },

    saveClicked: function (me) {
        var mainContainer = me.up('App-View-Main-Container');

        Ext.Msg.confirm('Reset Sample Data',
            'Are you sure you want to reset sample data?',
            function (buttonId) {
                if (buttonId == 'yes') {
                    mainContainer.setLoading(true);

                    Ext.Ajax.request({
                        url: 'api/Admin/ResetSampleData',
                        method: 'POST',

                        callback: function (options, success, response) {
                            if (success) {
                                Ext.Msg.alert('Success', 'Sample data reset');
                            } else {
                                Ext.Msg.alert('Error', 'Error occurred');
                            }

                            mainContainer.setLoading(false);
                        }
                    });
                }
            });
    }
});