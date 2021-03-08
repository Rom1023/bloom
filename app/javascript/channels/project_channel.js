import consumer from "./consumer";

const initProjectCable = () => {
  const commentsContainer = document.getElementById('comments');
  // console.log(commentsContainer)
  if (commentsContainer) {
    const id = commentsContainer.dataset.projectId;

    consumer.subscriptions.create({ channel: "ProjectChannel", id: id }, {
      received(data) {
        // console.log(data);
        commentsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initProjectCable };
