import { Controller } from "stimulus";

import moment from "moment";

const DATE_FORMAT = 'DD-MM-YYYY';

export default class extends Controller {
  static targets = ["input"];

  connect() {
    let target = this.inputTarget;
    let params = {
      minYear: new Date().getFullYear(),
      opens: target.getAttribute('data-opens') || "left",
      locale: {
        format: DATE_FORMAT,
        cancelLabel: "Clear"
      }
    };

    if (!!target.getAttribute("data-auto-apply")) {
      params.autoUpdateInput = false;
      $(target).daterangepicker(params);

      $(target).on("apply.daterangepicker", function (ev, picker) {
        $(this).val(picker.startDate.format(DATE_FORMAT) + " - " + picker.endDate.format(DATE_FORMAT));
      });

      $(target).on("cancel.daterangepicker", function (ev, picker) {
        $(this).val("");
      });
    } else {
      params.startDate = moment().startOf("day");
      params.endDate = moment().startOf("day").add(1, "week");
      $(target).daterangepicker(params);
    }
  }
}
