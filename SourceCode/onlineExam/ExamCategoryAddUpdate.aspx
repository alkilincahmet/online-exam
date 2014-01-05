<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ExamCategoryAddUpdate.aspx.cs" Inherits="onlineExam.ExamCategoryAddUpdate" %>

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
                        <li>
                            <label for="name">
                                Category Name:</label>
                            <input runat="server" id="txtCategoryName" type="text" placeholder="Category Name"
                                required />
                        </li>
                        <li>
                            <asp:Button ID="btnSave" CssClass="submit" runat="server" Text="Add" 
                                onclick="btnSave_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label>
                        </li>
                      
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
