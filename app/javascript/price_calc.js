function price(){
  const itemPrice = document.getElementById("item-price");           //出品商品の値段(入力フォームの要素)

  itemPrice.addEventListener("input", () => {
    const formValue = itemPrice.value                                //入力フォーム内の値を取得
    const priceTax = formValue * 0.1                                 //手数料の算出
    const priceProfit = formValue - priceTax                         //販売利益
    const priceOutput1 = document.getElementById("add-tax-price");   //手数料の文字部分
    const priceOutput2 = document.getElementById("profit");          //販売利益の文字部分
    priceOutput1.textContent = priceTax
    priceOutput2.textContent = priceProfit
  });
};

window.addEventListener('load', price);