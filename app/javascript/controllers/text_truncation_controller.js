import { Controller } from "stimulus";


export default class extends Controller {
  static targets = ["text", "more", "less"];

  connect() {
    let height = this.textTarget.clientHeight;

    this.hidden = false;

    if (height > 300) {
      this.toggle();
    } else {
      this.moreTarget.style.display = "none";
      this.lessTarget.style.display = "none";
    }
  }

  toggle() {
    this.hidden = !this.hidden;

    this.textTarget.classList.toggle('text-truncatable--truncated', this.hidden);
    this.lessTarget.classList.toggle('d-none', this.hidden);
    this.moreTarget.classList.toggle('d-none', !this.hidden);
  }
}
