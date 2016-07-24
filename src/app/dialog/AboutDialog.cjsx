React = require('react')
Dialog = require('material-ui/Dialog').default
FlatButton = require('material-ui/FlatButton').default

module.exports = React.createClass
  close: -> @props.close()

  render: ->
    <Dialog title='About' open={@props.open} onRequestClose={@close}>
      To be implemented
    </Dialog>
