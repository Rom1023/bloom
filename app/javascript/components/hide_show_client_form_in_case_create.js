const hideShowForm = (triger) => {
  const formChoose = document.getElementById('create-patient');
  const formAdd = document.getElementById('link-new-patient');
  triger.addEventListener("input", (event) => {
    console.log(input);
    if (input.value === 1) {
      formChoose.style.display = 'block';
      formAdd.style.display = 'none';
    } if (input.value === 0) {
      formChoose.style.display = 'none';
      formAdd.style.display = 'block';
    };
  });

};

const formTrigger = () => {
  const choose = document.getElementById('chooseExist');
  const add = document.getElementById('createNew');

  hideShowForm(choose);
  hideShowForm(add);
};

export { formTrigger };
