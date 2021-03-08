const hidePatientForm = () => {
  const formChoose = document.getElementById('create-patient');
  const formAdd = document.getElementById('link-new-patient');
  if (formChoose) {
    formChoose.style.display = 'none';
  }
  if (formAdd) {
    formAdd.style.display = 'none';
  }
};

export { hidePatientForm };
