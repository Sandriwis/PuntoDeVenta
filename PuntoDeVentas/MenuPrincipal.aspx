<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MenuPrincipal.aspx.cs" Inherits="PuntoDeVentas.Formulario_web13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 201px;
        }
        .style2
        {
            width: 201px;
            height: 22px;
        }
        .style3
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                Menú Principal</td>
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
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FrmMarca.aspx">Marca</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/FrmTIpoUsuario.aspx">Tipos de Usuarios</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                </td>
            <td class="style3">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/FrmCategoria.aspx">Categorias</asp:HyperLink>
            </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/frmFormaPago.aspx">Forma pago</asp:HyperLink>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/frmProducto.aspx">Producto </asp:HyperLink>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/FrmTIpoUsuario.aspx">Tipo Usuario</asp:HyperLink>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
           <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/frmProveedor.aspx">Proveedor</asp:HyperLink>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
