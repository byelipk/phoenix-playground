import { PDFJS } from "pdfjs-dist";

export let Page = {
  run: function(path) {
    PDFJS.disableWorker = true;

    // PDFJS.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';
    PDFJS.workerSrc = '/js/pdf.worker.js';

    PDFJS.getDocument(path)
      .then((pdf) => {

        pdf.getPage(1).then((page) => {
          console.log("Page loaded!");

          let scale = 1.5;
          let viewport = page.getViewport(scale);

          // Prepare canvas using PDF page dimensions
          let canvas = document.getElementById('the-canvas');
          let context = canvas.getContext('2d');
          canvas.height = viewport.height;
          canvas.width = viewport.width;

          // Render PDF page into canvas context
          let renderContext = {
            canvasContext: context,
            viewport: viewport
          };
          let renderTask = page.render(renderContext);
          renderTask.then(function () {
            console.log('Page rendered');
          });
        });
      })
      .catch((reason) => {
        console.error(reason);
      });
  }
}
