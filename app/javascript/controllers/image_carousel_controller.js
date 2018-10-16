import { Controller } from "stimulus";


export default class extends Controller {
  static targets = ["carousel", "item"];

  connect() {
    $(this.carouselTarget).on('click', '.carousel-item img', function () {
      window.location = this.src;
    });
  }
}
