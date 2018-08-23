/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//

import '../stylesheets/admin'

import 'jquery'
import 'popper.js'
import 'bootstrap'
import 'bootstrap-datepicker'

import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

Rails.start();
Turbolinks.start();

const application = Application.start();
const context = require.context("controllers/admin", true, /.js$/);
application.load(definitionsFromContext(context));
