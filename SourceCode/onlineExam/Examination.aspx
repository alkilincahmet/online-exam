<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Examination.aspx.cs" Inherits="onlineExam.Examination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <table width="100%">
                <tr>
                    <td>
                        <span class="etiket">Subject :</span> <span class="etiket1">
                            <asp:Label ID="lblSubject" runat="server" Text=""></asp:Label></span>
                    </td>
                    <td>
                        <span class="etiket">Question :</span> <span class="etiket1">
                            <asp:Label ID="lblQuestionNo" runat="server" Text=""></asp:Label></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="etiket">Started At :</span> <span class="etiket1"><asp:Label ID="lblStartTime" runat="server" Text=""></asp:Label></span>
                    </td>
                    <td>
                        <span class="etiket">Current Time : </span><span class="etiket1"><asp:Label ID="lblCurrentTime" runat="server" Text=""></asp:Label></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="icerik">
            <div class="question">
                <h5 style="color: red; font-weight: bold;">
                    Question :</h5>
                <div class="question-img">
                    <%--   <img src="Images/Exam.jpg" />--%>
                </div>
                <div class="question-text">
                    <p>
                       <div runat=server id="question" >question</div>
                    </p>
                </div>
                <div class="question-choices">
                    <div class="question-choice">
                        <div style="float: left;">
                             <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" /></div>
                        <div style="margin-top: 9px; margin-left: 5px; float: left;">
                             <pre runat=server id="ans1"></pre></div>
                             
                    </div>

                       <div class="question-choice">
                        <div style="float: left;">
                             <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" /></div>
                        <div style="margin-top: 9px; margin-left: 5px; float: left;">
                             <pre runat=server id="ans2"></pre></div>
                             
                    </div>


                       <div class="question-choice">
                        <div style="float: left;">
                             <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" /></div>
                        <div style="margin-top: 9px; margin-left: 5px; float: left;">
                             <pre runat=server id="ans3"></pre></div>
                             
                    </div>


                       <div class="question-choice">
                        <div style="float: left;">
                             <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" /></div>
                        <div style="margin-top: 9px; margin-left: 5px; float: left;">
                             <pre runat=server id="ans4"></pre></div>
                             
                    </div>


                       <div class="question-choice">
                        <div style="float: left;">
                             <asp:RadioButton ID="rbAns5" runat="server" GroupName="answer" /></div>
                        <div style="margin-top: 9px; margin-left: 5px; float: left;">
                             <pre runat=server id="ans5"></pre></div>
                             
                    </div>
                   
                </div>
                <div class="question-buttons">
                    <div class="button-previos">
                        <asp:Button ID="btnPrev" runat="server" Text="Previous" CssClass="Submit" 
                            onclick="btnPrev_Click" />
                    </div>
                    <div class="button-next">
                        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="Submit" 
                            onclick="btnNext_Click" /></div>
                    <div class="button-cancel">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="Submit" 
                            onclick="btnCancel_Click" /></div>
                    <%--    <input type="submit" name="btnPrev" value="Previous" id="Submit1">
                    <input type="submit" name="btnNext" value="Next" id="Submit2">
                    <input type="submit" name="btnNext" value="Cancel Exam" id="Submit3">--%>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
