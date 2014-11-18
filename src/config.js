var Path = require('path');

module.exports = function (config){
    config = require('rupert-config-angular')(config);

    config.vendors.prefix.push(Path.resolve(__dirname, '../node_modules'));

    config.vendors.js = (config.vendors.js || []).concat([
        'angular-material-builds/angular-material.min.js',
    ]);
    config.vendors.css = (config.vendors.css || []).concat([
        'angular-material-builds/angular-material.min.css',
    ]);

    if (config.material && config.material.themes) {
        config.material.themes.forEach(function(theme){
            config.vendors.css.push(
                'angular-material-builds/themes/' + theme + '-theme.css'
            );
        });
    }

    return config;
};
