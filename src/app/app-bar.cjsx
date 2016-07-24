React = require('react')
AppBar = require('material-ui/AppBar').default
IconButton = require('material-ui/IconButton').default
IconMenu = require('material-ui/IconMenu').default
MenuItem = require('material-ui/MenuItem').default
MoreVertIcon = require('material-ui/svg-icons/navigation/more-vert').default

SettingsDialog = require('./dialog/SettingsDialog')
AboutDialog = require('./dialog/AboutDialog')

module.exports = React.createClass
  getInitialState: ->
    settingsOpen: false
    aboutOpen: false

  onSettings: ->
    @setState settingsOpen: true

  onAbout: ->
    @setState aboutOpen: true

  render: ->
    iconElementRight =
      <IconMenu iconButtonElement={<IconButton><MoreVertIcon /></IconButton>}
                targetOrigin={{horizontal: 'right', vertical: 'top'}}
                anchorOrigin={{horizontal: 'right', vertical: 'top'}}>
        <MenuItem primaryText='Settings' onTouchTap={@onSettings} />
        <MenuItem primaryText='About' onTouchTap={@onAbout} />
      </IconMenu>
    <div>
      <AppBar title="PokeGo Hub - #{@props.location}"
              iconElementRight={iconElementRight}/>
      <SettingsDialog open={@state.settingsOpen} save={@props.saveSettings}
                      settings={@props.settings} close={=> @setState settingsOpen: false} />
      <AboutDialog open={@state.aboutOpen} close={=> @setState aboutOpen: false} />
    </div>
