<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgotPass.aspx.cs" Inherits="Training_School.forgotPass" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
                       meta:resourcekey="h3ForgotPassword" Text="Forgot Password"></asp:Localize></h3>
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
                       meta:resourcekey="lblEmail" Text="Email"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Enter your email" meta:resourcekey="TextBoxEResource1"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="Button1" meta:resourcekey="btnSend" runat="server" Text="Send" OnClick="btPassRec_Click1" />
                        </div>
                       
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
    <br />
</asp:Content>
