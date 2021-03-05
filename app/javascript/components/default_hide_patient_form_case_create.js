const hidePatientForm = () => {
  const formChoose = document.getElementById('create-patient');
  const formAdd = document.getElementById('link-new-patient');
  formChoose.style.display = 'none';
  formAdd.style.display = 'none';
};

export { hidePatientForm };
