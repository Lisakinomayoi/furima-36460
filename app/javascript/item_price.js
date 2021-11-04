window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = inputValue * 0.1
    addTaxDom.innerHTML = `${fee}`;
    const salesProfit = inputValue - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit}`;
  })
});