const toggleSubtasksPanel = () => {
  const cards = document.querySelectorAll('.owl-task');
  const subtasksPanel = document.querySelector('#subtasks-panel');

  cards.forEach((card) => {
    // console.log(arrow);
    const taskId = card.dataset.taskId;
    // console.log(taskId);
    const arrow = card.querySelector('#go');
    // console.log(arrow);
    arrow.addEventListener('click', (event) => {

      fetch(`/tasks/${taskId}/subtasks`, { headers: { accept: 'application/json' } })
        .then(response => response.json())
        .then((data) => {
          subtasksPanel.innerHTML = "";
          subtasksPanel.insertAdjacentHTML('beforeend', data.html);
        });

    });
  });
};

export { toggleSubtasksPanel };

