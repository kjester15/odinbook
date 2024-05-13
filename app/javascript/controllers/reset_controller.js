import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["comment"]
  static classes = []
  
  connect() {
    console.log("Hello World!")
  }

  reset() {
    this.commentTarget.reset()
   }
}