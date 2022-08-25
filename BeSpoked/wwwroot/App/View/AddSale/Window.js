Ext.define('App.View.AddSale.Window', {
    extend: 'Ext.window.Window',
    alias: 'widget.App-View-AddSale-Window',
    controller: 'App-Controller-AddSale-Window',

    title: 'Add Sale',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    width: 400,
    modal: true,

    items: [
        { xtype: 'App-View-AddSale-Form' },
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