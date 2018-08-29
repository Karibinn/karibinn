import { Controller } from "stimulus"
const Dropzone = require('dropzone');

Dropzone.autoDiscover = false;

export default class extends Controller {
  static targets = ["form"];

  initialize() {
    this.attachHandlers();
  }

  attachHandlers() {
    this.formTarget.classList.add('dropzone');
    const dropzone = new Dropzone(this.formTarget, {
      maxFiles: 30,
      acceptedFiles: 'image/*',
      maxFilesize: 2
    });

    // TODO:
    // - add this only after upload is completed
    // - fetch ID from the server
    // - use the ID to upload the description
    // - on enter or focusout, send the request and show the status
    // dropzone.on("addedfile", function(file) {
    //   const caption = file.caption == undefined ? "" : file.caption;
    //   let descriptionLabel = Dropzone.createElement("<bold>Description</bold>");
    //   let descriptionInput =
    //     Dropzone.createElement("<textarea class='dropzone__description form-control' placeholder='Write the image description here!' type='text' name='description'>"+caption+"</textarea>");
    //
    //   descriptionInput.addEventListener('blur', function() {
    //     console.log('blur');
    //     var filename = $(this).attr('id');
    //     var caption = $(this).attr('value');
    //     return $.post("/images/" + filename + "/save_caption?caption=" + caption);
    //   });
    //
    //   file.previewElement.appendChild(descriptionLabel);
    //   file.previewElement.appendChild(descriptionInput);
    // });
  }
}
