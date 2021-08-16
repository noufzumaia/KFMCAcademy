<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="courseDetails.aspx.cs" Inherits="Training_School.courseDetails" enableEventValidation="false" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
        <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  --%>
    <br />
    <br />
    <br />
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                           <h4><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="h4CourseDetails" Text="Course Details"></asp:Localize></h4>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:trainingSConStr %>" SelectCommand="select instructor , courseLanguage, course, courseRate, coursePrice, courseDescription, courseDuration, imgs

                       from instructor i inner join course c on i.instructorId = c.instructorId inner join courseLanguage cl on cl.courseLanguageId = c.courseLanguageId"></asp:SqlDataSource>
                    <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="gvDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="course" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="Page_Load" OnRowCommand="gvDetails_RowCommand" meta:resourcekey="gvDetailsResource1">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="course" HeaderText="Course Name" ReadOnly="True" SortExpression="course" InsertVisible="False" meta:resourcekey="BoundFieldResource1"></asp:BoundField>

                                <asp:TemplateField HeaderText="Course Details" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-lg-12" style="text-decoration: none; font-family: Arial; font-size: medium">


                                                            <asp:Image ID="imgInstructor" runat="server" Height="31px" ImageUrl="~/imgs/inst.png" Width="35px" meta:resourcekey="imgInstructorResource1" />


                                                            <b><span>Instructor Name:</span></b>
                                                            <asp:Label ID="lblInstructor" runat="server" Text='<%# Eval("instructor") %>' meta:resourcekey="lblInstructorResource1"></asp:Label>

                                                        </div>
                                                    </div>
                                                    <br />

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:Image ID="imgDescription" runat="server" Height="30px" ImageUrl="~/imgs/des.png" Width="34px" meta:resourcekey="imgDescriptionResource1" />
                                                            <b><span>Description:</span></b>
                                                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("courseDescription") %>' meta:resourcekey="lblDescriptionResource1"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <br />

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <asp:Image ID="imgLanguage" runat="server" Height="25px" ImageUrl="~/imgs/lang.png" Width="23px" meta:resourcekey="imgLanguageResource1" />
                                                            <b><span>Language:</span></b>
                                                            <asp:Label ID="lblLanguage" runat="server" Text='<%# Eval("courseLanguage") %>' meta:resourcekey="lblLanguageResource1"></asp:Label>
                                                            &nbsp; 
                                                       <asp:Image ID="imgRate" runat="server" Height="17px" ImageUrl="~/imgs/rate5.PNG" Width="49px" meta:resourcekey="imgRateResource1" />
                                                            <b><span>Rate:</span></b>
                                                            <asp:Label ID="lblRate" runat="server" Text='<%# Eval("courseRate") %>' meta:resourcekey="lblRateResource1"></asp:Label>
                                                            &nbsp;
                                                      <asp:Image ID="imgDuration" runat="server" Height="28px" ImageUrl="~/imgs/calender.png" Width="27px" meta:resourcekey="imgDurationResource1" />
                                                            <b><span>Duration:</span></b>&nbsp;<asp:Label ID="lblDuration" runat="server" Text='<%# Eval("courseDuration") %>' meta:resourcekey="lblDurationResource1"></asp:Label>
                                                            Month
                                                      &nbsp;
                                                      <asp:Image ID="imgPrice" runat="server" Height="30px" ImageUrl="~/imgs/price.jpg" Width="29px" meta:resourcekey="imgPriceResource1" />
                                                            <b><span>Price:</span></b>
                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("coursePrice") %>' meta:resourcekey="lblPriceResource1"></asp:Label>
                                                            $
                                                              &nbsp;
                                                        </div>
                                                    </div>
                                                    <br/>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid" Width="150px" Height="200px" ID="imgCourse" runat="server" ImageUrl='<%# Eval("imgs") %>' meta:resourcekey="imgCourseResource1" />
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>

                              <asp:TemplateField HeaderText="Regiser" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Button ID="btnRegister" runat="server" class="btn btn-outline-info" CommandArgument='<%# Eval("course") %>' CommandName="register" Text="Register" Font-Names="Arial" meta:resourcekey="btnRegisterResource1" />
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
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
</asp:Content>
