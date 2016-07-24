React = require('react')
Dialog = require('material-ui/Dialog').default
FlatButton = require('material-ui/FlatButton').default
Checkbox = require('material-ui/Checkbox').default
Subheader = require('material-ui/Subheader').default

module.exports = React.createClass
  getInitialState: ->
    temp:
      pokemon: @props.settings.pokemon

  save: ->
    @props.save(@state.temp)
    @props.close()

  discard: ->
    @setState @getInitialState()
    @props.close()

  render: ->
    actions = [
      <FlatButton label='Cancel' onTouchTap={@discard} />,
      <FlatButton label='Save' primary={true} onTouchTap={@save} />
    ]
    <Dialog title='Settings' open={@props.open} actions={actions}
            onRequestClose={@discard}>
      <Subheader>Enabled Map objects</Subheader>
      <Checkbox label='Pokemon' checked={@state.temp.pokemon}
                onCheck={(_, checked) => @setState temp: pokemon: !checked}/>
    </Dialog>
