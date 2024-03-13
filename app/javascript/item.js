function item (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1); 

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = Math.floor(inputValue - inputValue * 0.1);  
  });
}

window.addEventListener('turbo:load', item);
window.addEventListener('turbo:render', item);