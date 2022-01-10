import { Application } from "@hotwired/stimulus"
import '../js/bootstrap_js_files.js'  

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
