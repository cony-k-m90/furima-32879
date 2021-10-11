function profit() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemPrice = document.getElementById("item-price");
    const profit = document.getElementById("profit");
    const countVal = 0.9 * itemPrice.value;
    profit.innerHTML = `${countVal}`;
  });
}
window.addEventListener("load", profit);