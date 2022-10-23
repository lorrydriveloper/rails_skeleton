import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  // static targets = [ 'test' ]

  connect() {
    this.element.innerHTML += '<div>blass</div>'
    console.log(this.element)
  }
}
