<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ExamCategories.aspx.cs" Inherits="onlineExam.ExamCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .content-right a
        {
            text-decoration: underline !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                EXAM CATEGORIES
            </h3>
        </div>
        <div class="icerik">
            <asp:GridView ID="gridExamCategories" runat="server" BackColor="White" BorderColor="#CCCCCC"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="5" Width="100%"
                AllowPaging="True" OnPageIndexChanging="gridExamHistory_PageIndexChanging" 
                onrowcreated="gridExamCategories_RowCreated">
                <RowStyle ForeColor="#000066" />
                <Columns>
                    <asp:HyperLinkField Text="Update" DataNavigateUrlFields="CategoryID" 
                        DataNavigateUrlFormatString="ExamCategoryAddUpdate.aspx?id={0}" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                <RowStyle Font-Names="Verdana" Font-Size="9pt" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
