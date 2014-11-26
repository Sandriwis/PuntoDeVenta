using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class Formulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cmbMarca.DataTextField = "NOMBRE";
            cmbMarca.DataValueField = "ID";
            cmbMarca.DataSource = new Marca().llenarComboBox();
            cmbMarca.DataBind();
        }
    }
}