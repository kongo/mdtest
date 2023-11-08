import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-checker"
export default class extends Controller {
  toggle() {
    event.target.closest("#" + event.target.dataset.target).requestSubmit();
  }
}
