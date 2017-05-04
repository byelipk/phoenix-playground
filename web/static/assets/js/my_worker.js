for (var i = 0; i < 10; i++) {
  postMessage(
    `This is a Web Worker: ${i} and ` +
    `I'm located in static/assets/js`
  );
}

postMessage(0);
