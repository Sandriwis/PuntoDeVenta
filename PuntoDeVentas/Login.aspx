<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PuntoDeVentas.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div class="jumbotron">
       <h3>Bienvenido Al Punto de Ventas!</h3>              
     </div>
   
     <div class="col-sm-6 form-horizontal">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label" >
                    Email</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtCorreo" runat="server" Width="241px" AutoCompleteType="Disabled"
                        CssClass="form-control"></asp:TextBox>
                      
                </div>
            </div>

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">
                    Contraseña</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtPassword" runat="server" Width="241px" TextMode="Password" AutoCompleteType="Disabled"
                        CssClass="form-control"></asp:TextBox>
                       
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-6">
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" onclick="btnIngresar_Click"  />
                </div>
            </div>
    </div>
    
  
    </form>
</body>
</html>
