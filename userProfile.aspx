<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Training_School.userProfile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
              <table class="w-100">
                 <tr>
                   <td class="auto-style1">&nbsp;</td>
                                    <td>
                         <asp:Label ID="lblOutput" runat="server" meta:resourcekey="lblOutputResource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                           
                         <center>
                           &nbsp;<img width="100px" src="imgs/generaluser.png" />
                                 </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><asp:Localize ID="header" runat="server" 
                       meta:resourcekey="h4YourProfile" Text="Your Profile"></asp:Localize>
                            </h4>
                        </center>
                     </div>
                  </div>
              
                  <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="lblFullName" Text="Full Name"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name" meta:resourcekey="txtFullNameResource1"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="lblEmail" Text="Email"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email ID" TextMode="Email" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  
                  <div class="row">
                     <div class="col-md-6">
                          <label><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="lblPhoneNum" Text="Phone Number"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtTraineePhone" runat="server" placeholder="Phone Number" TextMode="Phone" meta:resourcekey="txtTraineePhoneResource1"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="lbltraineeId" Text="Trainee ID"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtTraineeId" runat="server" placeholder="Trainee ID" ReadOnly="True" meta:resourcekey="txtTraineeIdResource1"></asp:TextBox>
                        </div>
                     </div>
                          </div>
             
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                     <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="lblCurrentPass" Text="Current Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtOldPass" runat="server" placeholder="Current Password" ReadOnly="True" meta:resourcekey="txtOldPassResource1"></asp:TextBox>
                        </div>
                         </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize6" runat="server" 
                       meta:resourcekey="lblNewPass" Text="New Password"></asp:Localize></label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtNewPass" runat="server" placeholder="New Password" TextMode="Password" meta:resourcekey="txtNewPassResource1"></asp:TextBox>
                        </div>
                     </div>
                       <div class="col-md-4">
                         <div class="form-group">
                              <asp:Button class="btn btn-outline-primary" ID="btnUpdatePassword" meta:resourcekey="btnUpdatePass" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click"  />
                          </div>
                       </div>
                         <asp:Label ID="lblAjax" runat="server" meta:resourcekey="lblAjaxResource1"></asp:Label>
                   </div>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpdatePassword" EventName="Click" />
            </Triggers>
              </asp:UpdatePanel>
    
                     <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnUpdate" meta:resourcekey="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                           </div>
                          </div>
                        </center>
                    </div>
                 
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                             <div class="form-group">
                              <asp:Button class="btn btn-lg btn-block btn-danger" ID="btnDelete" meta:resourcekey="btnDelete" runat="server" Text="Delete Account" OnClick="btnDelete_Click" />
                           </div>
                        </center>
                         <asp:CheckBox ID="ChBoxDelete" runat="server" meta:resourcekey="chBoxDelete" AutoPostBack="True" Text=" Delete this Account?" />
                     </div>
                  </div>
                </div>
            </div>
         </div>
      </div>
      </div>
</asp:Content>
