import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address"
export default class extends Controller {
  static targets = [ 'input' ]

  connect() {
    console.log('AddressController connected')
    // this.initGoogleMaps()
  }

  initGoogleMaps() {
    console.log('initGoogleMaps')
    // console.log(google)
    // new google.maps.places.Autocomplete(this.inputTarget)
  }
}
