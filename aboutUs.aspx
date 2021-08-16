<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="Training_School.aboutUs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <style type="text/css">
        .auto-style1 {
            width: 381px;
        }
        .auto-style2 {
            width: 381px;
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
            width: 255px;
        }
        .auto-style4 {
            width: 255px;
        }
        .auto-style5 {
            height: 33px;
        }
        .auto-style6 {
            width: 58px;
            height: 63px;
        }
        .auto-style7 {
            width: 30px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
              <div class="container">

         <div class="row">

            <div class="col-12">

               <center>
                   <br />
                   <img src="imgs/aboutus.jpg" style="width:100%; height:318px;" class="img-fluid" />

                   <br />
                   <br />
                   <br />

                  <h2 style="color:#2E86C1"><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="h2TeachOnline" Text="Teach Online: Engage with Confidence"></asp:Localize></h2>

               </center>

            </div>

         </div>
        <div>
            <br />
        <p class="text-justify"><asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="pTeachOnline" Text="Online learning doesn’t have to be a pale imitation of “real” in-person learning. It’s a whole new way of interacting with learners.
            What if instead of a boring, predictable series of discussion question posts and assignments, your online courses were a dynamic journey that surprises and engages learners?
            We will give faculty the confidence to create meaningful online learning experiences. Faculty have the skills to teach; we’ll show them how to transfer those skills to the online classroom."></asp:Localize></p>
            </div>

        <div>
            <br />
       <b><p class="text-justify" style="color:DodgerBlue; font-size:18px;"><img src="imgs/icon.PNG" class="auto-style7"/><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="pWhoWeAre" Text="Who we are?"></asp:Localize></p> </b>  
            <p class="text-justify"><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="pWeAreAnOnlineLearning" Text="We are an online learning environment that provide different courses
              in differnt aspects, demonstrated under the hands of experienced instructors, who are following several
                ways to deliver their knowledge to the trainees. We are giving the instructors and the trainees
                the flexibilty to engage with us by providing simple services with understandable process. The instructors have
                the ability to create thier won courses, and the trainess can join these courses by subscriping the desired courses
                and confirm the subscription by a smooth paying process, all of this can be done througth a bunch of clicks!"></asp:Localize>
            </p>
            </div>
        <br /><br />
        <img src="imgs/vision.PNG" style="margin-left:240px;" class="auto-style6" />
        <img src="imgs/mission.PNG" style="margin-left:470px;" class="auto-style6" />


        <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card" style="right: -40px; background-color: #ADD8E6; border: 2px solid black;">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3 style="color:DodgerBlue;" ><asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="h3OurVision" Text="OUR VISION"></asp:Localize></h3><hr />
                                    </center>
                            </div>
                        </div>

                        <%--<div class="row">
                            <div class="col">
                               
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="col">
                               <h7><i> <b class="text-justify"><asp:Localize ID="Localize6" runat="server" 
                       meta:resourcekey="h7OurVision" Text=" Training School's Vision is to inspires community engagement and inclusive learning environments through the use of emerging technologies
                                    and to make a comfortable, reachable, and timing friendly environment that will ease the learning process for everyone."></asp:Localize></b></i></h7>
                            </div>
                        </div>

                        <%--<div class="row">
                            <div class="col-4">
                               
                            </div>
                        </div>--%>


                    </div>
                </div>

               
            </div>
            <div class="col-md-5">

                <div class="card" style="right: -130px; background-color: #ADD8E6; border: 2px solid black; ">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h3 style="color:DodgerBlue;"><asp:Localize ID="Localize7" runat="server" 
                       meta:resourcekey="h3OURMISSION" Text="OUR MISSION"></asp:Localize></h3><hr />
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                               <h7><i> <b class="text-justify"><asp:Localize ID="Localize8" runat="server" 
                       meta:resourcekey="h7OURMISSION" Text="Our dynamic team serves the trainees by providing differnt training courses of different domains.
                                  Through creative problem solving, collaboration, and reflection we provide an environment for growth in teaching and learning in an effort to best support our students, faculty and staff."></asp:Localize></b></i></h7>
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>

    </div>
    <hr style="height:40px;"/>
                <img src="imgs/team1.jpg" style=  "width:75%; height:318px;  margin-left: 200px;" class="img-fluid" /> 
</center>
       
       <br />
    <div>
         <center>
            

       

             <br />
             <br />
                    <img src="imgs/team2.jpg" style="margin-left:10px;" class="auto-style6" />

              <div class="card" style="height:320px; width:650px;  background-color: #ADD8E6; border: 2px solid black;">
                    <div class="card-body">
                      
             <table class="w-95" style="text-align:justify">
                 <tr>
                     <td colspan="2" style="text-align:center; color:DodgerBlue; font-size: 18px;" class="auto-style5"><b><asp:Localize ID="Localize9" runat="server" 
                       meta:resourcekey="bDevelopedBy" Text="The website developed by"></asp:Localize></b>
                     <br /><hr />
                     </td>
                 </tr>
         
                 
                 <tr>
                     <td class="auto-style1">14 SE-I Reem Abo Rashed Sum2021</td>
                     <td class="auto-style4">Email: reem.aborashed@gmail.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style1">1064 SE-I Salma Abdalajawad Sum2021</td>
                     <td class="auto-style4">Email: salmaa3b@hotmail.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style1">1238 SD-I Sara Abdullah Alshreef Sum2021</td>
                     <td class="auto-style4">Email: sara1.alshreef@gmail.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style2">1166 SE-I Roaa Alsubaiee Sum2021</td>
                     <td class="auto-style3">Email: Roaa.sa@outlook.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style1">1204 HB-I Ahswaq Al-Shalahi Sum2021</td>
                     <td class="auto-style4">Email: ashwaqalshalahi@gmail.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style2">988 HB-I Anfal Abdulmohsen Alanazi Sum2021</td>
                     <td class="auto-style3">Email: anfalalanazi99@gmail.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style1">869 HB-I Ranem Saud Alfehaid Sum2021</td>
                     <td class="auto-style4">Email: Ranemalfehaid@gmail.com</td>
                 </tr>
                 <tr>
                     <td class="auto-style1">898 SE-I Nouf Al-Zumaia Sum2021</td>
                     <td class="auto-style4">Email: noufzumaia@gmail.com</td>
                 </tr>

                 <tr>
                     <td class="auto-style1">984 SE-I Hanan Ahmed Alghamdi Sum2021 </td>
                     <td class="auto-style4">Email: Hanangh694@gmail.com</td>
                 </tr>
             </table>

        </div>
            </div>
             </center>
            </div>

<br />
</asp:Content>
