const pay = () => {
  Payjp.setPublicKey("pk_test_8f07637e82e9082fe148ca7c");
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
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_sending_information_number").removeAttribute("name");
      document.getElementById("order_sending_information_cvc").removeAttribute("name");
      document.getElementById("order_sending_information_exp_month").removeAttribute("name");
      document.getElementById("order_sending_information_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);