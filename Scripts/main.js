//Login and Register Modal
const login = document.getElementById("login");
const register = document.getElementById("register");

const func_login_modal = () => {
  register.classList.remove("show-modal");
  login.classList.add("show-modal");
};
const func_register_modal = () => {
  login.classList.remove("show-modal");
  register.classList.add("show-modal");
};
const func_close_modal = () => {
  login.classList.remove("show-modal");
  register.classList.remove("show-modal");
};
// Dropdown Function
const dropdown = document.querySelector(".dropdown");
const func_open_dropdown = () => {
  dropdown.classList.add("show");
};
const func_close_dropdown = () => {
  dropdown.classList.remove("show");
};
// Edit Field
var field;
var attr;
var edit_button;
var cancel_button;
var current_value;
var bordertemp;
const edit = (attr, edit_btn) => {
  field = document.querySelector(`#edit-${attr}`);
  cancel_button = document.getElementById(attr);
  edit_button = edit_btn;

  edit_button.value = "Kaydet";
  edit_button.classList.remove("btn-muted-outline");
  edit_button.classList.add("btn-green-outline");
  field.readOnly = false;
  bordertemp = field.style.borderColor;
  field.style.cursor = "auto";
  field.style.borderColor = "#d1d1d1";
  field.focus();

  cancel_button.classList.remove("hide");

  current_value = document.getElementById(`current_${attr}`).value;
  if (field.value !== current_value) {
    document.getElementById(`new_${attr}`).value = field.value;
    return true;
  } else {
    return false;
  }
};
const cancel = () => {
  field.readOnly = true;
  field.style.cursor = "context-menu";
  field.style.borderColor = bordertemp;
  cancel_button.classList.add("hide");

  edit_button.value = "Düzenle";
  edit_button.classList.remove("btn-green-outline");
  edit_button.classList.add("btn-muted-outline");

  if (field.value !== current_value) {
    field.value = current_value;
  }
};
// Post Actions - Profile Page
const postActions = (btn) => {
  const actions = btn.nextElementSibling;
  const overlay = document.querySelector(".overlay");
  actions.classList.add("show");
  overlay.classList.add("show");
};
const closeActions = () => {
  const actions = document.querySelector(".post-meta-actions.show");
  const overlay = document.querySelector(".overlay");
  actions.classList.remove("show");
  overlay.classList.remove("show");
};
// Delete Post
const showModal = () => {
  document.querySelector(".story-modal").classList.remove("hide");
  return false
};
function delete_post(id) {
  document.getElementById("id").value = parseInt(id);
}
// Disable Keypress Submit
document.addEventListener("keydown", (e) => {
  if (e.keyCode === 13) {
    e.preventDefault();
    return false;
  }
});
