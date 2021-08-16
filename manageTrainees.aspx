<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageTrainees.aspx.cs" Inherits="Training_School.manageTrainees" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=gvTrainees.ClientID%>').dataTable({
              });

              $('#<%=gvPassedTrainee.ClientID%>').dataTable({
              });
          });
    </script>

    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
      <div class="row">
         <div class="col-md-9">
            <div class="card" style="margin-left:-0%; margin-right:-20%; left:50px">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><b><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="h4ManageTrainee" Text="Manage Trainees"></asp:Localize></b></h4>
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
                       meta:resourcekey="lblTraineeID" Text="Trainee ID"></asp:Localize></label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="txtTraineeId" runat="server" meta:resourcekey="txtTraineeIdResource1"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="lblTraineeName" Text="Trainee Name"></asp:Localize></label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtTrainee" runat="server" meta:resourcekey="txtTraineeResource1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-outline-info" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="220px"  meta:resourcekey="btnUpdate"/>
                         <br />
                         <asp:Label ID="lblTraineeStatus" runat="server" Height="30px" Text="Trainee Status" meta:resourcekey="lblTraineeStatus"></asp:Label>
                         <br />
                            <asp:DropDownList ID="ddlStatus" runat="server" Height="50px" width="130px" AutoPostBack="True" BackColor="Silver" ForeColor="White" Font-Bold="True"></asp:DropDownList>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="btnDelete" class="btn btn-lg btn-block btn-outline-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" meta:resourcekey="btnDelete"/>
                     </div>
                      <div class="col-4">
                        <asp:Button ID="btnShowPaasedTrainees" class="btn btn-lg btn-block btn-outline-info" runat="server" Text="Show Passed Trainees" OnClick="btnShowPaasedTrainees_Click" Width="300px" meta:resourcekey="btnShowPaasedTrainees" />
                        <asp:Button ID="btnExportToExcel" class="btn btn-lg btn-block btn-outline-info" runat="server" Text="Export Passed Trainees To Excel" OnClick="btnExportToExcel_Click1" Width="300px" meta:resourcekey="btnExportToExcel"/>
                     </div>
                      <div class="col-4">
                     </div>

                  </div>
               </div>
            </div>
            <br>
            <br>
         </div>
        
     
          <div class="col-md-12">
              <asp:Label ID="lblOutput" runat="server"></asp:Label>
            <br />
            <div class="card" style="margin-left:-0%; margin-right:30%; left: 150px;">
               <div class="card-body" >
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="h4TraineesList" Text="Trainees List"></asp:Localize></h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="gvTrainees" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnPreRender="gvTraineeData_PreRender" AutoGenerateColumns="False" Width="735px">
                            
                            
                            <Columns>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                                HeaderText="Trainee ID" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton1_Click"
                                        CommandArgument='<%# Bind("traineeId") %>'
                                        Text='<%# Eval("traineeId") %>' meta:resourcekey="gvLinkButtonResource1"></asp:LinkButton>

                                </ItemTemplate>

                                 <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                 </asp:TemplateField>


                                <asp:BoundField DataField="trainee" HeaderText="trainee" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Email" HeaderText="Email" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="traineeStatusId" HeaderText="traineeStatusId" meta:resourcekey="BoundFieldResource4" />

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
              <br /> 

              <div class="card" style="margin-left:-0%; margin-right:30%; left: 150px;">
               <div class="card-body" >
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4><asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="h4TraineesList2" Text="Passed Trainees List"></asp:Localize></h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="gvPassedTrainee" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnPreRender="gvPassedTraineeData_PreRender" AutoGenerateColumns="False" Width="735px" meta:resourcekey="gvPassedTraineeResource1">
                            
                            
                            <Columns>

                          


                                <asp:BoundField DataField="trainee" HeaderText="trainee" meta:resourcekey="BoundFieldResource5" />
                                <asp:BoundField DataField="Email" HeaderText="Email" meta:resourcekey="BoundFieldResource6" />
                                <asp:BoundField DataField="instructor" HeaderText="instructor" meta:resourcekey="BoundFieldResource7" />
                                <asp:BoundField DataField="course" HeaderText="course" meta:resourcekey="BoundFieldResource8" />
                                <asp:BoundField DataField="courseDuration" HeaderText="courseDuration" meta:resourcekey="BoundFieldResource9" />
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
    <br />
          
</asp:Content>
