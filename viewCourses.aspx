<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewCourses.aspx.cs" Inherits="Training_School.viewCourses" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
          .centers {
              margin-left: 40px;
          }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                           <h4><asp:Localize ID="Localize5" runat="server" 
                            meta:resourcekey="h4ViewCourses" Text="View Courses"></asp:Localize></h4>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr>
                    </div>
                </div>
                <div class="row">   
                    <img src="imgs/search-banner.jpg" style="width:100%; height:318px;" class="img-fluid" />
    <br/> <br/> <br/>
    <div class="centers">
          <p><br/><br/><b><asp:Localize ID="Localize1" runat="server" 
                            meta:resourcekey="pSearchCourses" Text="Search For Courses"></asp:Localize></b></p>
        <p>
                        <asp:TextBox ID="textSearch" runat="server" Height="29px" Width="241px" BackColor="White" meta:resourcekey="textSearchResource1"></asp:TextBox>
                        &nbsp;
                        <asp:Button ID="butSearch"   meta:resourcekey="btnSearch" runat="server" OnClick="ButSearch_Click" Text="Search" class="btn btn-outline-info" Font-Names="Arial" Height="40px" Width="95px" />
                        &nbsp; &nbsp;
                        <asp:Button ID="btnDetails"   meta:resourcekey="btnViewDetails" runat="server" Text="View Details" class="btn btn-outline-info" Font-Names="Arial" Height="40px" Width="106px" OnClick="btnDetails_Click" />
                        
        </p>
        <p>
            <asp:GridView ID="gvOutput" class="table table-striped table-bordered" runat="server" CellPadding="4" Height="16px" Width="1021px" EmptyDataText="No recod Found " ForeColor="#333333" GridLines="None" meta:resourcekey="gvOutputResource1">
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
             </p>
           </div>
        </div>
      </div>
    </div>
  </div>
  <br/><br/>
</asp:Content>
