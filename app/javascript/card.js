const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault(); 

    const tokenInput = form.querySelector('input[name="token"]');
    if (tokenInput) {
      form.removeChild(tokenInput);
    }

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        console.error('Token creation error:', response.error);
      } else {
        const token = response.id;
        const hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'token');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);
      }
      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);