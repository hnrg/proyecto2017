$('#user_edit_form').validate({
  rules: {
    username: "required",
    email: {
      required: true,
      email: true
    },
    password: "required"
  },
  messages: {
    username: "Por favor, especifique nombre de usuario.",
    email: {
      required: "Por favor, especifique email.",
      email: "Su dirección de correo electrónico debe tener el formato de name@domain.com"
    },
    password: "Por favor, especifique contraseña."
  },
  errorPlacement: function(error, input) {
    $("#user_edit_response").html(`
          <div class="alert alert-info alert-dismissible fade show" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <p><small><strong>${error.html()}</strong></small></p>
          </div>
        `);
  },
  submitHandler: function(form) {
    form.submit();
  }
});
