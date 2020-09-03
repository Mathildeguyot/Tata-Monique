const disableEnter = () => {
  const form = document.querySelector('.new-change-form')
  form.addEventListener('keypress', (event) => {
    console.log(event);
    if (event.which == '13') {
      event.preventDefault();
    }
  });
}

export { disableEnter };
