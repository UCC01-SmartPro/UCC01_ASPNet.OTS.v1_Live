<%@ Page Title="" Language="C#" MasterPageFile="~/OTSv1.Master" AutoEventWireup="true" CodeBehind="OgrenciDuzenle.aspx.cs" Inherits="ASPNet.OTS.v1.OgrenciDuzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphdContent" runat="server">

    <asp:GridView ID="dgrdOgrenci" runat="server" 
        AutoGenerateColumns="false" 
        DataKeyNames="OgrenciID" 
        OnPageIndexChanging="dgrdOgrenci_PageIndexChanging" 
        OnRowCancelingEdit="dgrdOgrenci_RowCancelingEdit" 
        OnRowDeleting="dgrdOgrenci_RowDeleting" 
        OnRowEditing="dgrdOgrenci_RowEditing" 
        OnRowUpdating="dgrdOgrenci_RowUpdating">
        <Columns>
            <asp:BoundField DataField="OgrenciID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="OgrNo" HeaderText="Öğrenci No" />
            <asp:BoundField DataField="OgrAd" HeaderText="Ad" />
            <asp:BoundField DataField="OgrSoyad" HeaderText="Soyad" />
            <asp:BoundField DataField="SinifID" HeaderText="SınıfID" Visible="true" />
            <asp:BoundField DataField="SinifTnm" HeaderText="Sınıf" />
            <asp:BoundField DataField="OgrDT" HeaderText="OgrDT" Visible="true" />
            <asp:BoundField DataField="OgrDT" HeaderText="Doğum Tarihi" />
            <asp:BoundField DataField="OgrCinsiyet" HeaderText="OgrCinsiyet" Visible="false" />
            <asp:BoundField DataField="CinsTnm" HeaderText="Cinsiyet" />
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

</asp:Content>
