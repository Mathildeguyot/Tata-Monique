const timelineSubtasks = () => {
  const timelines = document.querySelectorAll('.subtask-timeline');
  timelines.forEach((timeline) => {
    const percent = `${timeline.dataset.percent}%`;
    timeline.style.width = percent;
  });

}


export {timelineSubtasks};
