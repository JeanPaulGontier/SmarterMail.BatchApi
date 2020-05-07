<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body class="m-4">
    <form id="form1" runat="server" class="need-validation">
        <asp:Panel runat="server">
            <h1>Smartermail disable email list</h1>
            <div class="form-group">
                <label for="text">Smartermail WS :</label>
                <asp:TextBox runat="server" ID="URL" class="form-control need-validation"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="URL" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="text">Username :</label>
                <asp:TextBox runat="server" ID="USERNAME" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="USERNAME" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="text">Password :</label>
                <asp:TextBox runat="server" ID="PASSWORD" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PASSWORD" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="text">Domain :</label>
                <asp:TextBox runat="server" ID="DOMAIN" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DOMAIN" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="text">Emails à traiter (un par ligne) :</label>
                <asp:TextBox runat="server" ID="EMAILS" class="form-control" TextMode="MultiLine" Rows="10" Wrap="false" ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="EMAILS" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div
            <div class="form-group">
                <asp:CheckBox runat="server" ID="ENABLED" Text="&nbsp;Activer" />               
            </div>
            <div class="form-group">
                <label for="text">Sujet réponse auto :</label>
                <asp:TextBox runat="server" ID="SUBJECT" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="SUBJECT" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="text">Message réponse auto :</label>
                <asp:TextBox runat="server" ID="MESSAGE" class="form-control" TextMode="MultiLine" Rows="10" Wrap="false"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MESSAGE" ErrorMessage="a compléter" CssClass="text-danger"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="BT_Valider" Text="Lancer le processus" OnClick="BT_Valider_Click"/>
            </div> 
            
        </asp:Panel>
        <asp:Panel runat="server" ID="P_Result" Visible="false">
            <div class="form-group alert alert-info">
                <pre><asp:Literal runat="server" ID="L_Result"></asp:Literal></pre>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
