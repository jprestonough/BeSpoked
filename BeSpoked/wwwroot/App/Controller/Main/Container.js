Ext.define('App.Controller.Main.Container', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.App-Controller-Main-Container',

    control: {
        'App-View-Main-Container': {
            beforerender: 'beforeRender'
        }
    },


    beforeRender: function (me) {
        //Set a global event to lazy refresh all stores when data changes
        Ext.GlobalEvents.on('datachanged', function () {
            var grids = me.query('grid');

            grids.forEach(function (grid) {
                var store = grid.getStore();

                if (store) {
                    store.load();
                }
            })
        });
    }
});