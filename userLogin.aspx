<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="Training_School.userLogin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3><asp:Localize ID="header" runat="server" 
                       meta:resourcekey="h3MemberLogin" Text="Member Login"></asp:Localize></h3>
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
                           <asp:TextBox CssClass="form-control" ID="txtUserEmail" runat="server" meta:resourcekey="txtUserEmailResource1"></asp:TextBox>
                        </div>
                        <label><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="lblPassword" Text="Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtUserPassword" runat="server" TextMode="Password" meta:resourcekey="txtUserPasswordResource1"></asp:TextBox>
                            <br /> 
                            <asp:LinkButton ID="lbtnForgotPass" meta:resourcekey="lbtnForgotPass" runat="server" OnClick="lbtnForgotPass_Click">Forgot Password?</asp:LinkButton>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="btnLogin" meta:resourcekey="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click1" />
                        </div>
                         <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="btnSignUp" meta:resourcekey="btnSignup" runat="server" Text="Sign Up"  />
                        </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
