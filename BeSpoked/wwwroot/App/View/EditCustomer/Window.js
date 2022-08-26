Ext.define('App.View.EditCustomer.Window', {
    extend: 'Ext.window.Window',
    alias: 'widget.App-View-EditCustomer-Window',
    controller: 'App-Controller-EditCustomer-Window',

    title: 'Edit Customer',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    width: 400,
    modal: true,

    items: [
        { xtype: 'App-View-EditCustomer-Form' },
        {
            xtype: 'container',
            layout: {
                type: 'hbox',
                pack: 'end'
            },
            padding: 5,
            items: [
                { xtype: 'button', itemId: 'saveButton', text: 'Save' },
                { xtype: 'button', itemId: 'cancelButton', text: 'Cancel' }
            ]
        }
    ]
});