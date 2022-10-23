import { Application } from '@hotwired/stimulus'
import { registerControllers } from 'stimulus-vite-helpers'

const application = Application.start()

application.debug = false
window.Stimulus = application

const controllers = import.meta.globEager('./**/*_controller.js')
registerControllers(application, controllers)
