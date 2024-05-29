import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "follower", "following"]
  static classes = ["primary", "hide"]
  
  connect() {
    this.followingTarget.classList.add(this.hideClass)
    this.buttonTarget.classList.add(this.primaryClass)
  }

  follower() {
    if (this.followerTarget.classList.contains("hide") ) {
      this.followerTarget.classList.toggle(this.hideClass)
      this.followingTarget.classList.toggle(this.hideClass)
      this.buttonTargets.forEach( (element) => element.classList.toggle(this.primaryClass) )
    }
  }

  following() {
    if (this.followingTarget.classList.contains("hide") ) {
      this.followingTarget.classList.toggle(this.hideClass)
      this.followerTarget.classList.toggle(this.hideClass)
      this.buttonTargets.forEach( (element) => element.classList.toggle(this.primaryClass) )
    }
  }
}