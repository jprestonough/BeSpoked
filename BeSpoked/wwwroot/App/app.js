Ext.onReady(function () {
    Ext.create('Ext.container.Viewport', {
        renderTo: Ext.getBody(),
        layout: 'fit',
        items: [
            { xtype: 'App-View-Main-Container' }
        ]
    });
});