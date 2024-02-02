import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

window.initAutocomplete = () => {
  const event = new Event("map-loaded", {"bubbles":true, "cancelable":true})
  event.Event = "map-loaded"
  window.dispatchEvent(event)
}

export { application }
