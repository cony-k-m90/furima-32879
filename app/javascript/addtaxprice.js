function itemPrice() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const itemPrice = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const calcVal = 0.1 * itemPrice.value
      addTaxPrice.innerHTML = `${calcVal}`;
  });
}
window.addEventListener("load", itemPrice);