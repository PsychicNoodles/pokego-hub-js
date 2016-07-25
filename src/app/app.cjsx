# obligatory tap event plugin call
require('react-tap-event-plugin')()

React = require('react')
ReactDOM = require('react-dom')
AppBar = require('./app-bar')
Map = require('./map/map')
Divider = require('material-ui/Divider').default
{ Card, CardText } = require('material-ui/Card')

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
        <Map zoom={16} center={lat: 41.7497, lng: -92.7195} />
        <Divider />
        <Card>
          <CardText>What up there will be more content here</CardText>
        </Card>
      </div>
    </MuiThemeProvider>

element = React.createElement(App)
ReactDOM.render(element, document.getElementById 'app')
