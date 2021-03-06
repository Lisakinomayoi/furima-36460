const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const sumbit = document.getElementById("button");
  sumbit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("order_sending_information[number]"),
      cvc: formData.get("order_sending_information[cvc]"),
      exp_month: formData.get("order_sending_information[exp_month]"),
      exp_year: `20${formData.get("order_sending_information[exp_year]")}`,
    };


    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

       document.getElementById("card-number").removeAttribute("name");
       document.getElementById("card-cvc").removeAttribute("name");
       document.getElementById("card-exp-month").removeAttribute("name");
       document.getElementById("card-exp-year").removeAttribute("name");

       document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);