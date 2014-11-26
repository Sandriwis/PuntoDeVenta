using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        Categoria categoria = new Categoria();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            // validar si hay datos en el formulario
            if (txtNombre.Text.Trim().Length < 1)
            {
                Response.Write("<script>alert('Falta nombre');</script>");
                txtNombre.Focus();
                return;
            }

            // traspaso de valores del form al objeto
            categoria.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                categoria.Id = Int32.Parse(txtId.Value);

            categoria.Nombre = txtNombre.Text;
            categoria.Activo = chkActivo.Checked;

            // validar si ya esta en la bdd

            if (categoria.existe())
            {
                Response.Write("<script>alert('Ya esta en la BDD');</script>");
                txtNombre.Focus();
                return;
            }
            // grabar datos
            int res = categoria.grabar();

            // si hay error avisa al usuario
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "";
            txtNombre.Text = "";
            chkActivo.Checked = false;
            categoria.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }
        
        protected void btnListar_Click(object sender, EventArgs e)
        {
            categoria.Nombre = txtNombre.Text;
            Grilla.DataSource = categoria.listar();
            Grilla.DataBind();
        }

        protected void grilla_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onclick", "Read_Data('" + e.Row.RowIndex + "')");
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMenuPrincipal");
        }
    }
}