<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmProducto.aspx.cs" Inherits="PuntoDeVentas.frmProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <script>
     function Read_Data(value) {
         var fila = parseInt(value) + 1;
         var grilla = document.getElementById('<%= Grilla.ClientID %>');

         var id = grilla.rows[fila].cells[0].textContent;
         var idmarca = grilla.rows[fila].cells[1].textContent;
         var idcategoria = grilla.rows[fila].cells[2].textContent;
         var codigobarra = grilla.rows[fila].cells[3].textContent;
         var nombre = grilla.rows[fila].cells[4].textContent;
         var descripcion = grilla.rows[fila].cells[5].textContent;
         var precioventa = grilla.rows[fila].cells[6].textContent;
         var preciocosto = grilla.rows[fila].cells[7].textContent;
         var stock = grilla.rows[fila].cells[8].textContent;
         var execto = grilla.rows[fila].cells[9].textContent;
         var habilitado = grilla.rows[fila].cells[10].textContent;


         document.getElementById('<%= txtId.ClientID %>').value = id;
         document.getElementById('<%= comboMarca.ClientID %>').value = idmarca;
         document.getElementById('<%= comboCategoria.ClientID %>').value = idcategoria;
         document.getElementById('<%= txtCodigoBarra.ClientID %>').value = codigobarra;
         document.getElementById('<%= txtNombre.ClientID %>').value = nombre;
         document.getElementById('<%= txtDescripcion.ClientID %>').value = descripcion;
         document.getElementById('<%= txtPrecioVenta.ClientID %>').value = precioventa;
         document.getElementById('<%= txtPrecioCosto.ClientID %>').value = preciocosto;
         document.getElementById('<%= txtStock.ClientID %>').value = stock;
         document.getElementById('<%= chkExecto.ClientID %>').checked = execto == "Si" ? true : false;
         document.getElementById('<%= chkHabilitado.ClientID %>').checked = habilitado == "Si" ? true : false;
     }    
    </script>
    <script runat="server">
        protected void Grilla_RowCreated(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
        }
    </script>

    <p>
        &nbsp;<table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    PRODUCTO</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:HiddenField ID="txtId" runat="server" Value="0" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Marca</td>
                <td>
                    <asp:DropDownList ID="comboMarca" runat="server" Height="16px" 
                        ValidationGroup="grabar" Width="130px">
                    </asp:DropDownList>
&nbsp;-
                &nbsp;
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="* Falta Marca" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="comboMarca"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Categoria</td>
                <td>
                    <asp:DropDownList ID="comboCategoria" runat="server" Height="16px" 
                        ValidationGroup="grabar" Width="130px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="* Falta Categoria" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="comboCategoria"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Codigo de barra</td>
                <td>
                    <asp:TextBox ID="txtCodigoBarra" runat="server" Width="130px" 
                        ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="* Falta codigobarra" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtCodigoBarra"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"  ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="* Falta Nombre" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Descripcion</td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="* FaltaDescripcion" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtDescripcion"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Precio venta</td>
                <td>
                    <asp:TextBox ID="txtPrecioVenta" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="* Falta Precio Venta" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtPrecioVenta"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Precio Costo</td>
                <td>
                    <asp:TextBox ID="txtPrecioCosto" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="* Falta Precio Costo" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtPrecioCosto"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Stock</td>
                <td>
                    <asp:TextBox ID="txtStock" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="* Falta Stock" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtStock"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Execto</td>
                <td>
                    <asp:CheckBox ID="chkExecto" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Habilitado</td>
                <td>
                    <asp:CheckBox ID="chkHabilitado" runat="server" />
                &nbsp;
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Opciones</td>
                <td>
                    <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                        Text="Limpiar" />
                    <asp:Button ID="btnGrabar" runat="server" onclick="btnGrabar_Click" 
                        Text="Grabar" ValidationGroup="grabar" />
                    <asp:Button ID="btnListar" runat="server" onclick="btnListar_Click" 
                        Text="Listar" />
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                        PostBackUrl="~/MenuPrincipal.aspx" onclick="btnVolver_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="Grilla" runat="server" onrowdatabound="Grilla_RowDataBound" 
                        onrowcreated="Grilla_RowCreated">
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
