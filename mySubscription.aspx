<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mySubscription.aspx.cs" Inherits="Training_School.mySubscription" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <%-- script for the datatable--%>
    <script type="text/javascript">
        $(document).ready( function () {
    $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
     } );
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p>
           <asp:Image runat="server" ImageUrl="imgs/sup.PNG" style="width:100%; height:318px; margin-top: 88px;" meta:resourcekey="imgSub" class="img-fluid"/>
            <div class="text-center">
        <asp:Label ID="lblsubscriptionsList" style="color:#2E86C1" runat="server" Text="Subscriptions List" meta:resourcekey="lblSubscriptionsList" Font-Bold="True" ></asp:Label>
&nbsp;
        <br />
        <br />
        <div class="text-center">
            <div class="container">
      <div class="row">
         <div class="col-md-12 mx-auto">
            <div class="card">
               <div class="card-body" aria-setsize="50">
            <asp:GridView Class="table table-striped table-bordered" ID="gvSubscriptionsList" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Width="790px" CellPadding="4" ForeColor="#333333" GridLines="None" meta:resourcekey="gvSubscriptionsListResource1">
            
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            
            <Columns>
            <asp:BoundField DataField="traineeId" HeaderText="traineeId" meta:resourcekey="BoundFieldResource1"  />
            <asp:BoundField DataField="orderId" HeaderText="orderId" meta:resourcekey="BoundFieldResource2"  />
            <asp:BoundField DataField="orderDate" HeaderText="orderDate" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="course" HeaderText="course" meta:resourcekey="BoundFieldResource4"/>
            <asp:BoundField DataField="coursePrice" HeaderText="coursePrice" meta:resourcekey="BoundFieldResource5"/>
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
        <br />
    </div>
    <br /></p>
</asp:Content>
