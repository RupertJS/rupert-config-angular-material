var Path = require('path');

module.exports = function (config){
    require('rupert-plugin-angular')(config);

    config.append('stassets.vendors.prefix',
        Path.resolve(__dirname, '../node_modules')
    );

    config.append('stassets.vendors.js', [
        'hammerjs/hammer.min.js',
        'angular-material-builds/angular-material.min.js',
    ]);

    config.append('stassets.vendors.css',
        'angular-material-builds/angular-material.min.css'
    );

    return config;
};
