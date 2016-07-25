React = require('react')
{ GoogleMapLoader, GoogleMap, Marker, SearchBox, Circle,
  InfoWindow } = require('react-google-maps')
CustomControl = require('./custom-control')
FloatingActionButton = require('material-ui/FloatingActionButton').default
ActionHome = require('material-ui/svg-icons/action/home').default
Snackbar = require('material-ui/Snackbar').default

geolocation = navigator.geolocation or {
  getCurrentPosition: (success, failure) ->
    failure("Your browser doesn't support geolocation.")
}

# turns out the find location button is not actually a default control type
# credit to this wonderful jsfiddle: https://jsfiddle.net/mi3afzal/ogsvzacz/2/
findLocationBtnStyle =
  backgroundColor: '#fff'
  border: 'none'
  outline: 'none'
  width: '28px'
  height: '28px'
  borderRadius: '2px'
  boxShadow: '0 1px 4px rgba(0,0,0,0.3)'
  cursor: 'pointer'
  marginRight: '10px'
  padding: '0px'

findLocationDivStyle =
  margin: '5px'
  width: '18px'
  height: '18px'
  backgroundImage: 'url(https://maps.gstatic.com/tactile/mylocation/mylocation-sprite-1x.png)'
  backgroundSize: '180px 18px'
  backgroundPosition: '0px 0px'
  backgroundRepeat: 'no-repeat'

module.exports = React.createClass
  getInitialState: ->
    center: @props.center
    status: null
    centerGeolocation: false # if the center is at the user's geolocation
    findLocationBtnStyle: findLocationBtnStyle
    snackOpen: false

  centerOnLocation: (success) ->
    geolocation.getCurrentPosition (pos) =>
      {lat, lng} = pos.coords
      @setState
        center:
          {lat, lng}
        status: 'Location found using HTML5'
      success()
    , =>
      (reason) =>
        @setState
          status: "Error: the geolocation service failed (#{reason})"

  onCenterBtnClick: ->
    @centerOnLocation =>
      @setState
        findLocationBtnStyle:
          backgroundPosition: '-18px 0px'
        snackOpen: true

  render: ->
    <GoogleMapLoader containerElement={<div style={{height: '100%'}} />}
                     googleMapElement={
                       <GoogleMap defaultZoom={@props.zoom}
                                  defaultCenter={@state.center}
                                  onClick={@onClick}>
                         <CustomControl controlPosition={google.maps.ControlPosition.RIGHT_BOTTOM}>
                           <FloatingActionButton onTouchTap={-> console.log 'yo'}><ActionHome /></FloatingActionButton>
                         </CustomControl>
                         <CustomControl controlPosition={google.maps.ControlPosition.RIGHT_BOTTOM}>
                           <button style={findLocationBtnStyle} title='Your Location'
                                   onClick={@onCenterBtnClick}>
                             <div style={findLocationDivStyle} />
                           </button>
                         </CustomControl>
                         <CustomControl controlPosition={google.maps.ControlPosition.BOTTOM_CENTER}>
                           <Snackbar open={@state.snackOpen} message='Hi there'
                                     onRequestClose={=> @setState snackOpen: false} />
                         </CustomControl>
                       </GoogleMap>
                     }/>
