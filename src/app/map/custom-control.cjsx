React = require('react')

module.exports = React.createClass
  addToMap: (root) ->
    {mapHolderRef, controlPosition} = @props
    mapHolderRef.getMap().controls[controlPosition].push(root)

  render: ->
    <div ref={@addToMap}>{@props.children}</div>
