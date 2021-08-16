<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="insSignup.aspx.cs" Inherits="Training_School.insSignup" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
                       meta:resourcekey="h4InstructorSignUp" Text="Instructor Sign Up"></asp:Localize></h4>
                        </center>
                     </div>
                  </div>
         
                   <div class="row">
                   <div class="col">
                   <hr>
                       </div>
                       </div>
                   <%--                        =============================--%>

                   <%--<div>--%>
               <%-- <button class="tablink" onclick="openPage('Home', this, 'white')" id="btnt">Trainee</button>
                <button  class="tablink" onclick="openPage('News', this, 'white')"  id="defaultOpen">Instructer</button>--%>


          <%--  </div>--%>
                     <%--+++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
                  
                    
                       <%--++++++++++++++++++++++END TRAINEE+++++++++++++++++++++++++++++++--%>
                
                 <%--+++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
                  <div >

<%--                     FIRST SAME AS TRAINEE--%>
                           <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="lblUsername" Text="Username"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server" placeholder="Username" meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="lblEmail" Text="Email"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email" meta:resourcekey="TextBox8Resource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="lblPassword" Text="Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" meta:resourcekey="TextBox9Resource1"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="lblPhoneNumber" Text="Phone Number"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPhoneNumber" runat="server" placeholder="Phone number" TextMode="Phone" meta:resourcekey="TextBox10Resource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="lblConfirmPassword" Text="Confirm Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtConfirmPassword" runat="server" placeholder="Confirm password" TextMode="Password" meta:resourcekey="TextBox11Resource1"></asp:TextBox>
                        </div>
                     </div>
                    
                      <%-- <div class="col-md-6">
                        <label>Major</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Major"></asp:TextBox>
                        </div>
                     </div>--%>
                  
<%--                      ##############################################################3--%>
                        <div class="col-md-6">
                        <label><asp:Localize ID="Localize6" runat="server" 
                       meta:resourcekey="lblMajor" Text="Major"></asp:Localize></label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1">
                              <asp:ListItem meta:resourcekey="liSelect" Text="Select" Value="0" />
                              <asp:ListItem meta:resourcekey="liIT" Text="IT" Value="1" />
                              <asp:ListItem meta:resourcekey="liDataScience" Text="Data Science" Value="2" />
                              <asp:ListItem meta:resourcekey="liComputerScience" Text="Computer Science" Value="3" />
                              <asp:ListItem meta:resourcekey="liSoftwareEngineering" Text="Software Engineering " Value="4" />
                           </asp:DropDownList>
                           <asp:CompareValidator
                               ID="validate" runat="server" ControlToValidate="DropDownList1"
                               ErrorMessage=" Required." Operator="NotEqual"
                               ValueToCompare="0" meta:resourcekey="validate"
                               ForeColor="Red" SetFocusOnError="True" />
                        </div>
                     </div>
<%--                      ############################################################3--%>
                      </div> <%--END row--%>
                      
                         </div> <%--END TAB2--%>
                

                   <%--END TABS CONTENT--%>


                 <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-info btn-block btn-lg" ID="btnSigup" meta:resourcekey="btnSigup" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
                        </div>
                     </div>
                  </div>
                  
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
