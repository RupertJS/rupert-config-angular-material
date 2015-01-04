var Path = require('path');

module.exports = function (config){
    require('rupert-config-angular')(config);

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

    config.map('stassets.material.themes', function (theme) {
        config.append('stassets.vendors.css',
            'angular-material-builds/themes/' + theme + '-theme.css'
        )
        return theme;
    });

    return config;
};
