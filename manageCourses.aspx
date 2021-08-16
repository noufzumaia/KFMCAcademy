<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manageCourses.aspx.cs" Inherits="Training_School.manageCourses" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
          $(document).ready(function () {
              $('#<%=gvCourseData.ClientID%>').dataTable({
              });
          });
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="nav-justified" style="height: 115px">
        <tr>
            <td style="font-family: tahoma; font-size: medium; text-align: center;" >
                <asp:Label ID="lblOutput" runat="server" meta:resourcekey="lblOutputResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="height: 425px">
        <tr>
            <td style="font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; width: 517px; height: 45px;">
                <asp:Label ID="Label8" runat="server"  meta:resourcekey="lblCourseId" Text="Course Id"></asp:Label>
            </td>
            <td style="height: 45px" id="txtCourse0">
                <asp:TextBox ID="txtcourseId" runat="server" TextMode="Number" meta:resourcekey="txtcourseIdResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; width: 517px; height: 50px;">
                <asp:Label ID="Label2" runat="server"  meta:resourcekey="lblCourseName" Text="Course Name"></asp:Label>
&nbsp;</td>
            <td style="text-align: left; height: 50px;" id="txtCourse">
                <asp:TextBox ID="txtCourse" runat="server" meta:resourcekey="txtCourseResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 517px; font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; height: 45px;">
                <asp:Label ID="Label3" runat="server" meta:resourcekey="lblInstructorId" Text="Instructor Id"></asp:Label>
&nbsp; </td>
            <td style="text-align: left; height: 45px;" id="txtInstructor">
                <asp:TextBox ID="txtInstructor" runat="server" TextMode="Number" meta:resourcekey="txtInstructorResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 517px; font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; height: 45px;">
                <asp:Label ID="Label4" runat="server" meta:resourcekey="lblDuration" Text="Duration"></asp:Label>
&nbsp; </td>
            <td style="text-align: left; height: 45px;" id="txtDuration">
                <asp:TextBox ID="txtDuration" runat="server" meta:resourcekey="txtDurationResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 517px; font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; ">
                <asp:Label ID="Label5" runat="server" meta:resourcekey="lblCourseDescription" Text="Course Description"></asp:Label>
&nbsp; </td>
            <td style="text-align: left;" id="txtCD">
                <asp:TextBox ID="txtCD" runat="server" Height="56px" TextMode="MultiLine" Width="185px" meta:resourcekey="txtCDResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 517px; font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; height: 53px;">
                <asp:Label ID="Label7" runat="server" meta:resourcekey="lblLanguage" Text="Language"></asp:Label>
            </td>
            <td style="text-align: left; height: 53px;" id="txtLanguage">
                <asp:RadioButtonList ID="rblLanguage" runat="server" meta:resourcekey="rblLanguageResource1">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <center>
            <td style="font-family: tahoma; font-size: medium; text-align: justify; text-indent: 300px; height: 53px;" colspan="2">
                <table class="nav-justified">
                    <tr>
                        <td>&nbsp;</td>
                        <td style="width: 94px">&nbsp;</td>
                        <td style="width: 171px">&nbsp;</td>
                        
                        <td style="width: 100px">
                            <asp:Button class="btn btn-outline-info" ID="btnAdd_Click" runat="server" meta:resourcekey="btnAdd"  Text="Add" Width="130px" OnClick="btnAdd_Click_Click" />
                        </td>
                        <td style="width: 100px">
                            <asp:Button class="btn btn-outline-info" ID="btnUpdate" runat="server" meta:resourcekey="btnUpdate" Text="Update" Width="130px" OnClick="btnUpdate_Click" />
                        </td>
                        <td style="width: 100px">
                            <asp:Button class="btn btn-outline-info" ID="Button1" runat="server" meta:resourcekey="btnGetAll" Text="Get All" Width="130px" OnClick="btnGetAll_Click" />
                        </td>
                        <td style="width: 100px">
                            <asp:Button class="btn btn-outline-danger"  ID="btnDelete" runat="server" meta:resourcekey="btnDelete" Text="Delete" Width="130px" OnClick="btnDelete_Click" />
                        </td>
                       
                        
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="width: 94px">&nbsp;</td>
                        <td style="width: 171px">&nbsp;</td>
                        
                        <td style="width: 100px">
                            <asp:Button  class="btn btn-outline-info" ID="btnExcel" meta:resourcekey="btnExportExcel" runat="server" Text="Export To Excel" Width="130px" OnClick="btnExcel_Click"   />
                        </td>
                        <td style="width: 100px">
                            <asp:Button  class="btn btn-outline-info" ID="btnWord" meta:resourcekey="btnExportWord" runat="server" Text="Export To Word" Width="130px" OnClick="btnWord_Click"  />
                        </td>
                        <td style="width: 100px">
                            <asp:Button  class="btn btn-outline-info" ID="btnPDF" meta:resourcekey="btnExportPdf" runat="server" Text="Export To PDF" Width="130px" OnClick="btnPDF_Click"  />
                        </td>
                        
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="8" style="height: 249px">   
                             <div class="container">
      <div class="row">
         <div class="col-md-8 mx-auto">
               <div class="card-body"style="margin-left:10%">
                          <asp:GridView class="table table-striped table-bordered" ID="gvCourseData" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnPreRender="gvCourseData_PreRender" AutoGenerateColumns="false">
                 
                 
                 <Columns>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                                HeaderText="Course ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton1_Click"
                                        CommandArgument='<%# Bind("courseId") %>'
                                        Text='<%# Eval("courseId")  %>'></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:BoundField DataField="course" HeaderText="course" />
                            <asp:BoundField DataField="instructorId" HeaderText="instructorId" />
                            <asp:BoundField DataField="instructor" HeaderText="instructor" />
                            <asp:BoundField DataField="courseLanguageId" HeaderText="courseLanguageId" />
                            <asp:BoundField DataField="courseDuration" HeaderText="courseDuration" />
                            <asp:BoundField DataField="courseDescription" HeaderText="courseDescription" />
                            

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
                        </td>
                    </tr>
                </table>

            </td>

            </center>
        </tr>
        </table>
</asp:Content>

