<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="trSignup.aspx.cs" Inherits="Training_School.trSignup" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><asp:Localize ID="header" runat="server" 
                       meta:resourcekey="h4TraineeSignUp" Text="Trainee Sign Up"></asp:Localize><asp:Label ID="lblOutput" runat="server" meta:resourcekey="lblOutputResource1"></asp:Label>
                            </h4>
                        </center>
                     </div>
                  </div>
         
                   <div class="row">
                   <div class="col">
                       <br />
                       <center> <asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="joinAsInstructor" Text="Do you want to join us as instructer ?"></asp:Localize>
                           <a href="insSignup.aspx"><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="aClickhere" Text="Click here"></asp:Localize></a>
                       </center>
                   <hr>
                       </div>
                       </div>
                   <%--END TABS CONTENT--%>

                   <%--<div>--%>
               <%-- <button class="tablink" onclick="openPage('Home', this, 'white')" id="btnt">Trainee</button>
                <button  class="tablink" onclick="openPage('News', this, 'white')"  id="defaultOpen">Instructer</button>--%>


          <%--  </div>--%>
                     <%--+++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
                  <div>
                       <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="lblUsername" Text="Username"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtTraineeName" runat="server" placeholder="Username" meta:resourcekey="txtTraineeNameResource1"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="lblEmail" Text="Email"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="lblPassword" Text="Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPass" runat="server" placeholder="Password" TextMode="Password" meta:resourcekey="txtPassResource1"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize6" runat="server" 
                       meta:resourcekey="lblPhoneNumber" Text="Phone Number"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" placeholder="Phone number" TextMode="Phone" meta:resourcekey="txtPhoneResource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize7" runat="server" 
                       meta:resourcekey="lblConfirmPassword" Text="Confirm Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtConfirmPass" runat="server" placeholder="Confirm password" TextMode="Password" meta:resourcekey="txtCPassResource1"></asp:TextBox>
                        </div>
                     </div>
                    
                       
                  </div>
                      </div> <%--END TAB1--%>
                       <%--++++++++++++++++++++++END TRAINEE+++++++++++++++++++++++++++++++--%>
                
                 <%--+++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
                  

                   <%--END TABS CONTENT--%>


                 <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="btnSignUp" meta:resourcekey="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                        </div>
                     </div>
                  </div>
                  
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
