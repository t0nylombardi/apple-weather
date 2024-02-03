import { Controller } from '@hotwired/stimulus'

// Connects to data-controller='address'
export default class extends Controller {
  static targets = [
    'input',
    'postal_code',
  ]

  connect() {}

  initGoogleMaps() {
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      componentRestrictions: { country: ['us', 'ca'] },

      types: ['address'],
    });

    this.autocomplete.addListener('place_changed', this.placeSelected.bind(this));
  }

  placeSelected() {
    const place = this.autocomplete.getPlace();
    this.postal_codeTarget.value = this.getAddressComponent(place, 'postal_code');
  }

  getAddressComponent(place, component) {
    for (let i = 0; i < place.address_components.length; i++) {
      const addressType = place.address_components[i].types[0];
      if (addressType === component) {
        return place.address_components[i].long_name;
      }
    }
    return '';
  }
}
