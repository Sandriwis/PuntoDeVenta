using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class frmProveedor : System.Web.UI.Page
    {

        Proveedor proveedor = new Proveedor();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            // validar datos: si fueron escritos en el formulario.
            if (txtRazonSocial.Text.Trim().Length < 1)
            {
                Response.Redirect("<script>alert('falta Razon Social');</script>");
                return;
            }
            proveedor.Rut = Int32.Parse(txtRut.Text.Trim());
            proveedor.Digito = Char.Parse(txtDv.Text.Trim().ToUpper()) ;
            proveedor.Razonsocial = txtRazonSocial.Text;
            proveedor.Nombre = txtNombre.Text.Trim().ToUpper();
            proveedor.Fono1 = (txtFono1.Text.Trim());
            proveedor.Fono2 = txtFono2.Text.Trim();
            proveedor.Email = txtEmail.Text.Trim();
            proveedor.Activo = chkActivo.Checked;


            proveedor.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                proveedor.Id = Int32.Parse(txtId.Value);



            // validar en la Bdd si ya se encuentra la marca
            if (proveedor.existe())
            {
                Response.Write("<script>alert('Ya está registrado');</script>");
                txtRazonSocial.Focus();
                return;
            }

            //ejecución del método grabar
            int res = proveedor.grabar();
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "0";
            txtRut.Text = "";
            txtDv.Text = "";
            txtRazonSocial.Text = "";
            txtNombre.Text = "";
            txtFono1.Text = "";
            txtFono2.Text = "";
            txtEmail.Text = "";
            chkActivo.Checked = false;
            
            proveedor.limpiar();

            txtRut.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            proveedor.Razonsocial = txtRazonSocial.Text;
            Grilla.DataSource = proveedor.listar();
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