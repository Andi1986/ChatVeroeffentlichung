﻿<%@ Page Title="Startseite" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Chat.aspx.cs" Inherits="WebApplication1._Chat" EnableViewState="True" %>

<%@ Register TagPrefix="WebApplication1" Namespace="WebApplication1" Assembly="WebApplication1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        #BuddyList
        {
            width: 224px;
        }
    </style>
    <script language="javascript">
        function OpenChild() {
            var t = window.prompt("Name of friend you want to add:", "");
            document.getElementById('<%= FriendRequestId.ClientID %>').value = t;
            document.forms['form1'].submit();
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" />
    <asp:Label ID="WelcomeLabel" runat="server" Font-Bold="True" Font-Size="X-Large"
        Text="Chat Test"></asp:Label>
    <br />
    <br />
    <asp:UpdatePanel ID="ChatUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="BuddyList" style="width: 300px; height: 150px;">
                Buddys&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBoxList ID="ddlAllBuddys" runat="server">
                </asp:CheckBoxList>
                &nbsp;
                <asp:Button ID="NewChatButton" runat="server" OnClick="NewChatButton_Click" Text="Open new Chat" />
                &nbsp;
                <asp:Button ID="InviteButton" runat="server" onclick="InviteButton_Click" 
                    Text="Invite to Chat" />
            </div>
            In this Room:<br />
            <div id="Buddys" style="width: 640px; height: 73px; overflow: auto;">
                <asp:BulletedList ID="ChattersBulletedList" runat="server" />
            </div>
            <asp:Label ID="ChatRoomNameLabel" runat="server" Text="Label" Font-Bold="True"></asp:Label>
            <br />
            <div id="ChatText" style="width: 640px; height: 240px; overflow: auto;">
                <WebApplication1:RichTextBulletedList DisplayMode="Text" runat="server" ID="ChatMessageList" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    Send Message<asp:Panel ID="Panel1" runat="server" DefaultButton="SendButton">
        <asp:UpdatePanel ID="MessageBoxUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:TextBox ID="NewMessageTextBox" Columns="50" runat="server" />           
                <asp:Button ID="SendButton" runat="server" EnableViewState="false" OnClick="SendButton_Click"
                Text="Send" />
                &nbsp;
                <asp:Button ID="LeaveButton" runat="server" OnClick="LeaveButton_Click" 
                    Text="Leave Room" />
                &nbsp;
                <asp:Button ID="FriendUserButton" runat="server" Text="Friend User" OnClientClick="javascript:OpenChild()" />
                <br />
                Chatrooms:<br />
            </ContentTemplate>
        </asp:UpdatePanel>
         <asp:UpdatePanel ID="TextBoxUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:ListBox ID="ChatRoomListBox" runat="server" Height="82px" 
                    onselectedindexchanged="ChatRoomListBox_SelectedIndexChanged" Width="309px">
                </asp:ListBox>
                <asp:HiddenField ID="FriendRequestId" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <br />
    &nbsp;<asp:Button ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" Text="Logout" />
    &nbsp;<script type="text/javascript">
              function _SetChatTextScrollPosition() {
                  var chatText = document.getElementById("ChatText");
                  chatText.scrollTop = chatText.scrollHeight;
                  window.setTimeout("_SetChatTextScrollPosition()", 1);
              }

              window.onload = function () {
                  _SetChatTextScrollPosition();
              }
    </script><asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="ChatTextTimer" runat="server" Interval="1000" OnTick="ChatTextTimer_Tick" />
        </ContentTemplate>
    </asp:UpdatePanel>
    &nbsp;
</asp:Content>
