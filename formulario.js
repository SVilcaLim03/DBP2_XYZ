$(document).ready(function()
{
    $('#login').click(function()
    {
        if($('#user').val()=="" || $('#password').val()=="")
        {
            alert("Debes llenar todos los campos para iniciar sesión");
            return false;
        }

        


    });
});



$(document).ready(function()
{
    $('#signup').click(function()
    {
        if($('#newUser').val()=="" || $('#newPassword').val()=="")
        {
            alert("Debes llenar todos los campos para registrarse");
            return false;
        }
    });
});