Ext.define('App.View.AddSale.Form', {
    extend: 'Ext.form.Panel',
    alias: 'widget.App-View-AddSale-Form',

    layout: {
        type: 'vbox',
        align: 'stretch'
    },

    padding: 10,

    items: [
        {
            xtype: 'datefield',
            fieldLabel: 'Sale Date',
            name: 'salesDate',
            maxValue: new Date(),
            allowBlank: false
        },
        {
            xtype: 'combobox',
            fieldLabel: 'Salesperson',
            name: 'salespersonId',
            store: {
                proxy: {
                    type: 'ajax',
                    url: 'api/Salesperson/GetSalespersonList',
                    reader: {
                        type: 'json'
                    }
                }
            },
            displayField: 'fullName',
            valueField: 'salespersonId',
            allowBlank: false
        },
        {
            xtype: 'combobox',
            fieldLabel: 'Customer',
            name: 'customerId',
            store: {
                proxy: {
                    type: 'ajax',
                    url: 'api/Customer/GetCustomerList',
                    reader: {
                        type: 'json'
                    }
                }
            },
            displayField: 'fullName',
            valueField: 'customerId',
            allowBlank: false
        },
        {
            xtype: 'combobox',
            fieldLabel: 'Product',
            name: 'productId',
            store: {
                proxy: {
                    type: 'ajax',
                    url: 'api/Product/GetProductFilter',
                    reader: {
                        type: 'json'
                    }
                }
            },
            displayField: 'filterText',
            valueField: 'productId',
            allowBlank: false
        }
    ]
});