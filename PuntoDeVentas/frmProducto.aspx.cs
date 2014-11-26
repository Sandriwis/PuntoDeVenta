using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class frmProducto : System.Web.UI.Page
    {
        Producto producto = new Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                comboMarca.DataTextField = "NOMBRE";
                comboMarca.DataValueField = "ID";
                comboMarca.DataSource = new Marca().llenarComboBox().Tables[0].DefaultView;
                comboMarca.DataBind();

                comboCategoria.DataTextField = "NOMBRE";
                comboCategoria.DataValueField = "ID";
                comboCategoria.DataSource = new Categoria().llenarComboBox();
                comboCategoria.DataBind();

                ListItem i = new ListItem("seleccionar", "-1");
                comboCategoria.Items.Add(i);
                comboMarca.Items.Add(i);
                comboMarca.SelectedIndex = comboMarca.Items.IndexOf(comboMarca.Items.FindByValue("-1"));
                comboCategoria.SelectedIndex = comboCategoria.Items.IndexOf(comboCategoria.Items.FindByValue("-1"));
            }
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            // validar datos: si fueron escritos en el formulario.
            if (txtCodigoBarra.Text.Trim().Length < 1)
            {
                Response.Redirect("<script>alert('falta Codigo barra');</script>");
                return;
            }

            producto.IdMarca = Int32.Parse(comboMarca.SelectedItem.Value);
            producto.IdCategoria = Int32.Parse(comboCategoria.SelectedItem.Value);
            producto.CodigoBarra = Int32.Parse(txtCodigoBarra.Text.Trim());
            producto.Nombre = txtNombre.Text.Trim().ToUpper();
            producto.Descripcion = txtDescripcion.Text.ToUpper();
            producto.PrecioVenta = Decimal.Parse(txtPrecioVenta.Text);
            producto.PrecioCosto = Decimal.Parse(txtPrecioCosto.Text);
            producto.Stock = Decimal.Parse(txtStock.Text);
            producto.Execto = chkExecto.Checked;
            producto.Habilitado = chkHabilitado.Checked;

           
            producto.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                producto.Id = Int32.Parse(txtId.Value);
            

            // validar en la Bdd si ya se encuentra la marca
            if (producto.existe())
            {
                Response.Write("<script>alert('Ya está registrado');</script>");
                txtCodigoBarra.Focus();
                return;
            }

            //ejecución del método grabar
            int res = producto.grabar();
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            comboMarca.SelectedIndex = comboMarca.Items.IndexOf(comboMarca.Items.FindByValue("-1"));
            comboCategoria.SelectedIndex = comboCategoria.Items.IndexOf(comboCategoria.Items.FindByValue("-1"));
            txtId.Value = "0";

            txtCodigoBarra.Text = "";
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtPrecioVenta.Text = "";
            txtPrecioCosto.Text = "";
            txtStock.Text = "";
            chkExecto.Checked = false;
            chkHabilitado.Checked = false;

            producto.limpiar();

            txtCodigoBarra.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            producto.CodigoBarra = Int32.Parse("0" + txtCodigoBarra.Text);
            Grilla.DataSource = producto.listar();
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