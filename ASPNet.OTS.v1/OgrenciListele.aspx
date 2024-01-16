<%@ Page Title="" Language="C#" MasterPageFile="~/OTSv1.Master" AutoEventWireup="true" CodeBehind="OgrenciListele.aspx.cs" Inherits="ASPNet.OTS.v1.OgrenciListele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphdContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="upnlQuery" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnelQueryOptions" runat="server" BorderStyle="Solid" BorderWidth="1" BorderColor="Black">
                <asp:Table ID="tbleQueryOptions" runat="server">
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell>
                            <asp:Label ID="Label2" runat="server" Text="Öğrenci No :"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="tboxOgrNo_Bas" runat="server"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="tboxOgrNo_Son" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell>
                            <asp:Label ID="Label3" runat="server" Text="Öğrenci Adı"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="tboxOgrAd_Bas" runat="server"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="tboxOgrAd_Son" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell>
                            <asp:Label ID="Label4" runat="server" Text="Öğrenci Soyadı"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="tboxOgrSoyad_Bas" runat="server"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="tboxOgrSoyad_Son" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell>
                            <asp:Label ID="Label5" runat="server" Text="Sınıf"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBoxList ID="chlbSinif" runat="server"></asp:CheckBoxList>
                        </asp:TableCell>
                        <asp:TableCell>
                            &nbsp;
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell>
                            <asp:Label ID="Label6" runat="server" Text="Doğum Tarihi"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Calendar ID="caldDT_Bas" runat="server"
                                BorderStyle="Solid"
                                DayHeaderStyle-BorderStyle="Ridge"
                                BackColor="White"
                                BorderColor="Black"
                                CellSpacing="1"
                                Font-Names="Verdana"
                                Font-Size="9pt"
                                ForeColor="Black"
                                Height="250px"
                                NextPrevFormat="ShortMonth"
                                Width="330px">
                                <DayHeaderStyle BorderStyle="Ridge" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt"></DayHeaderStyle>
                                <DayStyle BackColor="#CCCCCC" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                <TodayDayStyle BackColor="#999999" ForeColor="White" />                                
                            </asp:Calendar>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Calendar ID="caldDT_Son" runat="server"
                                BorderStyle="Solid"
                                DayHeaderStyle-BorderStyle="Ridge"
                                BackColor="White"
                                BorderColor="Black"
                                CellSpacing="1"
                                Font-Names="Verdana"
                                Font-Size="9pt"
                                ForeColor="Black"
                                Height="250px"
                                NextPrevFormat="ShortMonth"
                                Width="330px">
                                <DayHeaderStyle BorderStyle="Ridge" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt"></DayHeaderStyle>
                                <DayStyle BackColor="#CCCCCC" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                <TodayDayStyle BackColor="#999999" ForeColor="White" />                                  
                            </asp:Calendar>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell>
                            <asp:Label ID="Label7" runat="server" Text="Cinsiyet"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBoxList ID="chlbCinsiyet" runat="server">
                                <asp:ListItem Value="E">Erkek</asp:ListItem>
                                <asp:ListItem Value="K">Kadın</asp:ListItem>
                                <asp:ListItem Value="X">Belirtmek İstemiyor</asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:TableCell>
                        <asp:TableCell>
                            &nbsp;
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow VerticalAlign="Top">
                        <asp:TableCell ColumnSpan="3">
                            <asp:Button ID="btonQuery" runat="server" Text="Sorgula" OnClick="btonQuery_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>
            <asp:Panel ID="pnelQueryResults" runat="server">
                <asp:GridView ID="dgrdOgrenci" runat="server"
                     PageSize="15"
                    AllowPaging="false"

                    AutoGenerateColumns="false"
                    DataKeyNames="OgrenciID"
                    OnPageIndexChanging="dgrdOgrenci_PageIndexChanging"
                    OnRowCancelingEdit="dgrdOgrenci_RowCancelingEdit"
                    OnRowDeleting="dgrdOgrenci_RowDeleting"
                    OnRowEditing="dgrdOgrenci_RowEditing"
                    OnRowUpdating="dgrdOgrenci_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="OgrenciID" HeaderText="ID" />
                        <asp:BoundField DataField="OgrNo" HeaderText="Öğrenci No" />
                        <asp:BoundField DataField="OgrAd" HeaderText="Ad" />
                        <asp:BoundField DataField="OgrSoyad" HeaderText="Soyad" />
                        <asp:BoundField DataField="SinifID" HeaderText="SınıfID" Visible="false" />
                        <asp:BoundField DataField="SinifTnm" HeaderText="Sınıf" />
                        <asp:BoundField DataField="OgrDT" HeaderText="OgrDT" Visible="false" />
                        <asp:BoundField DataField="OgrDT" HeaderText="Doğum Tarihi" />
                        <asp:BoundField DataField="OgrCinsiyet" HeaderText="OgrCinsiyet" Visible="false" />
                        <asp:BoundField DataField="OgrCinsiyet" HeaderText="Cinsiyet" />
                        <asp:CommandField ShowEditButton="true" />
                        <asp:CommandField ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="dgrdOgrenci" />
        </Triggers>
    </asp:UpdatePanel>














</asp:Content>
