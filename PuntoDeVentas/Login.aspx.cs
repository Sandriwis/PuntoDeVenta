using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PuntoDeVentas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Login login = new Login();
            if (login == null)
            {
                this.txtCorreo.Text = "Usuario o Contraseña Incorrecto.";
            }
            else
            {
                Session["NombreUsuario"] = login.txtCorreo;
                Session["IDUsuario"] = login.txtPassword;
                Response.Redirect("/FrmMenu.aspx");
            }
        }
    }
}