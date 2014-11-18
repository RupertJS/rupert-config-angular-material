clone = (_)-> JSON.parse JSON.stringify _
_config =
  name: 'rupert-config-angular.test'
  root: __dirname
  stassets:
    root: __dirname
    vendors:
      config:
        dependencies: {}

_config.stassets.vendors.config.dependencies[__dirname + '/../src/config'] = yes

describe 'Rupert Config Angular', ->
  describe 'Scripts', ->
    app = null
    config = clone _config
    rupert = require('rupert')(config)

    it 'attaches files to the config from Angular', ->
      config.stassets.vendors.js.length.should.equal 10

    it 'registers Angular file types', ->
      config.stassets.scripts.types.length.should.equal 6

  describe 'Themes', ->
    app = null
    config = clone _config
    config.stassets.material =
      themes: [ 'light-grey' ]
    rupert = require('rupert')(config)

    it 'loads several themes files', ->
      config.stassets.vendors.css.length.should.equal 2
