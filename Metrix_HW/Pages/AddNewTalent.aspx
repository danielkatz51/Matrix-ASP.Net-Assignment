<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewTalent.aspx.cs" Inherits="Metrix_HW.Page2" %>

<%@ Register Src="~/UserControls/NewTalent-Form.ascx" TagPrefix="uc1" TagName="NewTalentForm" %>
<%@ Register Src="~/UserControls/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Talent</title>
    <%--===================Bootstrap==================--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
   <%--===================My css files================--%>
    <link href="../StyleSheets/TopBar.css" rel="stylesheet" />
    <link href="../StyleSheets/NewTalentForm.css" rel="stylesheet" />
    <%--==============================================--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--=====================Top-Bar UC==========================--%>
            <uc1:TopBar runat="server" ID="TopBar" />
            <%--=====================New-Talent-Form UC==========================--%>
            <uc1:NewTalentForm runat="server" id="NewTalentForm" />
        </div>
    </form>
</body>
</html>
