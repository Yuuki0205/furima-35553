window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const feeInput = document.getElementById("add-tax-price");
    
    feeInput.innerHTML = (Math.floor(inputValue * 0.1));
    const profitInput = document.getElementById("profit");

    profitInput.innerHTML = (Math.floor(inputValue * 0.9));
  })
});