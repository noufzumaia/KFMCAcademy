<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="instructorProfile.aspx.cs" Inherits="Training_School.instructorProfile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 333;
        }
        .auto-style2 {
            width: 607px;
        }
        </style>
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
                             <table class="w-100">
                                <tr>
                                    <td class="auto-style1">&nbsp;</td>
                                    <td>
                         <asp:Label ID="lblOutput2" runat="server" meta:resourcekey="lblOutput2Resource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                         <center>
                           &nbsp;<img width="100px" src="imgs/adminuser.png" /> 
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
                       meta:resourcekey="lblInstructorID" Text="Instructor ID"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtInstructorId" runat="server" placeholder="Instructor ID" ReadOnly="True" meta:resourcekey="txtInstructorIdResource1"></asp:TextBox>
                        </div>
                     </div>
                        <div class="col-md-6">
                        <label> <asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="lblMajor" Text="Major"></asp:Localize></label>
                          <div class="form-group">
                         <asp:DropDownList class="form-control" ID="ddlMajorId" placeholder="Major" runat="server" meta:resourcekey="ddlMajorIdResource1"></asp:DropDownList>
                         </div>
                          </div>
                   </div>
               
                   <div class="row">
                       <div class="col-md-6">
                          <label><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="lblPhoneNumber" Text="Phone Number"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtInstructorPhone" runat="server" placeholder="Phone Number" TextMode="Phone" meta:resourcekey="txtInstructorPhoneResource1"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-6">
                          <label><asp:Localize ID="Localize6" runat="server" 
                       meta:resourcekey="lblNote" Text="Note"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtOther" runat="server" placeholder="Note" TextMode="MultiLine" meta:resourcekey="txtOtherResource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   
                   <div class="row">
                     <div class="col">
                         </div>
                     </div>
                  
                   <div class="row">
                            <div class ="col-md-6">
                                       <label> <asp:Localize ID="Localize7" runat="server" 
                       meta:resourcekey="lblLinkedIn" Text="LinkedIn"></asp:Localize> </label>
                                      <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtCV" runat="server" placeholder="Link for LinkedIn" meta:resourcekey="txtCVResource1" ></asp:TextBox>
                                          </div>
                            </div>
                            <div class="col-md-6">
                            <label> <asp:Localize ID="Localize11" runat="server" 
                       meta:resourcekey="lblCV" Text="CV"></asp:Localize> </label>
                            <div class="form-group">
                                <table class="w-100">
                                    <tr>
                                        <td class="auto-style2">
                                              <asp:FileUpload  onchange="readURL(this)" class="form-control" ID="FileUpload1" runat="server" meta:resourcekey="FileUpload1Resource1" />
                                        </td>
                                          <div class="col-md-6">
                                        <td>
                               <asp:Button class="btn btn-sm btn-block btn-success" ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" meta:resourcekey="btnUpload" />
                                        </td>
                                              <td>
                               <asp:Button class="btn btn-sm btn-block btn-success" ID="btnSend" runat="server" Text="Send to Admin" OnClick="btnSend_Click" meta:resourcekey="btnSendToAdmin" />
                                        </td>
                                    </div>
                                    </tr>
                                </table>
                              </div>
                              </div>
                       </div>
                  
                   <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize8" runat="server" 
                       meta:resourcekey="lblFileNumber" Text="File Number"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtDocument" runat="server" placeholder="File Number" meta:resourcekey="txtDocumentResource1"></asp:TextBox>
                            </div>
                             <div class="col-md-6">
                                        <td>
                               <asp:Button class="btn btn-outline-danger" ID="btnDeleteFiles" runat="server" Text="Delete File" OnClick="btnDeleteFiles_Click" meta:resourcekey="btnDeleteFile"/>
                                        </td>
                           </div>
                        </div>
                        <div class="col-md-4">
                                        <td>
                               <asp:Button class="btn btn-outline-info" ID="btnViewFiles" runat="server" Text="View Files" OnClick="btnViewFiles_Click"  meta:resourcekey="btnViewFiles"/>
                                        </td>
                               <td> 
                               <asp:Button class="btn btn-outline-info" ID="btnHide" runat="server" Text="Hide Files" OnClick="btnHide_Click" meta:resourcekey="btnHideFiles"/>
                                        </td>
                                    </div>
                        <div class="col-md-4">   
                                    </div>
                                               <div class="col-md-4">
                                    </div>
                        <div class="col">
                          <div class="form-group">
                             <asp:GridView  ID="gvFiles" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" meta:resourcekey="gvFilesResource1" >
                                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                 <EditRowStyle BackColor="#999999" />
                                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                 <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                 <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                 <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                              </asp:GridView>
                           </div>
                         </div>
                       </div>
                  
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                   <ContentTemplate>
                     <div class="row">
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize9" runat="server" 
                       meta:resourcekey="lblCurrentPassword" Text="Current Password"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="txtOldPass" runat="server" placeholder="Current Password" ReadOnly="True" meta:resourcekey="txtOldPassResource1"></asp:TextBox>
                        </div>
                         </div>
                     <div class="col-md-6">
                        <label><asp:Localize ID="Localize10" runat="server" 
                       meta:resourcekey="lblNewPassword" Text="New Password"></asp:Localize></label>
                        <div class="form-group">
                            <asp:TextBox class="form-control" ID="txtNewPass" runat="server" placeholder="New Password" TextMode="Password" meta:resourcekey="txtNewPassResource1"></asp:TextBox>
                        </div>
                     </div>
                       <div class="col-md-4">
                         <div class="form-group">
                              <asp:Button class="btn btn-outline-primary" ID="btnUpdatePassword" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click" meta:resourcekey="btnUpdatePasswordResource1"  />
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
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" meta:resourcekey="btnUpdateResource1" />
                           </div>
                          </div>
                        </center>
                    </div>
                 
                   <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                             <div class="form-group">
                              <asp:Button class="btn btn-lg btn-block btn-danger" ID="btnDelete" runat="server" Text="Delete Account" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1" />
                           </div>
                        </center>
                         <asp:CheckBox ID="ChBoxDelete" runat="server" AutoPostBack="True" Text=" Delete this Account?" meta:resourcekey="ChBoxDeleteResource1" />
                     </div>
                  </div>
                </div>
            </div>
         </div>
      </div>
      </div>
</asp:Content>
