clone = (_)-> JSON.parse JSON.stringify _
_config =
  name: 'rupert-config-angular.test'
  root: __dirname
  plugins:
    dependencies: {}
  stassets:
    root: __dirname

_config.plugins.dependencies[__dirname + '/../src/config'] = yes

describe 'Rupert Config Angular', ->
  describe 'Scripts', ->
    app = null
    rupert = require('rupert')(clone(_config))
    config = rupert.config
    beforeEach (done)-> rupert.then -> done()

    it 'attaches files to the config from Angular', ->
      config.stassets.vendors.js.length.should.equal 11

    it 'registers Angular file types', ->
      config.stassets.scripts.types.length.should.equal 6

  describe 'Themes', ->
    app = null
    config = clone _config
    config.stassets.material =
      themes: [ 'grey' ]

    rupert = require('rupert')(config)
    config = rupert.config
    console.log config.find('stassets.material.themes', [])

    beforeEach (done)-> rupert.then -> done()

    it 'loads several themes files', ->
      # config.find('stassets.material.themes', []).should.deep.equal [ 'grey' ]
      config.stassets.vendors.css.length.should.equal 2
