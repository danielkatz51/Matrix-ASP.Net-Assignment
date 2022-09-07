<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TalentUC.ascx.cs" Inherits="Metrix_HW.TalentUC" %>

<div class="table-box">
    <div class="header-box">
        <h1>Talents</h1>
        <%--======Button for New Talent page=========--%>
        <a href="AddNewTalent.aspx">Create New</a><br />
        <%--=========================================--%>
    </div>
    <hr />
    <%--======Repeater for the table rows============--%>
    <asp:Repeater ID="rptTalents" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <HeaderTemplate>
        <%--============Table header=================--%>
        <table class="table" id="table">
            <thead >
                <tr>
                  <th scope="col">Talent Id</th>
                  <th scope="col">Talent Name</th>
                  <th scope="col">E-mail</th>
                  <th scope="col">Date of Birth</th>
                  <th scope="col">Age</th>
                  <th scope="col">Specialization</th>
                  <th scope="col"></th>
                </tr>
              </thead>
    </HeaderTemplate>
        <%--=========================================--%>
    <ItemTemplate>
        <%--=========Table row template==============--%>
        <tr>
            <td class="col-ID">
                <asp:Label ID="lblTalentId" runat="server" Text='<%# Eval("Talent_ID") %>' />
                <asp:linkbutton ID="Linkbutton3" CommandName="View" CommandArgument='<%# Eval("Talent_ID") %>' runat="server" text="Card View" />
            </td>
            <td>
                <asp:Label ID="lblTalentName" runat="server" Text='<%# Eval("Name") %>' />
            </td>
            <td>
               <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' />
            </td>
            <td>
                <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB") %>' />
            </td>
            <td>
                <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>' />
            </td>
            <td>
                <asp:Label ID="lblSpecialization" runat="server" Text='<%# Eval("Specialization") %>' />
            </td>
            <td>
                <asp:linkbutton ID="Linkbutton1" CommandName="Update" CommandArgument='<%# Eval("Talent_ID") %>' runat="server" text="Edit" />
               <asp:linkbutton ID="Linkbutton2" CommandName="Delete"  runat="server" text="Delete" onclientclick="javascript:return confirm('Are you sure to delete record?')"/>
            </td>
        </tr>
    </ItemTemplate>
        <%--=========================================--%>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
    <%--==================End of repeater=======================--%>
    <%--============Hidden field to save ID for editing=================--%>
    <asp:hiddenfield id="hfSelectedRecord" runat="server"></asp:hiddenfield>
    <%--================================================================--%>
    <%--====================Edit section=================--%>
    <div class="Edit-Container hidden" runat="server" ID="Editcon">
        <div class="Edit-box ">
            <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Date of Birth:"></asp:Label>
            <asp:TextBox ID="DOBTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="E-mail:"></asp:Label>
            <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="Age:"></asp:Label>
            <asp:TextBox ID="AgeTextBox" runat="server"></asp:TextBox>
            <asp:Label ID="Label6" runat="server" Text="Specialization:"></asp:Label>
            <asp:TextBox ID="SpecTextBox" runat="server"></asp:TextBox>
            <asp:Button ID="SubmitEdit" runat="server" Text="Update" class="btn btn-primary" onclick="btnUpdate_Click"/>
        </div>
    </div>
    <%--=================================================--%>
    </div>