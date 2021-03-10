// case/new/page: show different patient form based on user option
const hideShowForm = (triger) => {
  const formChoose = document.getElementById('create-patient');
  const formAdd = document.getElementById('link-new-patient');
  if (triger) {
    triger.addEventListener("input", (event) => {
      if (triger.value === '1') {
        formChoose.style.display = 'block';
        formAdd.style.display = 'none';
      } if (triger.value === '0') {
        formChoose.style.display = 'none';
        formAdd.style.display = 'block';
      };
    });
  }
};

const formTrigger = () => {
  const choose = document.getElementById('chooseExist');
  const add = document.getElementById('createNew');
  if (choose && add) {
    hideShowForm(choose);
    hideShowForm(add);
  }
};

export { formTrigger };
