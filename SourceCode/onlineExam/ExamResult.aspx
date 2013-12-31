<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ExamResult.aspx.cs" Inherits="onlineExam.ExamResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 10px;
            border: 1px solid #D3D3D3;
            background-color: #E4F6F1;
           
        }
        .style2
        {
            width: 20px;
            padding-left: 3px;
            border: 1px solid #D3D3D3;
        }
        .style3
        {
            width: 1px;
            padding-left: 3px;
            border: 1px solid #D3D3D3;
             font-weight:bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                EXAM RESULT</h3>
        </div>
        <div class="icerik">
            <table class="style1" cellpadding="5" cellspacing="5">
                <tr>
                    <td class="style3">
                        <span>Subject:</span>
                    </td>
                    <td class="style2">
                        <span>
                            <asp:Label ID="lblSubject" runat="server" Text=""></asp:Label></span>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <span>Starting Time :</span>
                    </td>
                    <td class="style2">
                        <span>
                            <asp:Label ID="lblStartTime" runat="server" Text=""></asp:Label></span>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <span>Time Taken In Minutes :</span>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblMin" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <span>Number of Questions :</span>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblNumberQuestions" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <span>Number of correct answers<span class="Apple-converted-space">&nbsp;:</span></span>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblNumberCorrectAns" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <span>Grade :</span>
                    </td>
                    <td class="style2">
                        <asp:Label ID="lblGrade" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <a href="ReviewQuestions.aspx" style="padding: 5px; border: 1px solid #D3D3D3;"><span style="color: Maroon;
                font-weight: bold;">Review Questions </span></a>
        </div>
    </div>
</asp:Content>
