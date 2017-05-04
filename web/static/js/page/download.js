import { PDFJS } from "pdfjs-dist";

export var Page = {
  run: function(path) {
    PDFJS.disableWorker = true;

    PDFJS.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';

    PDFJS.getDocument(path)
      .then((pdf) => {
        console.log(pdf);
      })
      .catch((reason) => {
        console.error(reason);
      });
  }
}
