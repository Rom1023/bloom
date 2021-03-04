const hideShowForm = (triger) => {
  triger.addEventListener("input", (event) => {

  });

};

const formTrigger = () => {
  console.log("yes");
  const choose = document.getElementById('chooseExist');
  const add = document.getElementById('createNew');

  hideShowForm(choose);
  hideShowForm(add);
};

export { formTrigger };
