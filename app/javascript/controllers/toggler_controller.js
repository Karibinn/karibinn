import { Controller } from "stimulus";


export default class extends Controller {
  static targets = ["container", "button"];

  toggle() {
    let $target = $(this.containerTarget);
    let $displayed = $target.find('.d-block');
    let $hidden = $target.find('.d-none');

    $(this.buttonTarget).addClass('d-none');

    $hidden.addClass('d-block').removeClass('d-none');
    $displayed.addClass('d-none').removeClass('d-block');
  }
}
