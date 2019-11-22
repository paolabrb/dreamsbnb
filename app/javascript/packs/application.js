import "bootstrap";
import "../plugins/flatpickr"




  const editButton = document.querySelector('.edit-button');
  const editForm = document.querySelector('.edit-form');

  editButton.addEventListener('click', (e) => {
     editForm.style.visibility = 'initial';
  })


