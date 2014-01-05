<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ExamAddUpdate.aspx.cs" Inherits="onlineExam.ExamAddUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                EXAM ADD & UPDATE
            </h3>
        </div>
        <div class="icerik">
            <div class="contact_form">
                <ul>
                    <li>
                        <li>
                            <label for="name">
                                Category :
                            </label>
                            <asp:DropDownList ID="dropCategory" DataTextField="CategoryName" DataValueField="CategoryID"
                                runat="server">
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label for="name">
                                Exam Name :</label>
                            <input runat="server" id="txtExamName" type="text" placeholder="Exam Name"
                                required />
                        </li>
                        <li>
                            <label for="name">
                                Exam Time :</label>
                            <input runat="server" id="txtExamTime" type="text" placeholder="Exam Time"
                                required />
                        </li>
                        <li>
                            <label for="name">
                                Question Number :</label>
                            <input runat="server" id="txtQuestionNumber" type="text" placeholder="Quesion Number"
                                required />
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
