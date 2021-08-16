<%@ Page Title="" Language="C#" UICulture="auto" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Training_School.home" culture="auto" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
     .effect {
  padding: 25px;
  //background-color: green;
  transition: transform .2s; /* Animation */
  width: 350px;
  height: 220px;
  margin: 0 auto;
}

.effect:hover {
  transform: scale(1.5); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--     <ul class="navbar-nav">
    <li class="nav-item active">
        <asp:LinkButton class="nav-link" ID="lbtnEnglish" runat="server" OnClick="lbtn_Click" meta:resourceKey="lbtnEnglish"> English </asp:LinkButton>
    </li>
    <li class="nav-item active">
        <asp:LinkButton class="nav-link" ID="lbtnArabic" runat="server" OnClick="lbtn_Click" meta:resourceKey="lbtnArabic"> Arabic </asp:LinkButton>
    </li>
       </ul>--%>
    <section>
      <asp:Image runat="server" ImageUrl="imgs/studying1.jpeg" meta:resourcekey="imgWelcome" class="img-fluid"/>
   </section>
   <section>
       <br /> <br />
       <script>
           window.watsonAssistantChatOptions = {
               integrationID: "a678e20b-3528-4d15-a69c-78ebcfb47d65", // The ID of this integration.
               region: "eu-gb", // The region your integration is hosted in.
               serviceInstanceID: "75916cbc-17d4-429f-9ede-4bb8658e1dd0", // The ID of your service instance.
               onLoad: function (instance) { instance.render(); }
           };
           setTimeout(function () {
               const t = document.createElement('script');
               t.src = "https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js";
               document.head.appendChild(t);
           });
      </script>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2><asp:Localize ID="header" runat="server" 
                       meta:resourcekey="h2PrimaryC" Text="Our Primary Courses"></asp:Localize></h2>
              <br />
                   </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img class="effect" width="350px" height="215px" src="imgs/IT-Courses.png" />
                   <br /> <br />
                  <h4><asp:Localize ID="Localize1" runat="server" 
                       meta:resourcekey="h4IT" Text="Information Technology"></asp:Localize></h4>
                  <p class="text-justify"><asp:Localize ID="Localize2" runat="server" 
                       meta:resourcekey="pIT" Text="Information technology (IT) programs train students in computing technologies and how to use them to 
                      store, secure, manage, retrieve, and send information. IT includes physical equipment or hardware and operating systems 
                      and applications, known as software."></asp:Localize></p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img class="effect" width="350px" height="215px"  src="imgs/Data%20science-course.jpg" />
                  <br /> <br />
                  <h4><asp:Localize ID="Localize3" runat="server" 
                       meta:resourcekey="h4DS" Text="Data Science"></asp:Localize></h4>
                  <p class="text-justify"><asp:Localize ID="Localize4" runat="server" 
                       meta:resourcekey="pDS" Text="This Program offers highly-rated data science courses that will help you learn how to visualize 
                      and respond to new data, as well as develop innovative new technologies. Students will learn how to Implement machine
                      learning algorithms, and how to apply Statistical concepts such as probability, inference, and modeling in practice."></asp:Localize></p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img class="effect" width="350px" height="215px" src="imgs/cyber%20security-%20course.jpeg" />
                  <br /> <br />
                  <h4><asp:Localize ID="Localize5" runat="server" 
                       meta:resourcekey="h4CS" Text="Cyber Security"></asp:Localize></h4>
                  <p class="text-justify"><asp:Localize ID="Localize6" runat="server" 
                       meta:resourcekey="pCS" Text="The program introduces students to cryptography, security management, wireless networking, and 
                      organizational policy. Topics include an overview of information security frameworks; network infrastructure security; 
                      security and cryptography; information security policy; and defense in depth."></asp:Localize></p>
               </center>
            </div>
      </div>
   </section>
   <section> 
      <img src="imgs/studying2.jpeg" style="width:100%; height:318px; margin-top: 88px;" class="img-fluid"/>
   </section>
   <section>
       <br /> <br />
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2><asp:Localize ID="Localize7" runat="server" 
                       meta:resourcekey="h2Services" Text="Our Services"></asp:Localize></h2>
                  <p><b><asp:Localize ID="Localize8" runat="server" 
                       meta:resourcekey="pPrimaryServices" Text="We Have 3 Primary Services"></asp:Localize></b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img class="effect" style=" width:250px; height:227px;" src="imgs/take%20course.jpg" />
                   <br /> <br />
                  <h4><asp:Localize ID="Localize9" runat="server" 
                       meta:resourcekey="h4TakeCourses" Text="Take Courses"></asp:Localize></h4>
                  <p class="text-justify"><asp:Localize ID="Localize10" runat="server" 
                       meta:resourcekey="pTakeCourses" Text="Learn new knowledge and skills in a variety of ways by engaging video lectures demonstrated under the hands of experienced instructors."></asp:Localize></p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img class="effect" style=" width:250px; height:250px;" src="imgs/create%20course.png"/>
                  <h4><asp:Localize ID="Localize11" runat="server" 
                       meta:resourcekey="h4CreateCourses" Text="Create Courses"></asp:Localize></h4>
                  <p class="text-justify"><asp:Localize ID="Localize12" runat="server" 
                       meta:resourcekey="pCreateCourses" Text="Engage in the teaching process, discover innovative practices, and gain recognition for your work."></asp:Localize></p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img class="effect" style="width:250px; height:200px; margin-top:50px;" src="imgs/subscribe.png"/>
                  <h4><asp:Localize ID="Localize13" runat="server" 
                       meta:resourcekey="h4Subscribe" Text="Subscribe"></asp:Localize></h4>
                  <p class="text-justify"><asp:Localize ID="Localize14" runat="server" 
                       meta:resourcekey="pSubscribe" Text="Sign up to subscriptions, so you can learn what you need, when you need it, by gaining access to numerous, high quality courses."></asp:Localize></p>
               </center>
            </div>
         </div>
      </div>
   </section>
    <br /> <br />

</asp:Content>
