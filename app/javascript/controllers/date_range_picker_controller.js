// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";

import moment from "moment";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    let target = this.inputTarget;
    let params = {
      startDate: moment().startOf("day"),
      endDate: moment().startOf("day").add(1, "week"),
      minYear: new Date().getFullYear(),
      opens: target.getAttribute('data-opens') || "left",
      // autoApply: true,
      locale: {
        format: "DD/MM/YYYY",
        cancelLabel: "Clear"
      }
    };

    if (!!target.getAttribute("data-auto-apply")) {
      params.autoUpdateInput = false;
      $(target).daterangepicker(params);

      $(target).on("apply.daterangepicker", function (ev, picker) {
        $(this).val(picker.startDate.format("MM/DD/YYYY") + " - " + picker.endDate.format("MM/DD/YYYY"));
      });

      $(target).on("cancel.daterangepicker", function (ev, picker) {
        $(this).val("");
      });
    } else {
      $(target).daterangepicker(params);
    }
  }
}
