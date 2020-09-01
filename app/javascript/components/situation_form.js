const situationForm = () => {
  const situationForm = document.querySelector('.situation-form');
  document.addEventListener('click', (event) => {
    console.log(event);
    if (event.target.matches("#go")) {
      console.log("#go");
      situationForm.classList.remove("invisible");
    }

  });
};

export { situationForm };
