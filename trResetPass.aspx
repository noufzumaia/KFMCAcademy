<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="trResetPass.aspx.cs" Inherits="Training_School.trResetPass" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/generaluser.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3><asp:Localize ID="header" runat="server" 
                       meta:resourcekey="h3ResetPassword" Text="Reset Password"></asp:Localize></h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <label><asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="lblNewPassword" Text="New Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtNewPass" runat="server" placeholder="Enter your email" TextMode="Password" meta:resourcekey="tbNewPassResource1"></asp:TextBox>
                        </div>

                           <label><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="lblConfirmPassword" Text="Confirm Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtConfirmPass" runat="server" placeholder="Enter your email" TextMode="Password" meta:resourcekey="tbConfirmPassResource1"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="btRecPass" meta:resourcekey="btnSend" runat="server" Text="Send" OnClick="btRecPass_Click" />
                        </div>
                       
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
