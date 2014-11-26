using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class MenuVentas : System.Web.UI.Page
    {
        Producto producto = new Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            producto.Nombre = txtNombre.Text;
            Grilla.DataSource = producto.listar();
            Grilla.DataBind();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "0";
            txtNombre.Text = "";
            producto.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMenu");
        }
              
        
    }
}