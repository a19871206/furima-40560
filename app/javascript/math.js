 const math = () => {
  console.log("OK");
  const priceInput = document.getElementById('item-price');
  const taxPriceDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    const price = priceInput.value.trim();
    const priceValue = parseInt(price);

    // 販売手数料 (10%)
    const tax = Math.floor(priceValue * 0.1);
    taxPriceDisplay.innerHTML = tax;

    // 販売利益
    const profit = priceValue - tax;
    profitDisplay.innerHTML = profit;
  });
};

window.addEventListener('turbo:load', math);