function priceContent() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const resultAddTaxPrice = Math.floor(0.1 * itemPrice.value);
    const resultProfit = Math.ceil(0.9 * itemPrice.value);
    addTaxPrice.innerHTML = Number(resultAddTaxPrice).toLocaleString();
    profit.innerHTML = Number(resultProfit).toLocaleString();
  });
}
setInterval(priceContent, 1000);