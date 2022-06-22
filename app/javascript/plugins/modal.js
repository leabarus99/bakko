const articleModal = () => {
  const modalContainer = document.querySelector(".modal-container");
  const modalTriggers = document.querySelectorAll(".modal-trigger");

  modalTriggers.forEach(trigger => trigger.addEventListener("click", toggleModal))

  function toggleModal(){
    if (modalContainer) {
      modalContainer.classList.toggle("active")
    }
  }
}

export { articleModal };
