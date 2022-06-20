// TODO: React to a click on the button!

const moveIndicatorPrice = (id) => {
  let dragValue;

  const priceIndicator = document.getElementById("price-indicator");
  priceIndicator.style.position = "absolute";
  priceIndicator.ontouchmove = function() {
    dragValue = priceIndicator;
  }

  document.ontouchmove = function(e) {
    const x = e.pageX;
    const y = e.pageY;

    dragValue.style.left = x + "px";
    dragValue.style.top = y + "px";
  }

  document.ontouchend = function(e) {
    dragValue = null
  }
}




export { moveIndicatorPrice };
