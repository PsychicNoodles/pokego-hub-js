# obligatory tap event plugin call
require('react-tap-event-plugin')()

React = require('react')
ReactDOM = require('react-dom')
AppBar = require('./app-bar')

MuiThemeProvider = require('material-ui/styles/MuiThemeProvider').default

GreetBox = React.createClass
  getInitialState: ->
    settings:
      pokemon: true

  saveSettings: (newSettings) ->
    @setState settings: newSettings

  render: ->
    <MuiThemeProvider>
      <AppBar location='Grinnell' settings={@state.settings}
              saveSettings={@saveSettings} />
    </MuiThemeProvider>

element = React.createElement(GreetBox, name: "World", "Lorem ipsum")
ReactDOM.render(element, document.getElementById 'app')
