const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);                           //テスト用公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) =>{
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {                                                            //入力されたカード情報を変数に代入
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;                                            //レスポンスのHTTPステータスコードが正常(200)なら
        const renderDom = document.getElementById("charge-form");             //生成されたトークンを変数に代入する
        const tokenObj = `<input value=${token} type="hidden" name='token'>`; //隠し要素としてトークンの入った１行フォームを差し込み送信
        renderDom.insertAdjacentHTML("beforeend", tokenObj);                  //隠し要素の差込先→'beforeend'←element 内部の最後の子要素の後に挿入
      }
        document.getElementById("card-number").removeAttribute("name");       //以下４行は、入力された各カード情報がパラメータとして
        document.getElementById("card-cvc").removeAttribute("name");          //送信されないようにname要素を削除している
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();                      //フォームに入力された情報をサーバー側に送信
        document.getElementById("charge-form").reset();                       //入力したものを空にする
    });
  });
};

window.addEventListener("load", pay);