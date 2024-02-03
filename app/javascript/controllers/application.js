import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

window.initMap = () => {
  const event = new Event('load-map', {
      bubbles: true,
      cancelable: true,
    })
  window.dispatchEvent(event);
}

export { application }
