<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageInstructors.aspx.cs" Inherits="Training_School.manageInstructors" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
          $(document).ready(function () {

              //$(document).ready(function () {
              //$('.table').DataTable();
              // });

              $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
              //$('.table1').DataTable();
          });
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
      <div class="row">
         <div class="col-md-9">
            <div class="card" style="margin-left:35%">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><b><asp:Localize ID="header" runat="server" 
                       meta:resourcekey="h4ManageInstructors" Text="Manage Instructors"></asp:Localize></b></h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png">
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label><asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="lblInstructorID" Text="Instructor ID"></asp:Localize></label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtInstructorId" runat="server" meta:resourcekey="txtInstructorIdResource1"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="lblInstructorName" Text="Instructor Name"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtInstructor" runat="server" meta:resourcekey="txtInstructorResource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btnUpdate"  meta:resourcekey="btnUpdate" class="btn btn-lg btn-block btn-outline-info" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnDelete" meta:resourcekey="btnDelete" class="btn btn-lg btn-block btn-outline-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                     </div>
                        <div class="col-4">
                            <asp:DropDownList ID="ddlStatus" runat="server" Height="50px" AutoPostBack="True" BackColor="Silver" ForeColor="White" Font-Bold="True" meta:resourcekey="ddlStatusResource1"></asp:DropDownList>
                     </div>
                  </div>
               </div>
            </div>
            <br>
            <br>
            <asp:Label ID="lblOutput" runat="server"></asp:Label>
         </div>
         <div class="col-md-12">
            <div class="card" style="margin-left:5%">
               <div class="card-body" >
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="h4InstructorsList" Text="Instructors List"></asp:Localize></h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <div class="col-5">
                          <asp:GridView class="table table-striped table-bordered" ID="gvInstructors" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="1000px">

                              <Columns>

                                  <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                                      HeaderText="Instructor ID">
                                      <ItemTemplate>
                                          <asp:LinkButton ID="gvLinkButton" runat="server"
                                              OnClick="gvAdminLinkButton1_Click"
                                              CommandArgument='<%# Bind("instructorId") %>'
                                              Text='<%# Eval("instructorId")  %>'></asp:LinkButton>

                                      </ItemTemplate>
                                  </asp:TemplateField>


                                  <asp:BoundField DataField="instructor" HeaderText="instructor" />
                                  <asp:BoundField DataField="Email" HeaderText="Email" />
                                  <asp:BoundField DataField="Phone" HeaderText="Phone" />
                                  <asp:BoundField DataField="Major" HeaderText="Major" />
                                  <asp:BoundField DataField="Note" HeaderText="Note" />
                                  <asp:BoundField DataField="statusId" HeaderText="statusId" />

                              </Columns>

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
            </div>
         </div>
      </div>
   </div>
</asp:Content>
