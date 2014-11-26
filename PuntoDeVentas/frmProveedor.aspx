<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="frmProveedor.aspx.cs" Inherits="PuntoDeVentas.frmProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <script>
     function Read_Data(value) {
         var fila = parseInt(value) + 1;
         var grilla = document.getElementById('<%= Grilla.ClientID %>');

         var id = grilla.rows[fila].cells[0].textContent;
         var rut = grilla.rows[fila].cells[1].textContent;
         var digito = grilla.rows[fila].cells[2].textContent;
         var razonsocial = grilla.rows[fila].cells[3].textContent;
         var nombre = grilla.rows[fila].cells[4].textContent;
         var fono1 = grilla.rows[fila].cells[5].textContent;
         var fono2 = grilla.rows[fila].cells[6].textContent;
         var email = grilla.rows[fila].cells[7].textContent;
         var activo = grilla.rows[fila].cells[8].textContent;


         document.getElementById('<%= txtId.ClientID %>').value = id;
         document.getElementById('<%= txtRut.ClientID %>').value = rut;
         document.getElementById('<%= txtDv.ClientID %>').value = digito;
         document.getElementById('<%= txtRazonSocial.ClientID %>').value = razonsocial;
         document.getElementById('<%= txtNombre.ClientID %>').value = nombre;
         document.getElementById('<%= txtFono1.ClientID %>').value = fono1;
         document.getElementById('<%= txtFono2.ClientID %>').value = fono2;
         document.getElementById('<%= txtEmail.ClientID %>').value = email;
         document.getElementById('<%= chkActivo.ClientID %>').checked = activo == "Si" ? true : false;
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
                    PROVEEDOR</td>
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
                    Rut:</td>
                <td>
                    <asp:TextBox ID="txtRut" runat="server" ValidationGroup="grabar"></asp:TextBox>
&nbsp;-
                    <asp:TextBox ID="txtDv" runat="server" MaxLength="1" Width="33px" 
                        ValidationGroup="grabar"></asp:TextBox>
                &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="* Falta Rut" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtRut"></asp:RequiredFieldValidator>
                &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="* Falta digito verificador" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtDv"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Razon Social</td>
                <td>
                    <asp:TextBox ID="txtRazonSocial" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="* Falta Razon Social" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtRazonSocial"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" Width="130px" 
                        ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="* Falta nombre" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Fono1</td>
                <td>
                    <asp:TextBox ID="txtFono1" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="* Falta fono1" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtFono1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Fono2</td>
                <td>
                    <asp:TextBox ID="txtFono2" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="* Falta fono2" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtFono2"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="grabar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="* Falta email" ForeColor="Red" ValidationGroup="grabar" 
                        ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Activo</td>
                <td>
                    <asp:CheckBox ID="chkActivo" runat="server" />
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
