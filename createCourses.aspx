<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="createCourses.aspx.cs" Inherits="Training_School.createCourses" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style3 {
            width: 155px;
        }
        .centers {
            margin-left: auto;
            margin-right: auto;
            border:1px #D3D3D3 solid;
        }
        .auto-style4 {
            width: 155px;
            height: 91px;
        }
        .auto-style5 {
            height: 91px;
            width: 436px;
        }
        .auto-style6 {
        width: 436px;
    }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <table class="centers">
        <caption style="font-family: 'Times New Roman', Times, serif; caption-side: top; font-weight: bold; font-size: large; color: #000000;"> <asp:Localize ID="header" runat="server" 
                       meta:resourcekey="captionCreateCourse" Text="If you are interested in becoming instructor, please fill course information in the form below."></asp:Localize></caption>
        <tr>
            <td class="auto-style1" colspan="2">
              &nbsp;  <asp:Label ID="lblMsg" runat="server" meta:resourcekey="lblMsgResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
               &nbsp; <asp:Label ID="lblSenderEmail" runat="server" Text="Your Email" meta:resourcekey="lblYourEmail" ></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox CssClass="form-control" ID="txtSenderEmail" runat="server" Width="270px" meta:resourcekey="txtSenderEmailResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
               &nbsp; <asp:Label ID="lblSubject" runat="server" Text="Subject" meta:resourcekey="lblSubject" ></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox CssClass="form-control" ID="txtSubject" runat="server" Width="270px" meta:resourcekey="txtSubjectResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
              &nbsp;  <asp:Label ID="lblMessage" runat="server" Text="Message" meta:resourcekey="lblMessage"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox CssClass="form-control" ID="txtMessage" runat="server" TextMode="MultiLine" Width="270px" meta:resourcekey="txtMessageResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
               &nbsp; <asp:Label ID="lblUpload" runat="server" Text="Upload Course File" meta:resourcekey="lblUploadCourseFile"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" meta:resourcekey="FileUpload1Resource1" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5">
                <asp:Button ID="btnSend" class="btn btn-outline-info" runat="server" Text="Send" OnClick="btnSend_Click" Width="99px" meta:resourcekey="btnSend" />
            </td>
        </tr>
    </table>
    <br /> 
</asp:Content>
