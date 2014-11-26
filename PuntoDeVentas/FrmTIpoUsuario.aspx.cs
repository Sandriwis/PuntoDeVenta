using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        TipoUsuario tu = new TipoUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "0";
            txtNombre.Text = "";
            chkActivo.Checked = false;
            tu.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            tu.Nombre = txtNombre.Text;
            Grilla.DataSource = tu.listar();
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

            tu.Nombre = txtNombre.Text.Trim().ToUpper();
            tu.Activo = chkActivo.Checked;

            tu.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                tu.Id = Int32.Parse(txtId.Value);

            // validar en la Bdd si ya se encuentra la marca
            if (tu.existe())
            {
                Response.Write("<script>alert('Ya está registrado');</script>");
                txtNombre.Focus();
                return;
            }

            //ejecución del método grabar
            int res = tu.grabar();
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