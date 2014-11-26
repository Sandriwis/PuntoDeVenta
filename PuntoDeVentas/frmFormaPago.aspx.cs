using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;
namespace PuntoDeVentas
{
    public partial class frmFormaPago : System.Web.UI.Page
    {

        FormaPago fp = new FormaPago(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "0";
            txtNombre.Text = "";
            chkActivo.Checked = false;
            fp.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            fp.Nombre = txtNombre.Text;
            Grilla.DataSource = fp.listar();
            Grilla.DataBind();
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            // validar datos: si fueron escritos en el formulario.
            if (txtNombre.Text.Trim().Length < 1)
            {
                Response.Redirect("<script>alert('falta nombre');</script>");
                return;
            }

            fp.Nombre = txtNombre.Text.Trim().ToUpper();
            fp.Habilitado = chkActivo.Checked;

            fp.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                fp.Id = Int32.Parse(txtId.Value);

            // validar en la Bdd si ya se encuentra la marca
            if (fp.existe())
            {
                Response.Write("<script>alert('Ya está registrado');</script>");
                txtNombre.Focus();
                return;
            }

            //ejecución del método grabar
            int res = fp.grabar();
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);
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