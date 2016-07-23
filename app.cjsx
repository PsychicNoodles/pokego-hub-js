{GoogleMapLoader, GoogleMap, Marker} = require('react-google-maps')
React = require('react')
ReactDOM = require('react-dom')

GreetBox = React.createClass
  displayName: 'GreetBox'

  render: ->
    <div>
      <h1 key='header'>{@props.children}</h1>
    </div>

element = React.createElement(GreetBox, name: "World", "Lorem ipsum")
ReactDOM.render(element, document.getElementById 'app')
