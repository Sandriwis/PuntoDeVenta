<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMenu.aspx.cs" Inherits="PuntoDeVentas.FrmMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div> 
    <table>  
    
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/MenuVentas.aspx">Menú Ventas</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>  

        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/MenuEstadistica.aspx">Menú Estadisticas</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>

         <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MenuPrincipal.aspx">Menu Principal</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>
        </table> 
    
    </div>
    </form>
</body>
</html>
