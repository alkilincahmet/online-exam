<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="TakeExam.aspx.cs" Inherits="onlineExam.TakeExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-right">
        <div class="baslik">
            <h3>
                TAKE EXAMINATION</h3>
        </div>
        <div class="icerik">
            <br />
            <table>
                <tr style="height:40px;">
                    <td >
                        <span style="font-family: Tahoma; font-weight:bold; font-size: 13px;">Select Category&nbsp; :</span>
                    </td>
                    <td>
                        &nbsp;
                        <asp:DropDownList ID="dropCategory" runat="server" Width="200">
                        </asp:DropDownList>
                    </td>
                </tr>
             
                <tr>
                    <td>
                        <span style="font-family: Tahoma; font-weight:bold; font-size: 13px;">Select Subject&nbsp;&nbsp;&nbsp;
                            :</span>
                    </td>
                    <td>
                        &nbsp;
                        <asp:DropDownList ID="dropSOrular" runat="server" Width="200">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <div class="button-previos">
                <input type="submit" name="b" value="Start" id="btnPrev"></div>
            <br />
            <div style="margin-top: 30px; font-family: Tahoma; font-size: 13px;">
                <span style="font-weight: bold">Note</span>
                <ul style="list-style: disc; margin-left: 40px;">
                    <li>Each exam contains 5 question.</li>
                    <li>Use Next and Previous buttons to navigate between questions</li>
                    <li>Result is displayed after the last questions is answered</li>
                    <li>CANCEL button can be used to cancel the exam</li>
                    <li>No time limitation. However the time taken is stored in database</li>
                </ul>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
