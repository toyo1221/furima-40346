document.addEventListener('DOMContentLoaded', item);

function item (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);  // 販売手数料

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = Math.floor(inputValue - inputValue * 0.1);  // 販売利益
  });
}

window.addEventListener('load', item);