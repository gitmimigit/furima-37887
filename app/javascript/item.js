function commission() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener('input', function(){
    addTaxPrice.innerHTML =Math.floor(itemPrice.value * 0.1).toLocaleString()
    profit.innerHTML =Math.ceil(itemPrice.value * 0.9).toLocaleString()
  })
};

window.addEventListener('load', commission);