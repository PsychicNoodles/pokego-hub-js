React = require('react')
{ GoogleMapLoader, GoogleMap, Marker, SearchBox, Circle,
  InfoWindow } = require('react-google-maps')

module.exports = React.createClass
  geolocation: navigator.geolocation or {
    getCurrentPosition: (success, failure) ->
      failure("Your browser doesn't support geolocation.")
  }

  onClick: ->
    console.log "click"

  render: ->
    <GoogleMapLoader containerElement={<div style={{height: '100%'}} />}
                     googleMapElement={
                       <GoogleMap ref={(map) -> console.log map} defaultZoom={3}
                                  defaultCenter={{lat: -25.363882, lng: 131.044922}}
                                  onClick={@onClick}>
                       </GoogleMap>
                     }/>
