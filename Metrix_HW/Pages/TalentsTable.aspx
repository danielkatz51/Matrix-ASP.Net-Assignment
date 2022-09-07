<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TalentsTable.aspx.cs" Inherits="Metrix_HW.Page1" %>

<%@ Register Src="~/UserControls/TalentUC.ascx" TagPrefix="uc1" TagName="TalentUC" %>
<%@ Register Src="~/UserControls/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/UserControls/Talent-Card.ascx" TagPrefix="uc1" TagName="TalentCard" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Talents Table</title>
    <%--===================My css files================--%>
    <link href="../StyleSheets/EditTalent.css" rel="stylesheet" />
    <link href="../StyleSheets/TopBar.css" rel="stylesheet" />
    <link href="../StyleSheets/TalentTable.css" rel="stylesheet" />
    <link href="StyleSheets/SearchUC.css" rel="stylesheet" />
    <%--===============================================--%>
    <%--===================Bootstrap for table + jquery for table function================--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
    <link href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet" />  
    <link href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css" rel="stylesheet" />  
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>  
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.min.js "></script>
    <%--=====generating function for table look by using jquery============--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#table').dataTable({
                "aLengthMenu": [[3, 5, 10, -1], [3, 5, 10, "All"]],
                "iDisplayLength": 3
            });
        });
    </script>
    <%--===============================================--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--=====================Top-Bar UC==========================--%>
            <uc1:TopBar runat="server" id="TopBar" />
            <%--=====================Table-page UC=======================--%>
            <uc1:TalentUC runat="server" id="TalentUC" />
        </div>
    </form>
</body>
</html>
