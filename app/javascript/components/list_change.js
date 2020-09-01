import { fetchWithToken } from "../utils/fetch_with_token";

const listChange = () => {
  const cards = document.querySelectorAll('.owl-theme');

  cards.forEach((card) => {
    const plus = card.querySelector('.toggle-list-change');
    plus.addEventListener('click', (event) => {
      togglePlus(card, plus);
    });
  });
};

const togglePlus = (card, plus) => {
  const listChange = card.querySelector(`.list-change`);
  if (plus.classList.contains("active")) {
    plus.innerHTML = "<i class='fas fa-plus-circle plus'></i>";
    plus.classList.remove("active");
    listChange.innerHTML = "";
  } else {
    plus.innerHTML = "<i class='fas fa-minus-circle plus'></i>";
    plus.classList.add("active");
    const category = plus.dataset.category;
    fetchWithToken("/tasks/fetch_tasks", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ category: category })
      })
      .then(response => response.json())
      .then((data) => {
        listChange.innerHTML = data.html;
      });
  }
}



export { listChange };
