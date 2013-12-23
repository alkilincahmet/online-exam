<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="onlineExam.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                LATEST EXAMS</h3>
        </div>
        <div class="icerik">
            <asp:Repeater ID="repSoru" runat="server">
                <ItemTemplate>
                    <div class="icerik-soru">
                        <span><a href="TakeExam.aspx?cid=<%#Eval("CategoryID")%>&eid=<%#Eval("ExamID")%>">
                            <%#Eval("ExamName")%>
                            - (<%#Eval("NumberOfQuestion")%>) soru</a> </span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
