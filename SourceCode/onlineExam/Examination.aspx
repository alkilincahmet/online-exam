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
                        <span class="etiket">Subject :</span> <span class="etiket1">ASP.NET</span>
                    </td>
                    <td>
                        <span class="etiket">Question :</span> <span class="etiket1">1/5</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="etiket">Started At :</span> <span class="etiket1">14.12.2013 21:02:23</span>
                    </td>
                    <td>
                        <span class="etiket">Current Time : </span><span class="etiket1">14.12.2013 21:02:23</span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="icerik">

                <div class="question">
                            <h5 style="color:red; font-weight:bold;">
                Question :</h5>
                    <div class="question-img">
                     <%--   <img src="Images/Exam.jpg" />--%>
                    </div>
                    <div class="question-text">
                        <p>
                            How do you execute a page and return control to calling page ?
                        </p>
                    </div>
                    <div class="question-choices">
                        <div class="question-choice">
                            <div style="float: left;">
                                <input id="rbAns1" type="radio" name="answer" value="rbAns1" /></div>
                            <div style="margin-top: -4px; margin-left: 5px; float: left;">
                                server.transfer</div>
                        </div>
                        <div class="question-choice">
                            <div style="float: left;">
                                <input id="Radio1" type="radio" name="answer" value="rbAns1" /></div>
                            <div style="margin-top: -4px; margin-left: 5px; float: left;">
                                server.transfer</div>
                        </div>
                        <div class="question-choice">
                            <div style="float: left;">
                                <input id="Radio2" type="radio" name="answer" value="rbAns1" /></div>
                            <div style="margin-top: -4px; margin-left: 5px; float: left;">
                                server.transfer</div>
                        </div>
                        <div class="question-choice">
                            <div style="float: left;">
                                <input id="Radio3" type="radio" name="answer" value="rbAns1" /></div>
                            <div style="margin-top: -4px; margin-left: 5px; float: left;">
                                server.transfer</div>
                        </div>
                        <div class="question-choice">
                            <div style="float: left;">
                                <input id="Radio4" type="radio" name="answer" value="rbAns1" /></div>
                            <div style="margin-top: -4px; margin-left: 5px; float: left;">
                                server.transfer</div>
                        </div>
                    </div>

                    <div class="question-buttons">
                    
                    <div class="button-previos"><input type="submit" name="btnPrev" value="Previous" id="btnPrev"></div>
                    <div class="button-next"><input type="submit" name="btnNext" value="Next" id="btnNext"></div>
                     <div class="button-cancel"><input type="submit" name="btnNext" value="Cancel Exam" id="btnCancel"></div>
                    
                    
                    </div>

                    <div class="clear"></div>
                </div>

                
        </div>
    </div>
</asp:Content>
