// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";

import moment from 'moment';

export default class extends Controller {
  static targets = ["input"];

  connect() {
    $(this.inputTarget).daterangepicker({
        startDate: moment().startOf('day'),
        endDate: moment().startOf('day').add(1, 'week'),
        minYear: new Date().getFullYear(),
        opens: 'left',
        autoApply: true,
      locale: {
          format: 'DD/MM/YYYY'
      }
    }
    )
  }
}
