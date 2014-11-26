<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmCategoria.aspx.cs" Inherits="PuntoDeVentas.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <script>
        function Read_Data(value)
        {
            // agregar evento RowDataBound
            var ivalue = parseInt(value) + 1;
            var grilla = document.getElementById('<%= Grilla.ClientID %>');
            var id      = grilla.rows[ivalue].cells[0].textContent;
            var nombre  = grilla.rows[ivalue].cells[1].textContent;
            var activo  = grilla.rows[ivalue].cells[2].textContent;
            
            document.getElementById('<%=txtId.ClientID%>').value = id;
            document.getElementById('<%=txtNombre.ClientID%>').value = nombre;
            document.getElementById('<%=chkActivo.ClientID%>').checked = activo == "Si" ? true : false;
        }
        function Limpiar() {
            document.getElementById('<%=txtId.ClientID%>').value = 0;
            document.getElementById('<%=txtNombre.ClientID%>').value = "";
            document.getElementById('<%=chkActivo.ClientID%>').checked = false;
            document.getElementById('<%=Grilla.ClientID %>').style.display = "none";
            return false;
        }        
    </script>
    
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            // limpia el formulario
            this.btnLimpiar.Attributes.Add("OnClick", "javascript:return Limpiar();");            
        }

        protected void grilla_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //oculta celdas
            e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
        }
    </script>
    <strong><span class="style1"><br />
    </span></strong>
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
    <strong><span class="style1">Categorias</span></strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:HiddenField ID="txtId" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Nombre</td>
            <td>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNombre" ErrorMessage="* Falta nombre" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="grabar"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Activo</td>
            <td>
                <asp:CheckBox ID="chkActivo" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="Grilla" runat="server" onrowdatabound="grilla_RowDataBound" 
                    onrowcreated="grilla_RowCreated">
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    </asp:Content>
