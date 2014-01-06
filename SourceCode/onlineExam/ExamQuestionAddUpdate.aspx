<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ExamQuestionAddUpdate.aspx.cs" Inherits="onlineExam.ExamQuestionAddUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                EXAM CATEGORIY ADD & UPDATE
            </h3>
        </div>
        <div class="icerik">
            <div class="contact_form">
                <ul>
                    <li>
                        <label for="name">
                            Exam :</label>
                        <asp:DropDownList ID="dropExams" DataTextField="ExamName" DataValueField="ExamID"
                            runat="server">
                        </asp:DropDownList>
                    <asp:Label ID="lblAlert1" runat="server" Text=""></asp:Label></li>

                     <li>
                        <label for="name">
                             Image :</label>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                   
                    </li>

                    <li>
                        <label for="name">
                            Question :</label>
                        <textarea runat="server" id="txtQuestion" type="text" placeholder="Question" required />
                    </li>
                    <li>
                        <label for="name">
                            Answer 1 :</label>
                        <input runat="server" id="txtAnswer1" type="text" placeholder="Answer 1" required />
                    </li>
                    <li>
                        <label for="name">
                            Answer 2 :</label>
                        <input runat="server" id="txtAnswer2" type="text" placeholder="Answer 2" required />
                    </li>
                    <li>
                        <label for="name">
                            Answer 3 :</label>
                        <input runat="server" id="txtAnswer3" type="text" placeholder="Answer 3" required />
                    </li>
                    <li>
                        <label for="name">
                            Answer 4 :</label>
                        <input runat="server" id="txtAnswer4" type="text" placeholder="Answer 4" required />
                    </li>
                    <li>
                        <label for="name">
                            Answer 5 :</label>
                        <input runat="server" id="txtAnswer5" type="text" placeholder="Answer 5" required />
                    </li>
                    <li>
                        <label for="name">
                            Correct Answer :</label>
                        <asp:DropDownList ID="dropCorrectAnswer" runat="server">
                        <asp:ListItem Value="1" >Answer 1</asp:ListItem>
                         <asp:ListItem Value="2" >Answer 2</asp:ListItem>
                          <asp:ListItem Value="3" >Answer 3</asp:ListItem>
                           <asp:ListItem Value="4" >Answer 4</asp:ListItem>
                            <asp:ListItem Value="5" >Answer 5</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li>
                        <asp:Button ID="btnSave" CssClass="submit" runat="server" Text="Add" OnClick="btnSave_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
