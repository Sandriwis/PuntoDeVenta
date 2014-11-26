using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Marca marca = new Marca();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            // validar datos: si fueron escritos en el formulario.
            if (txtNombre.Text.Trim().Length < 1)
            {
                Response.Redirect("<script>alert('falta nombre');</script>");
                return;
            }

            marca.Nombre = txtNombre.Text.Trim().ToUpper();
            marca.Activo = chkActivo.Checked;

            marca.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                marca.Id = Int32.Parse(txtId.Value);

            // validar en la Bdd si ya se encuentra la marca
            if (marca.existe())
            {
                Response.Write("<script>alert('Ya está registrado');</script>");
                txtNombre.Focus();
                return;
            }
            
            //ejecución del método grabar
            int res = marca.grabar();
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "0";
            txtNombre.Text = "";
            chkActivo.Checked = false;
            marca.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            marca.Nombre = txtNombre.Text;
            Grilla.DataSource = marca.listar();
            Grilla.DataBind();
        }

        protected void Grilla_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Attributes.Add("onclick", "Read_Data('" + e.Row.RowIndex + "')");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMenuPrincipal");
        }
     
    }
}