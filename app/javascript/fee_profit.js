function calc (){
    const price = document.getElementById("item-price")
    price.addEventListener("input", () => {
        let tax = Number(price.value) * 0.1
        let fixedTax = tax.toFixed(0) 
        document.getElementById("add-tax-price").innerHTML = fixedTax
        document.getElementById("profit").innerHTML = Number(price.value) - fixedTax
    });
};

window.addEventListener('turbo:load', calc);