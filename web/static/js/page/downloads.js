export var Page = {
  run: function() {
    console.log("HELLO PDF PAGE! fuck");
    let w = new Worker("js/my_worker.js");

    w.onmessage = function cb(event) {
      if (event.data === 0) {
        console.log("Shutting down Web Worker");
        w.terminate();
      } else {
        console.log(event.data);
      }
    }
  }
}
