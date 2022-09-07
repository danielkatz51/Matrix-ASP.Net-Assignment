﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Talent-Card.ascx.cs" Inherits="Metrix_HW.UserControls.Talent_Card" %>

<div style="position:relative;">
    <%--=======================Talent Card============================--%>
    <div class="Card-container">
        <%--===============Input side============--%>
        <div class="inputs-side">
            <div class="Form-container">
              <div class="form-group">
                <asp:Label ID="TalentName" runat="server" Text="Name: "></asp:Label>
               </div>
              <div class="form-group">
                <asp:Label ID="TalentEmail" runat="server" Text="Email: "></asp:Label>
              </div>
               <div class="form-group">
                <asp:Label ID="TalentDOB" runat="server" Text="Date of birth: "></asp:Label>
              </div>
              <div class="form-group">
                <asp:Label ID="TalentSpec" runat="server" Text="Specialization: "></asp:Label>
            </div>
              <div class="form-group">
                <asp:Label ID="TalentID" runat="server" Text="Talent ID: "></asp:Label>
               </div>
          </div>
        </div>
        <%--=====================================--%>
        <%--=================Img side============--%>
        <div class="img-side">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="256" height="256" viewBox="0 0 256 256" xml:space="preserve">
            <defs>
            </defs>
            <g style="stroke: none; stroke-width: 0; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(1.4065934065934016 1.4065934065934016) scale(2.81 2.81)">
	            <path d="M 45 40.375 L 45 40.375 c -9.415 0 -17.118 -7.703 -17.118 -17.118 v -6.139 C 27.882 7.703 35.585 0 45 0 h 0 c 9.415 0 17.118 7.703 17.118 17.118 v 6.139 C 62.118 32.672 54.415 40.375 45 40.375 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(110,177,225); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/>
	            <path d="M 54.639 42.727 C 51.743 44.226 48.47 45.09 45 45.09 s -6.743 -0.863 -9.639 -2.363 c -12.942 1.931 -22.952 13.162 -22.952 26.619 v 17.707 c 0 1.621 1.326 2.946 2.946 2.946 h 59.29 c 1.621 0 2.946 -1.326 2.946 -2.946 V 69.347 C 77.591 55.889 67.581 44.659 54.639 42.727 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(110,177,225); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round"/>
            </g>
            </svg>
        </div>
        <%--=====================================--%>
    </div>
    <%--=======================END - Talent Card============================--%>
    <%--=======================Back home page Button============================--%>
    <div class="backToHome-button">
        <asp:Button ID="homeBtn" runat="server" onclick="backHome" Text="Home Page" class="btn btn-primary"/>
    </div>
    <%--========================================================================--%>
</div>