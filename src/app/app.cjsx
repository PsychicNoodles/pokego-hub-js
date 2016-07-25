# obligatory tap event plugin call
require('react-tap-event-plugin')()

React = require('react')
ReactDOM = require('react-dom')
AppBar = require('./app-bar')
Map = require('./map')

MuiThemeProvider = require('material-ui/styles/MuiThemeProvider').default

App = React.createClass
  getInitialState: ->
    settings:
      pokemon: true

  saveSettings: (newSettings) ->
    @setState settings: newSettings

  render: ->
    <MuiThemeProvider>
      <div>
        <AppBar location='Grinnell' settings={@state.settings}
                saveSettings={@saveSettings} />
        <Map />
      </div>
    </MuiThemeProvider>

element = React.createElement(App)
ReactDOM.render(element, document.getElementById 'app')
