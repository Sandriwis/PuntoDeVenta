<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmTIpoUsuario.aspx.cs" Inherits="PuntoDeVentas.Formulario_web12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style1
        {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
        function Read_Data(value) {
            var fila = parseInt(value) + 1;
            var grilla = document.getElementById('<%= Grilla.ClientID %>');
            var id = grilla.rows[fila].cells[0].textContent;
            var nombre = grilla.rows[fila].cells[1].textContent;
            var activo = grilla.rows[fila].cells[2].textContent;

            document.getElementById('<%= txtId.ClientID %>').value = id;
            document.getElementById('<%= txtNombre.ClientID %>').value = nombre;
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
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    Tipo Usuario</td>
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
                    Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" Width="221px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="* Falta nombre" ForeColor="Red" ValidationGroup="grabar" 
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
                    Opciones</td>
                <td>
                    <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                        Text="Limpiar" />
                    <asp:Button ID="btnGrabar" runat="server" onclick="btnGrabar_Click" 
                        Text="Grabar" ValidationGroup="grabar" />
                    <asp:Button ID="btnListar" runat="server" onclick="btnListar_Click" 
                        Text="Listar" />
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                        PostBackUrl="~/MenuPrincipal.aspx" />
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
