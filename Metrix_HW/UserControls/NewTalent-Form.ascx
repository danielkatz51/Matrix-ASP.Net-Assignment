<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewTalent-Form.ascx.cs" Inherits="Metrix_HW.NewTalent_Form" %>

<center>
    <%--====================New Talent form================--%>
    <div class="Form-container">
      <div class="form-group">
        <label for="TalentName">Talent Name:</label>
        <input type="text" class="form-control" id="TalentName" placeholder="Enter Name" runat="server">
      </div>
      <div class="form-group">
        <label for="TalentEmail">Talent Email address:</label>
        <input type="email" class="form-control" id="TalentEmail" aria-describedby="emailHelp" placeholder="Enter Email" runat="server">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
      </div>
       <div class="form-group">
        <label for="TalentDOB">Talent Date of Birth:</label>
        <input type="Date" class="form-control" id="TalentDOB" placeholder="Enter Date of Birth" runat="server">
      </div>
      <div class="form-group">
        <label for="TalentAge">Talent Age:</label>
        <input type="Text" class="form-control" id="TalentAge" placeholder="Enter Age" runat="server">
      </div>
      <div class="form-group">
        <label for="TalentSpec">Talent Specialization:</label>
        <input type="Text" class="form-control" id="TalentSpec" placeholder="Enter Specialization" runat="server">
      </div>
        <%--===============================================--%>
        <%--==============Buttons submit/backHome==========--%>
        <asp:Button ID="Button1" runat="server" onclick="AddNewTalent" Text="Submit" class="btn btn-primary"/><br/><br/>
        <asp:Button ID="Button2" runat="server" onclick="BackToHomePage" Text="Home Page" class="btn btn-secondary"/>
       </div>
</center>