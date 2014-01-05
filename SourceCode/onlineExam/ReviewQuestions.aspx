<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ReviewQuestions.aspx.cs" Inherits="onlineExam.ReviewQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                Review Questions</h3>
        </div>
        <div class="icerik">
            <asp:DataList ID="datalistQuestion" runat="server" Width="100%">
                <HeaderTemplate>
                    <a href="ExamResult.aspx" style="color: red">Show Result</a>
                    <hr size="5"  />
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="<%#(Eval("CorrectAnswer").ToString() == Eval("YourAnswer").ToString()) ? "answerTrue" : "answerFalse"%>" >
                        <div class="question-text">
                            <p>
                                <div style="color: black;"><%# DataBinder.Eval( Container.DataItem,"QuestionText")%></div>
                            </p>
                        </div>
                    
                        <div class="question-choices">
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>1.<%# DataBinder.Eval( Container.DataItem,"Answer1") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>2.<%# DataBinder.Eval( Container.DataItem,"Answer2") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>3.<%# DataBinder.Eval( Container.DataItem,"Answer3") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>4.<%# DataBinder.Eval( Container.DataItem,"Answer4") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>5.<%# DataBinder.Eval( Container.DataItem,"Answer5") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>Correct Answer : <%# DataBinder.Eval( Container.DataItem,"CorrectAnswer") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                            <div class="question-choice">
                                <div style="float: left;">
                                    <div>Your Answer : <%# DataBinder.Eval( Container.DataItem,"YourAnswer") %></div>
                                </div>
                                <div style="margin-top: 9px; margin-left: 5px; float: left;">
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <SeparatorTemplate>
                    <hr size="2" style="color: Red" />
                </SeparatorTemplate>
                <FooterTemplate>
                    <hr size="5" style="color: red" />
                    <a href="ExamResult.aspx">Show Result</a>
                </FooterTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
