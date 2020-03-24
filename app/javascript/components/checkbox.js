const checkBox = () => {
  const box = document.getElementById('cbtest');
  box.addEventListener('click', (event) => {
    const check = document.getElementById('check_in_completed');
    check.checked = check.checked ? false : true;
    console.log(check.checked);
  })
}

export { checkBox }

// ERROR: THIS SHOULD BE IMPORTED ONLY ON PAGES WITH CHECKBOX!
