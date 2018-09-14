import { Controller } from "stimulus";


export default class extends Controller {
  static targets = ["carousel", "item"];

  connect() {
    $(this.carouselTarget).on('click', 'img', function () {
      window.open(this.src, '_blank');
    });

    $(this.itemTargets).each(function(){
      var next = $(this).next();
      if (!next.length) {
        next = $(this).siblings(':first');
      }
      next.children(':first-child').clone().appendTo($(this));

      for (var i=0;i<2;i++) {
        next=next.next();
        if (!next.length) {
          next = $(this).siblings(':first');
        }

        next.children(':first-child').clone().appendTo($(this));
      }
    });
  }
}