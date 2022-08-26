Ext.define('App.View.EditCustomer.Form', {
    extend: 'Ext.form.Panel',
    alias: 'widget.App-View-EditCustomer-Form',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    padding: 10,

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'First Name',
            name: 'firstName',
            allowBlank: false
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Last Name',
            name: 'lastName',
            allowBlank: false
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Address',
            name: 'address',
            allowBlank: false
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Phone Number',
            name: 'phoneNumber',
            allowBlank: false
        },
        {
            xtype: 'datefield',
            fieldLabel: 'Start Date',
            name: 'startDate',
            maxValue: new Date(),
            allowBlank: false
        },
        {
            xtype: 'hiddenfield',
            name: 'customerId'
        }
    ]
});